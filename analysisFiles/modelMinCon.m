numTrial = 100;      %number of trials
numBlocks = 12;
ptb = zeros(1,numTrial);
ptb(20:70) = 20;
arcSize = 0:45; %possible arc angles
r = [10,linspace(10,0,length(2:length(arcSize)))];
figs = 0; %show figures in loop

tic
subjAll = [{'BY'},{'FM'},{'HP'},{'MP'},{'NA'},{'PL'},{'SM'},{'ET'},{'IJ'},{'AN'},{'SB'},{'VD'},{'GK'},{'PK'},{'RW'},{'SX'}];
for ss = 1:length(subjAll)
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);
    filename = sprintf('%s_LSoutput.mat',subj);
    load([path '/' filename])
    numSims = 1000;
    for gg = 1%:20 %number of full simulation sets
        for cv = 1:numBlocks
            samp = logical(zeros(1,numBlocks));
            samp(cv) = 1;
            testBlockfeed = feedbackErr(:,samp);
            feedbackErrmean = mean(feedbackErr(:,~samp),2);

            testBlockconf = conf(:,samp);
            confmean = mean(conf(:,~samp),2);


            %model 1
            sigma_m = minParam{1}(1);
            alpha_m = minParam{1}(3);
            sigma_aim = minParam{1}(6);
            alpha_mf = minParam{1}(7);

            x01 = [sigma_m,alpha_m,sigma_aim,alpha_mf];

            lb1 = [.1 0 .1 0];
            ub1 = [20 1 20 1];

            fun1 = @(var1) pterbModel1(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,var1(1),var1(2),var1(3),var1(4));
            [x1(cv,:), ls1(cv)] = bads(fun1,x01,lb1,ub1)
            [cvLS1(cv)]= pterbModel1(testBlockfeed,testBlockconf,numTrial,numSims,r,ptb,arcSize,x1(cv,1),x1(cv,2),x1(cv,3),x1(cv,4));

            %model 2
            sigma_m = minParam{2}(1);
            sigma_p = minParam{2}(2);
            alpha_m = minParam{2}(3);
            alpha_p = minParam{2}(4);
            sigma_aim = minParam{2}(6);

            x02 = [sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim];

            lb2 = [.1 .1 0 0 .1];
            ub2 = [20 20 1 1 20];

            fun2 = @(var2) pterbModel2(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,var2(1),var2(2),var2(3),var2(4),var2(5));
            [x2(cv,:), ls2(cv)] = bads(fun2,x02,lb2,ub2)
            [cvLS2(cv)]= pterbModel2(testBlockfeed,testBlockconf,numTrial,numSims,r,ptb,arcSize,x2(cv,1),x2(cv,2),x2(cv,3),x2(cv,4),x2(cv,5));

            %model 3
            sigma_m = minParam{3}(1);
            sigma_p = minParam{3}(2);
            alpha_m = minParam{3}(3);
            alpha_p = minParam{3}(4);
            sigma_aim = minParam{3}(6);
            alpha_mf = minParam{3}(7);

            x03 = [sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim,alpha_mf];

            lb3 = [.1 .1 0 0 .1 0];
            ub3 = [20 20 1 1 20 1];

            fun3 = @(var3) pterbModel3(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,var3(1),var3(2),var3(3),var3(4),var3(5),var3(6));
            [x3(cv,:), ls3(cv)] = bads(fun3,x03,lb3,ub3)
            [cvLS3(cv)]= pterbModel3(testBlockfeed,testBlockconf,numTrial,numSims,r,ptb,arcSize,x3(cv,1),x3(cv,2),x3(cv,3),x3(cv,4),x3(cv,5),x3(cv,6));

            %model 4
            sigma_m = minParam{4}(1);
            sigma_p = minParam{4}(2);
            alpha_m = minParam{4}(3);
            alpha_p = minParam{4}(4);
            sigma_aim = minParam{4}(6);
            alpha_mf = minParam{4}(7);

            x04 = [sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim,alpha_mf];

            lb4 = [.1 .1 0 0 .1 0];
            ub4 = [20 20 1 1 20 1];

            fun4 = @(var4) pterbModel4(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,var4(1),var4(2),var4(3),var4(4),var4(5),var4(6));
            [x4(cv,:), ls4(cv)] = bads(fun4,x04,lb4,ub4)
            [cvLS4(cv)]= pterbModel4(testBlockfeed,testBlockconf,numTrial,numSims,r,ptb,arcSize,x4(cv,1),x4(cv,2),x4(cv,3),x4(cv,4),x4(cv,5),x4(cv,6));
        end

        

        cvAll = [sum(cvLS1) sum(cvLS2) sum(cvLS3) sum(cvLS4)];
        cvmin = min(cvAll);
        cvDiff=  cvAll - cvmin;
        winner(gg) = find(cvDiff==0);

        filename2 = sprintf('%s_fMinOutput_%d.mat',subj,gg);
        save(fullfile(path,filename2), 'x1','x2','x3','x4','cvLS1','cvLS2','cvLS3','cvLS4','cvDiff') %,'AS1','AS2','AS3','AS4','ASsem1','ASsem2','ASsem3','ASsem4','fb1','fb2','fb3','fb4','fbSem1','fbSem2','fbSem3','fbSem4','lsAll','lsDiff','var1','var2','var3','var4','feedbackErrmean','confmean')
    end

    filename3 = sprintf('%s_winningModel.mat',subj);
    save(fullfile(path,filename3), 'winner');

   

end
toc



% figure
% for ii = 1:16
%     subplot(4,4,ii)
%     bar(cvDiff(ii,:))
%     ylim([0 1000])
%     xlabel('model')
%     ylabel('cv diff')
%     title(['CV subj ' num2str(ii)])
% end

