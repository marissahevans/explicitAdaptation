function [lsTot, AS, fb, ASsem, fbSem] = pterbModel1(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,sigma_m,alpha_m,sigma_aim,alpha_mf,bias1)
%Perturb project model #1, only uses motor priors and learning from prior
%feedback to determine circle size. Does not incorporate trial to trial
%proproiceiton. 


%initalizing variables
aimNoise = zeros(1,numTrial);
aimNoise(21:70) = sigma_aim;
bias = zeros(1,numTrial);
bias(21:70) = bias1;
sigma_mf1 = zeros(1,numTrial);       %initial condition for percieved motor noise (VARIANCE)
sigma_mf1(1) = sigma_m;
delta1 = zeros(1,numTrial);     %inital condition for motor adaptation
feedback1 = zeros(1,numTrial);
endPtAngle = zeros(numTrial,numSims);
arcSelect = zeros(numTrial,numSims);
tar = 0;

for sims = 1:numSims
    for jj = 1:numTrial
        perturb = ptb(jj);
        tarHat = tar-delta1(jj);
        endPtAngle(jj,sims) = (sigma_m+aimNoise(jj))*randn+tarHat;

        phit = normcdf(arcSize,0,sigma_mf1(jj));

        gain = phit.*r; %probability of a hit vs points possible at each distance

        %Radius point for each distance with the highest gain
        arcSelect(jj,sims) = arcSize(find(gain == max(gain),1,'last'));

        feedback1(jj) = endPtAngle(jj,sims) + perturb;

        delta1(jj+1) = delta1(jj) + alpha_m*feedback1(jj)-bias(jj);

        sigma_mf1(jj+1) = sqrt((1-alpha_mf)*sigma_mf1(jj)^2+alpha_mf*feedback1(jj)^2);

    end
    feedback(:,sims) = feedback1;

    AS = mean(arcSelect,2);
    ASsem = std(arcSelect')/sqrt(length(arcSelect));
    fb = mean(feedback,2);
    fbSem = std(feedback')/sqrt(length(feedback));
    lsFeed = sum((fb - feedbackErrmean(1:numTrial)).^2);
    lsConf = sum((AS - confmean(1:numTrial)).^2);
    lsTot = lsFeed + lsConf;

end
end