subjAll = [{'PK'},{'MP'},{'RW'},{'NA'},{'BY'},{'SX'},{'AN'},{'ET'},{'HP'},{'SM'},{'FM'},{'IJ'},{'SB'},{'PL'},{'GK'},{'VD'}];
count = 0;
for ss = [1 9 16]
    count = count + 1;
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);
    filename = sprintf('%s_badsMinOutput2.mat',subj);
    load(sprintf('%s_LSoutput.mat',subj))
    load(sprintf('%s_fMinOutput_1.mat',subj))
    load(sprintf('%s_contExpFit.mat',subj))
    load([path '/' filename])

    if ss == 1
        sigPmarg = 3.4;
    elseif ss == 4
        sigPmarg = 4.9;
    end

    m1wins = winner == 1;
    m2wins = winner == 2;
    m3wins = winner == 3; 

    model1 = nan*ones(480,7);
    model2 = nan*ones(480,7);
    model3 = nan*ones(480,7);

    motorSigModel1 = x1(:,1,m1wins);
    motorSigModel2 = x2(:,1,m2wins);
    motorSigModel3 = x3(:,1,m3wins);
    model1(1:length(motorSigModel1(:)),1) = motorSigModel1(:);
    model2(1:length(motorSigModel2(:)),1) = motorSigModel2(:);
    model3(1:length(motorSigModel3(:)),1) = motorSigModel3(:);

    propSigModel2 = x2(:,2,m2wins);
    propSigModel3 = x3(:,2,m3wins);
    model2(1:length(propSigModel2(:)),2) = propSigModel2(:);
    model3(1:length(propSigModel3(:)),2) = propSigModel3(:);

    aimSigModel1 = x1(:,3,m1wins);
    aimSigModel2 = x2(:,5,m2wins);
    aimSigModel3 = x3(:,5,m3wins);
    model1(1:length(aimSigModel1(:)),3) = aimSigModel1(:);
    model2(1:length(aimSigModel2(:)),3) = aimSigModel2(:);
    model3(1:length(aimSigModel3(:)),3) = aimSigModel3(:);

    biasModel1 = x1(:,5,m1wins);
    biasModel2 = x2(:,6,m2wins);
    biasModel3 = x3(:,7,m3wins);
    model1(1:length(biasModel1(:)),4) = biasModel1(:);
    model2(1:length(biasModel2(:)),4) = biasModel2(:);
    model3(1:length(biasModel3(:)),4) = biasModel3(:);

    mAlphaModel1 = x1(:,2,m1wins);
    mAlphaModel2 = x2(:,3,m2wins);
    mAlphaModel3 = x3(:,3,m3wins);
    model1(1:length(mAlphaModel1(:)),5) = mAlphaModel1(:).*10;
    model2(1:length(mAlphaModel2(:)),5) = mAlphaModel2(:).*10;
    model3(1:length(mAlphaModel3(:)),5) = mAlphaModel3(:).*10;

    pAlphaModel2 = x2(:,4,m2wins);
    pAlphaModel3 = x3(:,4,m3wins);
    model2(1:length(pAlphaModel2(:)),6) = pAlphaModel2(:).*10;
    model3(1:length(pAlphaModel3(:)),6) = pAlphaModel3(:).*10;

    learningModel1 = x1(:,4,m1wins);
    learningModel3 = x3(:,6,m3wins);
    model1(1:length(learningModel1(:)),7) = learningModel1(:).*10;
    model3(1:length(learningModel3(:)),7) = learningModel3(:).*10;

    winningmod = [sum(winner == 1),sum(winner == 2),sum(winner == 3)];
    topMod = find(winningmod == max(winningmod)); 

    

    a1 = {model1, model2, model3};

    
    models = {'Prospective','Retrospective','Full'};
    paramOrder = {'Motor Uncertainty','Proprioceptive Uncertainty','Aiming Uncertainty','Bias','Motor Learning Rate','Propriceptive Learning Rate','Motor-variability Learning Rate'};
    figure
    %subplot(3,1,count); 
    hold on;
    patch([23:42, fliplr(23:42)], [0*ones(1,20), fliplr(10*ones(1,20))],'K', 'FaceAlpha',0.1,'HandleVisibility','off',EdgeColor='none');
    h = boxplotGroup(a1,'PrimaryLabels',{'P','R','F'},'SecondaryLabels',paramOrder,'InterGroupSpace',3,'GroupLabelType','Vertical','PlotStyle','Compact','BoxStyle','filled','Colors','rbg','GroupType','betweenGroups');
    %set(h.xline,'LabelVerticalAlignment','bottom')
    groupTextsz = findobj(h.boxplotGroup,'tag','SecondaryLabels');
    set(groupTextsz,'FontSize', 18)
    medOuter = findobj(h.boxplotGroup,'tag','MedianOuter');
    set(medOuter,'MarkerFaceColor', 'k')
    medInner = findobj(h.boxplotGroup,'tag','MedianInner');
    set(medInner,'MarkerEdgeColor', 'w')
    outliers = findobj(h.boxplotGroup,'Tag','Outliers');
    set(outliers, 'Marker','*')
    set(findobj(h.boxplotGroup,'tag','Whisker'),'LineWidth',1)
    h.axis.YGrid = 'on';
    plot(1:3,[sigMmarg sigMmarg sigMmarg],'k','LineWidth',2)
    plot(7:9,[sigPmarg sigPmarg sigPmarg],'k','LineWidth',2)
    ylim([0 20])
    %plot(24:28,10*ones(1,5),'--k','LineWidth',1)
    %plot(30:34,10*ones(1,5),'--k','LineWidth',1)
    %plot(36:40,10*ones(1,5),'--k','LineWidth',1)
    title(['P',num2str(ss),' best fit model ',models{topMod}])
    box off
    set(gca,'FontSize',14,'tickdir','out')
    set(gcf,'Color','white','position',[0,0,1800,400])
    
end
