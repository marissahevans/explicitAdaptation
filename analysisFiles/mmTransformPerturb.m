%% Whats happening in this script -
%This script cleans, organizes and centers the raw data. First it
%transforms all points into mm from Wacom tablet coordinates (A.U.), then
%rotates the endpoints for trials where a confidence judgement was made and
%centers them all on the same target location.

%For the control experiment a quick fit is done of the motor error and
%propioceptive error marginasls as an idiot check before running the full
%model to make sure nothing wacky is going on there.


%A file is saved with the confidence reports, points earned, points
%possible, shifted X,Y endpoint coordinates, original enpoint coordnates,
%original target coordinates for all confidence trials, and control
%experiment endpoints, and control experiment indicated points, plus the
%marginals for reach error and proprioceptive error.


%% Setting up tablet specifics
radiusWac = linspace(0,69,150);

xCen = 238;                                 %center of tablet x coordinate
yCen = 134;                                 %cetner of tablet y coordinate
startX = 238;                               %reach start point X
startY = 43;                                %reach start point Y
t = [xCen yCen];                            %target location for all trials
tabSize = [268 476];                        %outside bounds of tablet space
matNan = nan(tabSize);                      %matrix of nans the size of the tablet

%% Find all distances to target on tablet
for ii = 1:size(matNan,1)
    for jj = 1:size(matNan,2)
        distFromTarget(ii,jj) = sqrt((jj - t(1))^2 + (ii-t(2))^2);
    end
end

maxDistAll = 0:max(round(distFromTarget(:))); %range of distance to max distance on the tablet.
testDist = max(maxDistAll);                 %distance range radius from target tested for s
possibleCircles = 0:testDist;               %based on the maximum radius possible that returns points

%% Load participant data - looping over sessions
subjAll = [{'MF'}];
for ss = 1:length(subjAll)
    subj = subjAll{ss};
    path = sprintf('/Users/marissa/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);          
    
    if subj == 'MF'
        R1 = 'MF_perturb_exp_S0_2023-04-28_15-50_controlresults';
        D1 = 'MF_perturb_exp_S0_2023-04-28_15-50_dispInfo';
        R2 = 'MF_perturb_exp_S2_2023-01-24_17-21_results';
        D2 = 'MF_perturb_exp_S2_2023-01-24_17-21_dispInfo';
        R3 = 'MF_perturb_exp_S3_2023-01-25_16-02_results';
        D3 = 'MF_perturb_exp_S3_2023-01-25_16-02_dispInfo';
        R4 = [];
        D4 = [];
        
    end
    
    confCirc = [];
    endPoints = [];
    endPtsFB = [];
    rawEndpoints = [];
    rawTarg = [];
    
    for ii = 1 %:4 %number of sessions
        if ii == 1
            %control session
            load(sprintf('%s',path,'/',R1,'.mat'));
            load(sprintf('%s',path,'/',D1,'.mat'));
            
        elseif ii == 2
            %experimental sessions
            load(sprintf('%s',path,'/',R2,'.mat'));
            load(sprintf('%s',path,'/',D2,'.mat'));
        elseif ii == 3
            load(sprintf('%s',path,'/',R3,'.mat'));
            load(sprintf('%s',path,'/',D3,'.mat'));
        elseif ii == 4
            load(sprintf('%s',path,'/',R4,'.mat'));
            load(sprintf('%s',path,'/',D4,'.mat'));
        end
        %% Creating transforms from calibration
        
        %Inverse transform to get from pixel to tablet space
        invtform = invert(displayInfo.tform);           %Inverse transformation from participant's calibration
        
        %Creating a matrix for the calibration points in tablet space
        wacX = displayInfo.calibration{1,6};
        wacY = displayInfo.calibration{1,7};
        wac = [wacX' wacY'];
        
        %Calibration point locations in mm measurments from edge of tablet active
        %area
        mmWacSpace = [23,244; 23,134; 23,27; 238,244; 238,134; 238,27; 446, 244; 446,134; 446,27;];
        
        %affine transform from tablet space to mm
        M = affine_least_square(wac(2,1),wac(2,2),wac(5,1),wac(5,2),wac(6,1),wac(6,2), mmWacSpace(2,1),mmWacSpace(2,2),mmWacSpace(5,1),mmWacSpace(5,2),mmWacSpace(6,1),mmWacSpace(6,2));
        tformMM = affine2d(M');
        
        
        %% CONTROL EXPERIMENT (session 1)
        if ii == 1
            
            %converting target to mm space
            [target1(1), target1(2)] = (transformPointsForward(invtform,contResultsMat.targetLoc(1),contResultsMat.targetLoc(2)));
            [target1(1), target1(2)] = (transformPointsForward(tformMM,target1(1),target1(2)));
            
            p_vec = 1:100;      % vector of possible proprioceptive noise values
            m_vec = 1:100;      % vector of possible motor noise values
            
            reaches = [contResultsMat.wacEndPoint(61:360,1),contResultsMat.wacEndPoint(61:360,2)];
            [reaches(:,1), reaches(:,2)] = transformPointsForward(tformMM,reaches(:,1),reaches(:,2));
            
            % Participant-reported endpoint converted to mm space - known to the experimenter
            mouse = [contResultsMat.mouseEndPt(61:end,1),contResultsMat.mouseEndPt(61:end,2)];
            [indicated(:,1), indicated(:,2)] = (transformPointsForward(invtform,mouse(:,1),mouse(:,2)));
            [indicated(:,1), indicated(:,2)] = (transformPointsForward(tformMM,indicated(:,1),indicated(:,2)));
            
            % Simultaneously estimate sigma_m and sigma_p by ML
            
            LL=zeros(length(m_vec),length(p_vec));
            LLigivene=zeros(length(m_vec),length(p_vec));
            LLe=zeros(length(m_vec),1);
            
            %remove outliers 
            dist = sqrt((reaches(:,1) - indicated(:,1)).^2 + (reaches(:,2)-indicated(:,2)).^2);
            reaches = reaches(dist<100,:);
            indicated = indicated(dist<100,:);
            
            for vv = 1:length(m_vec)        %loop over all sigma_m options
                RmTemp = 1/m_vec(vv)^2;
                
                % log likelihood of sigma_m given target and endpoint:
                LLe(vv) = log2disotnormal(reaches,target1,m_vec(vv));
                for jj = 1:length(p_vec)    %loop over all sigma_p options
                    RpTemp = 1/p_vec(jj)^2;
                    meanigivene = (RpTemp/(RpTemp+RmTemp))*reaches + ...
                        (RmTemp/(RpTemp+RmTemp))*target1;
                    SDigivene = (RpTemp/(RpTemp+RmTemp))*p_vec(jj);
                    
                    % log likelihood of sigma_p given sensed location and endpoint:
                    LLigivene(vv,jj) = log2disotnormal(indicated,meanigivene,SDigivene);
                    
                    % log likelihood of the sigma_p/sigma_m pair:
                    LL(vv,jj) = LLe(vv) + LLigivene(vv,jj);
                end
            end
            
            % treat LL like a log posterior (i.e., treat prior as flat over the grid)
            % and calculate marginals. First add a constant to all LL values so that
            % the maximum is one (to minimize underflows) and normalize afterward.
            
            NormPost = exp(LL - max(LL(:)));
            
            %Motor Error Marginal
            mmarg = sum(NormPost,2);
            mmarg = mmarg/sum(mmarg);
            sigMmarg = m_vec(find(mmarg == max(mmarg)));
            
            %Proprioception Marginal
            pmarg = sum(NormPost,1);
            pmarg = pmarg/sum(pmarg);
            sigPmarg = p_vec(find(pmarg == max(pmarg)));
            
            %output variables
            contReach = reaches;
            contTar = target1;
            contInd = indicated;
            
            figure
            scatter(reaches(:,1),reaches(:,2))
            hold on
            scatter(target1(1),target1(2))
            scatter(indicated(:,1),indicated(:,2))
            
            %% CONFIDENCE EXPERIMENT (session 2-4)
        else
            
            %% Converting participant data to mm space
            %create index of confidence judgement trials
            confTrial = resultsMat.confRad ~= 0;        %select only trials where a confidence judgment was made
            conf = resultsMat.confRad(confTrial);      %Confidence reports from data
            pointsEarned = resultsMat.pointsEarned;
            pointsPoss = resultsMat.pointsPossible;
            
            for jj = 1:length(conf)
                temp = conf(jj);
                [temp1, temp2] = transformPointsForward(invtform,temp+displayInfo.xCenter,displayInfo.yCenter);
                dataConf(jj,:) = (transformPointsForward(tformMM,temp1,temp2))-xCen;
            end
            
            endPts = resultsMat.wacEndPoint;
            [endPts(:,1), endPts(:,2)] = transformPointsForward(tformMM,endPts(:,1),endPts(:,2));
            
            [target(:,1), target(:,2)] = (transformPointsForward(invtform,resultsMat.targetLoc(:,1),resultsMat.targetLoc(:,2))); %transform target locations into wacom space
            [target(:,1), target(:,2)] = transformPointsForward(tformMM,target(:,1),target(:,2));
            
            %Rotate points to center coordinates
            for tt = 1:length(target)
                
                %Finding the angle from the starting point, the center of the tablet,
                %and the target location
                cosTheta = dot(target(tt,:)-[startX,startY],[xCen,yCen]-[startX,startY])/((sqrt((startX - target(tt,1))^2 + (startY-target(tt,2))^2))*(sqrt((startX - xCen)^2 + (startY-yCen)^2)));
                theta = real(acosd(cosTheta));
                
                %choose if rotation is clockwise or counter clockwise
                if target(tt,1) <= 238
                    R = [cosd(theta) sind(theta); -sind(theta) cosd(theta)];
                else
                    R = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
                end
                
                % Rotate target points
                targetShift = R*(target(tt,:)'-[startX; startY]) + [startX; startY];
                
                %Collapse across y space
                yShift = targetShift(2)-yCen;
                
                %rotate data points by target angle then shift by difference in Y
                endPtsShift(tt,:) = R*(endPts(tt,:)'-[startX; startY]) + [startX; startY] - [0; yShift];
                
            end
            
            confCirc = [confCirc; dataConf];
            endPoints = [endPoints; endPtsShift(confTrial,:)];
            endPtsFB = [endPtsFB; endPtsShift(~confTrial,:)];
            rawEndpoints = [rawEndpoints; endPts];
            rawTarg = [rawTarg; target];
            
            
            
        end
    end

% figure
% scatter(endPoints(:,1),endPoints(:,2))
% ylim([0 tabSize(1)])
% xlim([0 tabSize(2)])

filename = sprintf('%s_output.mat',subj);
save(fullfile(path,filename), 'confCirc', 'endPoints','endPtsFB','sigMmarg','sigPmarg','rawEndpoints','rawTarg','contTar','contReach','contInd') %,'pointsEarned','pointsPoss')

clear indicated
end
% direct computation of log(p(data|mu,sigma))
% data is Nx2
% mu is 1x2 or Nx2
% sigma is a scalar SD of the isotropic 2-d Gaussian

function ll = log2disotnormal(data,mu,sigma)

centered = data - mu;
N = size(data,1);
ll = -N*log(2*pi) - 2*N*log(sigma) - (sum(centered(:).^2)/(2*sigma^2));
end