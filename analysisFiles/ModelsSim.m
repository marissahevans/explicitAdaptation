%Script to simulate and test potential models for perturbation experiment.
%Started 6/15/23 Marissa Fassold

%Models to test:

%model 1 no propriocpetion used, delta update on motor plan only

%model 2 Confidence is based solely on proprioception. Delta update on
%motor plan.

%model 3 Two deltas are calculated, one based on target error for the motor
%plan, and another based on estimated endpoint error for the proprioceptive
%recalibration.

%task specifics
tar = 0;        %target angle
numTrial = 100;      %number of trials
numSims = 100;
arcSize = 0:45; %possible arc angles
maxDist = length(arcSize);
r = [10,linspace(10,0,length(2:length(arcSize)))];
ptb = zeros(1,numTrial);
ptb(20:70) = 20;
aimNoise = zeros(1,numTrial);
feedback = [];
sigma_d1 = 1;
sigma_d2 = 2;


%All possible parameter values
Alpha_mf = .1:.3:1; %all models, number of n-back trials that are used to calculate sigma_mf
Sigma_m = 1:10; %all models
Alpha_m = .1:.3:1; %all models
Sigma_p = 1:10; %models 1 - 4
Alpha_p = .1:.3:1; %models 1 - 4
Bias = .7:.1:1;
Sigma_aim = 2:2:10;

% % %1 iteration timing test
% Sigma_m = 6; %all models - true motor noise
% Sigma_p = 5; %models 1 - 4 - true proprioceptive noise
% Alpha_m = .7; %all models - sensitivity to feedback on aiming
% Alpha_p = 1; %models 1 - 4 - sensitivity to feeback on prop. adaptation
% Bias = .9; %bias on delta update
% Sigma_aim = 8; %added error when aiming
% Alpha_mf = 1; %models 1,3,4,5 - sensititvity to feedback on perceived motor noise

%ptbTemp = normpdf(0:50,0,5.5);
%ptb(20:70) = find(ptbTemp == min(ptbTemp(ptbTemp>.0001)));

matSize = [numTrial,length(Sigma_m),length(Sigma_p),length(Alpha_m),length(Alpha_p),length(Bias),length(Sigma_aim),length(Alpha_mf)];

mSig = nan(matSize);
SEMSig = nan(matSize);
mArc = nan(matSize);
SEMArc = nan(matSize);
mErr = nan(matSize);
SEMErr = nan(matSize);
mFeed = nan(matSize);
SEMFeed = nan(matSize);
m1 = nan(matSize);
SEM1 = nan(matSize);
m2 = nan(matSize);
SEM2 = nan(matSize);
sigM = nan(matSize);
sigP = nan(matSize);

tic
for model = 1:3

    %% Setting up variables and parameters for trial simulation


    %set parameters
    for sm = 1:length(Sigma_m)
        sigma_m = Sigma_m(sm);        %motor noise
        for sp = 1:length(Sigma_p)
            sigma_p = Sigma_p(sp);       %proprioceptive noise
            for b1 = 1:length(Bias)
                bias = Bias(b1);            %bias on delta update
                for ap = 1:length(Alpha_p)
                    alpha_p = Alpha_p(ap);       %0-1 learning rate for proproceptive adaptation
                    for am = 1:length(Alpha_m)
                        alpha_m = Alpha_m(am);      %0-1 learning rate for motor adaptation
                        for amf = 1:length(Alpha_mf)
                            alpha_mf = Alpha_mf(amf);           %learning rate to for sigma_mf
                            for saim = 1:length(Sigma_aim)
                                sigma_aim = Sigma_aim(saim);       %added error with aiming roatation
                                aimNoise(20:70) = sigma_aim;


                                endPtAngle = zeros(numTrial,numSims);
                                arcSelect = zeros(numTrial,numSims);

                                for sims = 1:numSims %PARFOR here if pooling
                                    %initalizing variables
                                    sigma_mf1 = zeros(1,numTrial);       %initial condition for percieved motor noise (VARIANCE)
                                    sigma_mf1(1) = sigma_m;
                                    sigma_pf1 = zeros(1,numTrial);       %initial condition for percieved motor noise (VARIANCE)
                                    sigma_pf1(1) = sigma_p;
                                    sigma_M = ones(1,numTrial);        %inital condition for kalman motor variance update
                                    sigma_P = ones(1,numTrial);        %inital condition for kalman proprioceptive variance
                                    delta1 = zeros(1,numTrial);     %inital condition for motor adaptation
                                    delta2 = zeros(1,numTrial);     %inital contidion for proprioceptive adaptation
                                    feedback1 = zeros(1,numTrial);
                                    tarErr = 0;     %inital taget error

                                    %% Model 1 %does not use proprioception
                                    if model == 1

                                        for jj = 1:numTrial
                                            perturb = ptb(jj);
                                            tarHat = tar-delta1(jj);
                                            endPtAngle(jj,sims) = (sigma_m+aimNoise(jj))*randn+tarHat;

                                            phit = normcdf(arcSize,0,sigma_mf1(jj));

                                            gain = phit.*r; %probability of a hit vs points possible at each distance

                                            %Radius point for each distance with the highest gain
                                            arcSelect(jj,sims) = arcSize(find(gain == max(gain),1,'last'));

                                            feedback1(jj) = endPtAngle(jj,sims) + perturb;

                                            delta1(jj+1) = bias*delta1(jj) + alpha_m*feedback1(jj);

                                            sigma_mf1(jj+1) = sqrt((1-alpha_mf)*sigma_mf1(jj)^2+alpha_mf*feedback1(jj)^2);

                                        end

                                        d1(:,sims) = delta1;
                                        feedback(:,sims) = feedback1;
                                        sigma_mf(:,sims) = sigma_mf1;

                                        %For independent testing:
                                        err1 = mean(endPtAngle,2);
                                        AS1 = mean(arcSelect,2);
                                        fb1 = mean(feedback,2);
                                        err1SEM = std(endPtAngle')/sqrt(length(endPtAngle));
                                        fb1SEM = std(feedback')/sqrt(length(feedback));
                                        AS1SEM = std(arcSelect')/sqrt(length(arcSelect));



                                        %% Model 2 - ONLY uses proprioception
                                    elseif model == 2

                                        for jj = 1:numTrial
                                            perturb = ptb(jj);
                                            tarHat = tar-delta1(jj);
                                            endPtAngle(jj,sims) = (sigma_m+aimNoise(jj))*randn+tarHat;

                                            sensed = sigma_p*randn+endPtAngle(jj,sims);
                                            sensedHat(jj) = sensed + delta2(jj);

                                            phit = normcdf(arcSize,abs(sensedHat(jj)),sigma_p^2);
                                            gain = phit.*r;
                                            arcSelect(jj,sims) = arcSize(find(gain == max(gain),1,'last'));

                                            feedback1(jj) = endPtAngle(jj,sims) + perturb;
                                            senErr = feedback1(jj) - sensedHat(jj);
                                            delta1(jj+1) = bias*delta1(jj) + alpha_m*feedback1(jj);
                                            delta2(jj+1) = delta2(jj) + alpha_p*senErr;


                                        end

                                        d1(:,sims) = delta1;
                                        d2(:,sims) = delta2;
                                        feedback(:,sims) = feedback1;

                                        %For independent testing:
                                        fb2 = mean(feedback,2);
                                        err2 = mean(endPtAngle,2);
                                        AS2 = mean(arcSelect,2);
                                        err2SEM = std(endPtAngle')/sqrt(length(endPtAngle));
                                        fb2SEM = std(feedback')/sqrt(length(feedback));
                                        AS2SEM = std(arcSelect')/sqrt(length(arcSelect));


                                        %% Model 3
                                        %mix of priors and proprioception
                                        %with delta  update
                                    elseif model == 3

                                        for jj = 1:numTrial
                                            perturb = ptb(jj);
                                            tarHat = tar-delta1(jj);
                                            endPtAngle(jj,sims) = (sigma_m+aimNoise(jj))*randn+tarHat;

                                            sensed = sigma_p*randn+endPtAngle(jj,sims);
                                            sensedHat = sensed + delta2(jj);

                                            %distances of sensed enpoints from the target
                                            Rm = 1/sigma_mf1(jj)^2;
                                            Rp = 1/sigma_p^2;
                                            var_pos = 1/(Rp+Rm);
                                            mu_pos = (Rm/(Rp+Rm)).*tar + (Rp/(Rp+Rm)).*sensedHat;

                                            phit = normcdf(arcSize,abs(mu_pos),var_pos);
                                            gain = phit.*r;

                                            %selected circle size from the look up table
                                            arcSelect(jj,sims) = arcSize(find(gain == max(gain),1,'last'));

                                            feedback1(jj) = endPtAngle(jj,sims) + perturb;
                                            senErr = feedback1(jj) - sensedHat;
                                            delta1(jj+1) = bias*delta1(jj) + alpha_m*feedback1(jj);
                                            delta2(jj+1) = delta2(jj) + alpha_p*senErr;

                                            sigma_mf1(jj+1) = sqrt((1-alpha_mf)*sigma_mf1(jj)^2+alpha_mf*feedback1(jj)^2);

                                        end

                                        d1(:,sims) = delta1;
                                        d2(:,sims) = delta2;
                                        feedback(:,sims) = feedback1;
                                        sigma_mf(:,sims) = sigma_mf1;

                                        %For independent testing:
                                        err3 = mean(endPtAngle,2);
                                        AS3 = mean(arcSelect,2);
                                        fb3 = mean(feedback,2);
                                        err3SEM = std(endPtAngle')/sqrt(length(endPtAngle));
                                        fb3SEM = std(feedback')/sqrt(length(feedback));
                                        AS3SEM = std(arcSelect')/sqrt(length(arcSelect));



                                    end

                                    % Saving output variables


                                    %confidence arc
                                    mArc(:,sm,sp,am,ap,b1,saim,amf) = mean(arcSelect,2);
                                    SEMArc(:,sm,sp,am,ap,b1,saim,amf) = std(arcSelect,0,2)/sqrt(size(arcSelect,2));
                                    %error distance
                                    mErr(:,sm,sp,am,ap,b1,saim,amf) = mean(endPtAngle,2);
                                    SEMErr(:,sm,sp,am,ap,b1,saim,amf) = std(endPtAngle,0,2)/sqrt(size(endPtAngle,2));
                                    %feedback
                                    mFeed(:,sm,sp,am,ap,b1,saim,amf) = mean(feedback,2);
                                    SEMFeed(:,sm,sp,am,ap,b1,saim,amf) = std(feedback,0,2)/sqrt(size(feedback,2));
                                    %delta 1
                                    m1(:,sm,sp,am,ap,b1,saim,amf) = mean(d1(2:end,:),2);
                                    SEM1(:,sm,sp,am,ap,b1,saim,amf) = std(d1(2:end,:),0,2)/sqrt(size(d1(2:end,:),2));

                                    %sigma_mf
                                    if model ~= 2
                                        mSig(:,sm,sp,am,ap,b1,saim,amf) = mean(sigma_mf(2:end,:),2);
                                        SEMSig(:,sm,sp,am,ap,b1,saim,amf) = std(sigma_mf(2:end,:),0,2)/sqrt(size(sigma_mf(2:end,:),2));
                                    end

                                    %delta 2
                                    if model ~= 1
                                        m2(:,sm,sp,am,ap,b1,saim,amf) = mean(d2(2:end,:),2);
                                        SEM2(:,sm,sp,am,ap,b1,saim,amf) = std(d2(2:end,:),0,2)/sqrt(size(d2(2:end,:),2));
                                    end

                                end
                            end
                        end
                    end
                end
            end
        end
    end




    parameters = {Sigma_m, Sigma_p, Alpha_m, Alpha_p, Bias, Sigma_aim, Alpha_mf};

    if model == 1
        save('perturbSim0.mat','mSig','SEMSig','mArc','SEMArc','mErr','SEMErr','m1','SEM1','mFeed','SEMFeed','parameters')
    end
    if model == 2
        save('perturbSim1.mat','mArc','SEMArc','mErr','SEMErr','m1','SEM1','m2','SEM2','mFeed','SEMFeed','parameters')
    end
    if model == 3
        save('perturbSim2.mat','mSig','SEMSig','mArc','SEMArc','mErr','SEMErr','m1','SEM1','m2','SEM2','mFeed','SEMFeed','parameters')
    end
    
end
toc


