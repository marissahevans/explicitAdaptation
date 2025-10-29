%PARPOOL VERSION OF MODEL FITS USING BADS - PERTERBATION PROJECT

currentDir                  = pwd;
[projectDir, ~]             = fileparts(currentDir);
addpath(genpath(fullfile(projectDir, 'data')))
addpath(genpath(fullfile(projectDir, 'bads-master')));

subj = 'SM'
load(sprintf('%s_LSoutput.mat',subj));

numTrial = 70;      %number of trials
numBlocks = 12;
numIts = 40;
numSims = 1000;

ptb = zeros(1,numTrial);
ptb(20:70) = 20;
arcSize = 0:45; %possible arc angles
r = [10,linspace(10,0,length(2:length(arcSize)))];
parpool(10);

%Initalize variables for parfor loop
x1 = zeros(numBlocks,5,numIts);
ls1 = zeros(numIts, numBlocks);

x2 = zeros(numBlocks,6,numIts);
ls2 = zeros(numIts, numBlocks);

x3 = zeros(numBlocks,7,numIts);
ls3 = zeros(numIts, numBlocks);

cvLS1 = zeros(numIts,numBlocks);
cvLS2 = zeros(numIts,numBlocks);
cvLS3 = zeros(numIts,numBlocks);

parfor gg = 1:numIts %number of full simulation sets
    
    for cv = 1:numBlocks %cross validation loop
        samp = logical(zeros(1,numBlocks));
        samp(cv) = 1;
        
        feedbackErrmean = mean(feedbackErr(:,~samp),2);
        confmean = mean(conf(:,~samp),2);

        %model 1
        sigma_m = minParam{1}(1);
        alpha_m = minParam{1}(3);
        sigma_aim = minParam{1}(6);
        alpha_mf = minParam{1}(7);
        bias = 0;

        x01 = [sigma_m,alpha_m,sigma_aim,alpha_mf,bias];

        lb1 = [.1 0 .1 0 -10];
        ub1 = [20 1 20 1 25];

        fun1 = @(var1) pterbModel1(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,var1(1),var1(2),var1(3),var1(4),var1(5));
        [x1(cv,:,gg), ls1(gg,cv)] = bads(fun1,x01,lb1,ub1)
        

        %model 2
        sigma_m = minParam{2}(1);
        sigma_p = minParam{2}(2);
        alpha_m = minParam{2}(3);
        alpha_p = minParam{2}(4);
        sigma_aim = minParam{2}(6);
        bias = 0;

        x02 = [sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim,bias];

        lb2 = [.1 .1 0 0 .1 -10];
        ub2 = [20 20 1 1 20 25];

        fun2 = @(var2) pterbModel2(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,var2(1),var2(2),var2(3),var2(4),var2(5),var2(6));
        [x2(cv,:,gg), ls2(gg,cv)] = bads(fun2,x02,lb2,ub2)

        %model 3
        sigma_m = minParam{3}(1);
        sigma_p = minParam{3}(2);
        alpha_m = minParam{3}(3);
        alpha_p = minParam{3}(4);
        sigma_aim = minParam{3}(6);
        alpha_mf = minParam{3}(7);
        bias = 0;

        x03 = [sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim,alpha_mf,bias];

        lb3 = [.1 .1 0 0 .1 0 -10];
        ub3 = [20 20 1 1 20 1 25];

        fun3 = @(var3) pterbModel3(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,var3(1),var3(2),var3(3),var3(4),var3(5),var3(6),var3(7));
        [x3(cv,:,gg), ls3(gg,cv)] = bads(fun3,x03,lb3,ub3)

        
        iteration = [cv,gg]
    end
end
for gg = 1:numIts
    for cv = 1:numBlocks
        samp = logical(zeros(1,numBlocks));
        samp(cv) = 1;
        testBlockfeed = feedbackErr(:,samp);
        testBlockconf = conf(:,samp);
        [cvLS1(gg,cv)]= pterbModel1(testBlockfeed,testBlockconf,numTrial,numSims,r,ptb,arcSize,x1(cv,1,gg),x1(cv,2,gg),x1(cv,3,gg),x1(cv,4,gg),x1(cv,5,gg));
        [cvLS2(gg,cv)]= pterbModel2(testBlockfeed,testBlockconf,numTrial,numSims,r,ptb,arcSize,x2(cv,1,gg),x2(cv,2,gg),x2(cv,3,gg),x2(cv,4,gg),x2(cv,5,gg),x2(cv,6,gg));
        [cvLS3(gg,cv)]= pterbModel3(testBlockfeed,testBlockconf,numTrial,numSims,r,ptb,arcSize,x3(cv,1,gg),x3(cv,2,gg),x3(cv,3,gg),x3(cv,4,gg),x3(cv,5,gg),x3(cv,6,gg),x3(cv,7,gg));
    end
end

cvAll = [sum(cvLS1,2), sum(cvLS2,2), sum(cvLS3,2)];
cvmin = min(cvAll,[],2);
cvDiff =  cvAll - cvmin;

for ww = 1:numIts
winner(ww) = find(cvDiff(ww,:)==0);
end


filename = sprintf('%s_badsMinOutput2.mat',subj);
save(filename, 'x1','x2','x3','cvLS1','cvLS2','cvLS3','cvDiff','winner');


