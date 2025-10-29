%% Time course plots compared to model simualtions
subjAll = [{'PK'},{'MP'},{'RW'},{'NA'},{'BY'},{'SX'},{'AN'},{'ET'},{'HP'},{'SM'},{'FM'},{'IJ'},{'SB'},{'PL'},{'GK'},{'VD'}];

for ss = 1:length(subjAll)
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);
    filename = sprintf('%s_badsMinOutput2.mat',subj);
    load([path '/' filename])
    winnerAll(ss,:) = winner;
end

numTrial = 70;      %number of trials
numBlocks = 12;
numSims = 1000;
ptb = zeros(1,numTrial);
ptb(20:70) = 20;
arcSize = 0:45; %possible arc angles
r = [10,linspace(10,0,length(2:length(arcSize)))];


for ss = 1:length(subjAll)
    figure
    sgtitle(['Participant ',num2str(ss)])
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);
    filename = sprintf('%s_badsMinOutput2.mat',subj);
    load([path '/' filename])
    filename2 = sprintf('%s_LSoutput.mat',subj);
    load([path '/' filename2])

    
    cvAll = [sum(cvLS1,2), sum(cvLS2,2), sum(cvLS3,2)];

    %PROSPECTIVE
    subset = winnerAll(ss,:) == 1;
    params = x1(:,:,subset);
    leastSQ = find(cvAll(subset,1) == min(cvAll(subset,1)));
    if sum(subset) == 0
        bestVals = [0 0 0 0 0];
        [lsTot1, AS1a, fb1a, ASsem1, fbSem1] = pterbModel1(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,bestVals(1),bestVals(2),bestVals(3),bestVals(4),bestVals(5));
    else
        for rr = 1:12
            bestVals = params(rr,:,leastSQ);
            [lsTot1, AS1(:,rr), fb1(:,rr), ASsem1, fbSem1] = pterbModel1(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,bestVals(1),bestVals(2),bestVals(3),bestVals(4),bestVals(5));
        end
        AS1a = mean(AS1,2);
        fb1a = mean(fb1,2);
    end

    subplot(1,3,1); hold on
    patch([20:70, fliplr(20:70)], [-10*ones(1,51), fliplr(30*ones(1,51))],'K', 'FaceAlpha',0.1,'HandleVisibility','off',EdgeColor='none');
    patch([1:70, fliplr(1:70)], [feedbackErrmean(1:70)'-feedbackErrsem(1:70), fliplr(feedbackErrmean(1:70)'+feedbackErrsem(1:70))],[0.4940 0.1840 0.5560], 'FaceAlpha',0.5,EdgeColor='none');
    plot(feedbackErrmean(1:70),'Color',[0.4940 0.1840 0.5560],'HandleVisibility','off')
    patch([1:70, fliplr(1:70)], [confmean(1:70)'-confsem(1:70), fliplr(confmean(1:70)'+confsem(1:70))],[0.8500 0.3250 0.0980], 'FaceAlpha',0.5,EdgeColor='none');
    plot(confmean(1:70),'Color',[0.8500 0.3250 0.0980],'HandleVisibility','off')
    plot(AS1a,'r','LineWidth',3)
    plot(fb1a,'b','LineWidth',3)
    yline(0);
    ylim([-10 30])
    xlim([1 70])
    xticks([20 70])
    xlabel('trial')
    ylabel('directional error (deg)')
    title('Prospective Model')
    box off
    set(gca,'TickDir','out','FontSize',18)
    set(gcf,'Color','white','position',[0,0,1600,500])

    %RETROSPECTIVE
    subset = winnerAll(ss,:) == 2;
    params = x2(:,:,subset);
    leastSQ = find(cvAll(subset,2) == min(cvAll(subset,2)));
    if sum(subset) == 0
        bestVals = [0 0 0 0 0 0];
        [lsTot2, AS2a, fb2a, ASsem2, fbSem2] = pterbModel2(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,bestVals(1),bestVals(2),bestVals(3),bestVals(4),bestVals(5),bestVals(6));
    else
        for rr = 1:12
            bestVals = params(rr,:,leastSQ);
            [lsTot2, AS2(:,rr), fb2(:,rr), ASsem2, fbSem2] = pterbModel2(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,bestVals(1),bestVals(2),bestVals(3),bestVals(4),bestVals(5),bestVals(6));
        end
        AS2a = mean(AS2,2);
        fb2a = mean(fb2,2);
    end

    subplot(1,3,2); hold on
    patch([20:70, fliplr(20:70)], [-10*ones(1,51), fliplr(30*ones(1,51))],'K', 'FaceAlpha',0.1,'HandleVisibility','off',EdgeColor='none');
    patch([1:70, fliplr(1:70)], [feedbackErrmean(1:70)'-feedbackErrsem(1:70), fliplr(feedbackErrmean(1:70)'+feedbackErrsem(1:70))],[0.4940 0.1840 0.5560], 'FaceAlpha',0.5,EdgeColor='none');
    plot(feedbackErrmean(1:70),'Color',[0.4940 0.1840 0.5560],'HandleVisibility','off')
    patch([1:70, fliplr(1:70)], [confmean(1:70)'-confsem(1:70), fliplr(confmean(1:70)'+confsem(1:70))],[0.8500 0.3250 0.0980], 'FaceAlpha',0.5,EdgeColor='none');
    plot(confmean(1:70),'Color',[0.8500 0.3250 0.0980],'HandleVisibility','off')
    plot(AS2a,'r','LineWidth',3)
    plot(fb2a,'b','LineWidth',3)
    yline(0);
    ylim([-10 30])
    xlim([1 70])
    xticks([20 70])
    xlabel('trial')
    ylabel('directional error (deg)')
    title('Retrospective Model')
    box off
    set(gca,'TickDir','out','FontSize',18)
    set(gcf,'Color','white','position',[0,0,1600,500])

    %FULL 
    subset = winnerAll(ss,:) == 3;
    params = x3(:,:,subset);
    leastSQ = find(cvAll(subset,3) == min(cvAll(subset,3)));
    if sum(subset) == 0
        bestVals = [0 0 0 0 0 0 0];
        [lsTot3, AS3a, fb3a, ASsem3, fbSem3] = pterbModel3(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,bestVals(1),bestVals(2),bestVals(3),bestVals(4),bestVals(5),bestVals(6),bestVals(7));
    else
        for rr = 1:12
            bestVals = params(rr,:,leastSQ);
            [lsTot3, AS3(:,rr), fb3(:,rr), ASsem3, fbSem3] = pterbModel3(feedbackErrmean,confmean,numTrial,numSims,r,ptb,arcSize,bestVals(1),bestVals(2),bestVals(3),bestVals(4),bestVals(5),bestVals(6),bestVals(7));
        end
        AS3a = mean(AS3,2);
        fb3a = mean(fb3,2);
    end

    subplot(1,3,3); hold on
    patch([20:70, fliplr(20:70)], [-10*ones(1,51), fliplr(30*ones(1,51))],'K', 'FaceAlpha',0.1,'HandleVisibility','off',EdgeColor='none');
    patch([1:70, fliplr(1:70)], [feedbackErrmean(1:70)'-feedbackErrsem(1:70), fliplr(feedbackErrmean(1:70)'+feedbackErrsem(1:70))],[0.4940 0.1840 0.5560], 'FaceAlpha',0.5,EdgeColor='none');
    plot(feedbackErrmean(1:70),'Color',[0.4940 0.1840 0.5560],'HandleVisibility','off')
    patch([1:70, fliplr(1:70)], [confmean(1:70)'-confsem(1:70), fliplr(confmean(1:70)'+confsem(1:70))],[0.8500 0.3250 0.0980], 'FaceAlpha',0.5,EdgeColor='none');
    plot(confmean(1:70),'Color',[0.8500 0.3250 0.0980],'HandleVisibility','off')
    plot(AS3a,'r','LineWidth',3)
    plot(fb3a,'b','LineWidth',3)
    yline(0);
    ylim([-10 30])
    xlim([1 70])
    xticks([20 70])
    xlabel('trial')
    ylabel('directional error (deg)')
    title('Full Model')
    box off
    set(gca,'TickDir','out','FontSize',18)
    set(gcf,'Color','white','position',[0,0,1600,500])
    if ss == 14
        legend('feedback','confidence','model confidence','model feedback','location','northeast')
    end

    

end