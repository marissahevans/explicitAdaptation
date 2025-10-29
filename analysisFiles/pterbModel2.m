function [lsTot, AS, fb, ASsem, fbSem] = pterbModel2(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim,bias1)
%Model 2 - Two update deltas are calculated, one based on target error for the motor plan, and another based on estimated endpoint error for the proprioceptive recalibration. 
% 7 parameters. Circle size based on proprioceptively sensed position and uncertainty. 

%initalizing variables
aimNoise = zeros(1,numTrial);
aimNoise(21:70) = sigma_aim;
bias = zeros(1,numTrial);
bias(21:70) = bias1;
delta1 = zeros(1,numTrial);     %inital condition for motor adaptation
delta2 = zeros(1,numTrial);     %inital contidion for proprioceptive adaptation
feedback1 = zeros(1,numTrial);
endPtAngle = zeros(numTrial,numSims);
arcSelect = zeros(numTrial,numSims);
tar = 0;

for sims = 1:numSims
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
        delta1(jj+1) = delta1(jj) + alpha_m*feedback1(jj)-bias(jj);
        delta2(jj+1) = delta2(jj) + alpha_p*senErr;
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