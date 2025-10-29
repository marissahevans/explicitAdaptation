%Perterbation project analysis comparing simulated data sets (created using
%ModelsSim_v3.m) to the participant's data. Specifically the feedback
%location and the confidence reports. 11/29/23


tic
plot1 = 1; %1 if showing raw data plot
plot2 = 1; %1 if showing average block plot

load('perturbSim0.mat')
mArc1 = mArc;
mFeed1 = mFeed;
param1 = parameters;
load('perturbSim1.mat')
mArc2 = mArc;
mFeed2 = mFeed;
param2 = parameters;
load('perturbSim2.mat')
mArc3 = mArc;
mFeed3 = mFeed;
param3 = parameters;
load('perturbSim3.mat')
mArc4 = mArc;
mFeed4 = mFeed;
param4 = parameters;

numParam = size(mArc1);
toc
%% 
tic
winMod = [];

subjAll = [{'PK'},{'RW'},{'FM'},{'ET'},{'SM'},{'BY'},{'NA'},{'IJ'},{'MP'},{'AN'},{'SB'},{'HP'},{'PL'},{'GK'},{'VD'},{'SX'}];
for ss = 5%:length(subjAll)
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);

    if subj == 'AN'
        R1 = load(sprintf('%s',path,'/AN_perturb_exp_S1_2023-12-03_14-55_controlresults.mat'));
        %R1 = load(sprintf('%s',path,'/AN_perturb_exp_S1_2023-12-03_15-52_controlresults.mat')); %Needs to be joined with above
        D1 = load(sprintf('%s',path,'/AN_perturb_exp_S1_2023-12-03_15-52_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/AN_perturb_exp_S2_2023-11-22_13-22_results.mat'));
        D2 = load(sprintf('%s',path,'/AN_perturb_exp_S2_2023-11-22_13-22_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/AN_perturb_exp_S3_2023-11-29_18-27_results.mat'));
        D3 = load(sprintf('%s',path,'/AN_perturb_exp_S3_2023-11-29_18-27_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/AN_perturb_exp_S4_2023-12-03_14-00_results.mat'));
        D4 = load(sprintf('%s',path,'/AN_perturb_exp_S4_2023-12-03_14-00_dispInfo.mat'));

    elseif subj == 'BY'
        R1 = load(sprintf('%s',path,'/BY_perturb_exp_S1_2023-11-15_12-29_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/BY_perturb_exp_S1_2023-11-15_12-29_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/BY_perturb_exp_S2_2023-11-16_14-11_results.mat'));
        D2 = load(sprintf('%s',path,'/BY_perturb_exp_S2_2023-11-16_14-11_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/BY_perturb_exp_S3_2023-11-17_13-01_results.mat'));
        D3 = load(sprintf('%s',path,'/BY_perturb_exp_S3_2023-11-17_13-01_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/BY_perturb_exp_S4_2023-11-20_16-58_results.mat'));
        D4 = load(sprintf('%s',path,'/BY_perturb_exp_S4_2023-11-20_16-58_dispInfo.mat'));

    elseif subj == 'ET'
        R1 = load(sprintf('%s',path,'/ET_perturb_exp_S1_2023-11-02_11-00_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/ET_perturb_exp_S1_2023-11-02_11-00_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/ET_perturb_exp_S2_2023-11-28_13-54_results.mat'));
        D2 = load(sprintf('%s',path,'/ET_perturb_exp_S2_2023-11-28_13-54_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/ET_perturb_exp_S3_2023-11-29_10-13_results.mat'));
        D3 = load(sprintf('%s',path,'/ET_perturb_exp_S3_2023-11-29_10-13_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/ET_perturb_exp_S4_2023-11-30_11-07_results.mat'));
        D4 = load(sprintf('%s',path,'/ET_perturb_exp_S4_2023-11-30_11-07_dispInfo.mat'));

    elseif subj == 'FM'
        R1 = load(sprintf('%s',path,'/FM_perturb_exp_S1_2023-11-02_16-54_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/FM_perturb_exp_S1_2023-11-02_16-54_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/FM_perturb_exp_S2_2023-11-14_17-10_results.mat'));
        D2 = load(sprintf('%s',path,'/FM_perturb_exp_S2_2023-11-14_17-10_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/FM_perturb_exp_S3_2023-11-16_17-23_results.mat'));
        D3 = load(sprintf('%s',path,'/FM_perturb_exp_S3_2023-11-16_17-23_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/FM_perturb_exp_S4_2023-11-21_16-54_results.mat'));
        D4 = load(sprintf('%s',path,'/FM_perturb_exp_S4_2023-11-21_16-54_dispInfo.mat'));

    elseif subj == 'GK'
        R1 = load(sprintf('%s',path,'/GK_perturb_exp_S1_2023-12-15_12-36_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/GK_perturb_exp_S1_2023-12-15_12-36_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/GK_perturb_exp_S2_2023-12-04_15-54_results.mat'));
        D2 = load(sprintf('%s',path,'/GK_perturb_exp_S2_2023-12-04_15-54_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/GK_perturb_exp_S3_2023-12-13_14-28_results.mat'));
        D3 = load(sprintf('%s',path,'/GK_perturb_exp_S3_2023-12-13_14-28_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/GK_perturb_exp_S4_2023-12-15_11-31_results.mat'));
        D4 = load(sprintf('%s',path,'/GK_perturb_exp_S4_2023-12-15_11-31_dispInfo.mat'));

    elseif subj == 'HP'
        R1 = load(sprintf('%s',path,'/HP_perturb_exp_S1_2023-11-06_16-03_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/HP_perturb_exp_S1_2023-11-06_16-03_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/HP_perturb_exp_S2_2023-11-14_16-08_results.mat'));
        D2 = load(sprintf('%s',path,'/HP_perturb_exp_S2_2023-11-14_16-08_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/HP_perturb_exp_S3_2023-11-15_10-03_results.mat'));
        D3 = load(sprintf('%s',path,'/HP_perturb_exp_S3_2023-11-15_10-03_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/HP_perturb_exp_S4_2023-11-16_10-02_results.mat'));
        D4 = load(sprintf('%s',path,'/HP_perturb_exp_S4_2023-11-16_10-02_dispInfo.mat'));

    elseif subj == 'IJ'
        R1 = load(sprintf('%s',path,'/IJ_perturb_exp_S1_2023-12-15_15-02_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/IJ_perturb_exp_S1_2023-12-15_15-02_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/IJ_perturb_exp_S2_2023-11-13_18-16_results.mat'));
        D2 = load(sprintf('%s',path,'/IJ_perturb_exp_S2_2023-11-13_18-16_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/IJ_perturb_exp_S3_2023-11-20_18-07_results.mat'));
        D3 = load(sprintf('%s',path,'/IJ_perturb_exp_S3_2023-11-20_18-07_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/IJ_perturb_exp_S4_2023-11-27_18-04_results.mat'));
        D4 = load(sprintf('%s',path,'/IJ_perturb_exp_S4_2023-11-27_18-04_dispInfo.mat'));

    elseif subj == 'MP'
        R1 = load(sprintf('%s',path,'/MP_perturb_exp_S1_2023-10-31_14-47_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/MP_perturb_exp_S1_2023-10-31_14-47_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/MP_perturb_exp_S2_2023-11-21_10-00_results.mat'));
        D2 = load(sprintf('%s',path,'/MP_perturb_exp_S2_2023-11-21_10-00_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/MP_perturb_exp_S3_2023-11-27_13-52_results.mat'));
        D3 = load(sprintf('%s',path,'/MP_perturb_exp_S3_2023-11-27_13-52_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/MP_perturb_exp_S4_2023-11-28_10-05_results.mat'));
        D4 = load(sprintf('%s',path,'/MP_perturb_exp_S4_2023-11-28_10-05_dispInfo.mat'));

    elseif subj == 'NA'
        R1 = load(sprintf('%s',path,'/NA_perturb_exp_S1_2023-11-27_15-06_controlresults.mat'));
        %R1 = load(sprintf('%s',path,'/NA_perturb_exp_S1_2023-11-27_15-40_controlresults.mat')); %NEEDS TO BE JOINED WITH ABOVE
        D1 = load(sprintf('%s',path,'/NA_perturb_exp_S1_2023-11-27_15-40_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/NA_perturb_exp_S2_2023-11-13_16-57_results.mat'));
        D2 = load(sprintf('%s',path,'/NA_perturb_exp_S2_2023-11-13_16-57_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/NA_perturb_exp_S3_2023-11-15_17-16_results.mat'));
        D3 = load(sprintf('%s',path,'/NA_perturb_exp_S3_2023-11-15_17-16_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/NA_perturb_exp_S4_2023-11-21_15-50_results.mat'));
        D4 = load(sprintf('%s',path,'/NA_perturb_exp_S4_2023-11-21_15-50_dispInfo.mat'));

    elseif subj == 'PL'
        R1 = load(sprintf('%s',path,'/PL_perturb_exp_S1_2023-11-29_10-55_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/PL_perturb_exp_S1_2023-11-29_10-55_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/PL_perturb_exp_S2_2023-11-14_15-05_results.mat'));
        D2 = load(sprintf('%s',path,'/PL_perturb_exp_S2_2023-11-14_15-05_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/PL_perturb_exp_S3_2023-11-15_11-08_results.mat'));
        D3 = load(sprintf('%s',path,'/PL_perturb_exp_S3_2023-11-15_11-08_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/PL_perturb_exp_S4_2023-11-16_11-17_results.mat'));
        D4 = load(sprintf('%s',path,'/PL_perturb_exp_S4_2023-11-16_11-17_dispInfo.mat'));

    elseif subj == 'PK'
        R1 = load(sprintf('%s',path,'/PK_perturb_exp_S1_2023-12-06_19-11_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/PK_perturb_exp_S1_2023-12-06_19-11_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/PK_perturb_exp_S2_2023-11-29_17-05_results.mat'));
        D2 = load(sprintf('%s',path,'/PK_perturb_exp_S2_2023-11-29_17-05_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/PK_perturb_exp_S3_2023-12-01_14-46_results.mat'));
        D3 = load(sprintf('%s',path,'/PK_perturb_exp_S3_2023-12-01_14-46_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/PK_perturb_exp_S4_2023-12-05_19-06_results.mat'));
        D4 = load(sprintf('%s',path,'/PK_perturb_exp_S4_2023-12-05_19-06_dispInfo.mat'));

    elseif subj == 'SB'
        R1 = load(sprintf('%s',path,'/SB_perturb_exp_S1_2023-12-04_17-11_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/SB_perturb_exp_S1_2023-12-04_17-11_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/SB_perturb_exp_S2_2023-11-27_17-02_results.mat'));
        D2 = load(sprintf('%s',path,'/SB_perturb_exp_S2_2023-11-27_17-02_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/SB_perturb_exp_S3_2023-12-01_13-07_results.mat'));
        D3 = load(sprintf('%s',path,'/SB_perturb_exp_S3_2023-12-01_13-07_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/SB_perturb_exp_S4_2023-12-03_16-22_results.mat'));
        D4 = load(sprintf('%s',path,'/SB_perturb_exp_S4_2023-12-03_16-22_dispInfo.mat'));

    elseif subj == 'SM'
        R1 = load(sprintf('%s',path,'/SM_perturb_exp_S1_2023-11-17_16-07_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/SM_perturb_exp_S1_2023-11-17_16-07_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/SM_perturb_exp_S2_2023-11-20_09-59_results.mat'));
        D2 = load(sprintf('%s',path,'/SM_perturb_exp_S2_2023-11-20_09-59_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/SM_perturb_exp_S3_2023-11-21_15-00_results.mat'));
        D3 = load(sprintf('%s',path,'/SM_perturb_exp_S3_2023-11-21_15-00_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/SM_perturb_exp_S4_2023-11-27_11-58_results.mat'));
        D4 = load(sprintf('%s',path,'/SM_perturb_exp_S4_2023-11-27_11-58_dispInfo.mat'));

    elseif subj == 'VD'
        R1 = load(sprintf('%s',path,'/VD_perturb_exp_S1_2023-12-15_13-47_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/VD_perturb_exp_S1_2023-12-15_13-47_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/VD_perturb_exp_S2_2023-11-29_20-06_results.mat'));
        D2 = load(sprintf('%s',path,'/VD_perturb_exp_S2_2023-11-29_20-06_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/VD_perturb_exp_S3_2023-12-06_17-03_results.mat'));
        D3 = load(sprintf('%s',path,'/VD_perturb_exp_S3_2023-12-06_17-03_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/VD_perturb_exp_S4_2023-12-08_13-01_results.mat'));
        D4 = load(sprintf('%s',path,'/VD_perturb_exp_S4_2023-12-08_13-01_dispInfo.mat'));

    elseif subj == 'RW'
        R1 = load(sprintf('%s',path,'/RW_perturb_exp_S1_2024-02-26_14-10_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/RW_perturb_exp_S1_2024-02-26_14-10_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/RW_perturb_exp_S2_2024-03-01_13-06_results.mat'));
        D2 = load(sprintf('%s',path,'/RW_perturb_exp_S2_2024-03-01_13-06_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/RW_perturb_exp_S3_2024-03-06_11-59_results.mat'));
        D3 = load(sprintf('%s',path,'/RW_perturb_exp_S3_2024-03-06_11-59_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/RW_perturb_exp_S4_2024-03-15_15-59_results.mat'));
        D4 = load(sprintf('%s',path,'/RW_perturb_exp_S4_2024-03-15_15-59_dispInfo.mat'));

    elseif subj == 'SX'
        R1 = load(sprintf('%s',path,'/SX_perturb_exp_S1_2024-03-15_14-54_controlresults.mat'));
        D1 = load(sprintf('%s',path,'/SX_perturb_exp_S1_2024-03-15_14-54_dispInfo.mat'));
        R2 = load(sprintf('%s',path,'/SX_perturb_exp_S2_2024-03-04_14-08_results.mat'));
        D2 = load(sprintf('%s',path,'/SX_perturb_exp_S2_2024-03-04_14-08_dispInfo.mat'));
        R3 = load(sprintf('%s',path,'/SX_perturb_exp_S3_2024-03-06_13-15_results.mat'));
        D3 = load(sprintf('%s',path,'/SX_perturb_exp_S3_2024-03-06_13-15_dispInfo.mat'));
        R4 = load(sprintf('%s',path,'/SX_perturb_exp_S4_2024-03-08_14-52_results.mat'));
        D4 = load(sprintf('%s',path,'/SX_perturb_exp_S4_2024-03-08_14-52_dispInfo.mat'));    
    end

    %control exp
    %epAngle1 = R1.contResultsMat.endPtAngle - 90;
    %rpAngle1 = R1.contResultsMat.reportAngle - 90;
    fbAngle = [R2.resultsMat.feedbackAngle; R3.resultsMat.feedbackAngle; R4.resultsMat.feedbackAngle];
    tAngle = [R2.resultsMat.tarAngle'; R3.resultsMat.tarAngle'; R4.resultsMat.tarAngle'];
    eAngle = [R2.resultsMat.endPtAngle; R3.resultsMat.endPtAngle; R4.resultsMat.endPtAngle];
    arcSz = [R2.resultsMat.arcSize'; R3.resultsMat.arcSize'; R4.resultsMat.arcSize'];
    respErr = [R2.resultsMat.respErrorAngle; R3.resultsMat.respErrorAngle; R4.resultsMat.respErrorAngle];

    z = length(respErr)/100;

    feedbackAngle = reshape(fbAngle,[100,z]); %endpoint location out of 360 degrees
    tarAngle = reshape(tAngle,[100,z]); %target location out of 360 degrees
    errAngle = reshape(eAngle,[100,z]); %feedback location out of 360 degrees
    conf = reshape(abs(arcSz),[100 z]);
    conf(conf>45) = 45;
    errorfb = reshape(respErr,[100 z]);

    feedbackErr = (tarAngle-feedbackAngle).*[-1 1 -1 1 -1 1 -1 1 -1 1 -1 1];
    feedbackErr(feedbackErr>100) = 360-feedbackErr(feedbackErr>100);
    feedbackErr(feedbackErr<-100) = 360+feedbackErr(feedbackErr<-100);
    feedbackErr(feedbackErr>60) = 60;
    handAngle =(tarAngle-errAngle).*[-1 1 -1 1 -1 1 -1 1 -1 1 -1 1];
    handAngle(handAngle>100) = 360-handAngle(handAngle>100);
    handAngle(handAngle<-100) = 360+handAngle(handAngle<-100);

    % %correction for learning error
    % fbPtb = feedbackErr(20:70,:);
    % x = 1:612;
    % c = polyfit(x,fbPtb(:),2);
    % y_est = polyval(c,x);
    % y_est = reshape(y_est,[51,12]);
    % feedbackErr(20:70,:) = feedbackErr(20:70,:)-y_est;
    % 
    % %correction for confidence learning
    % confPtb = conf(20:70,:);
    % confPtb(confPtb<1) = 1;
    % x = 1:612;
    % yPrime = log(confPtb(:));
    % pPrime = polyfit(x,yPrime,1);
    % aPrime = pPrime(2); bPrime = pPrime(1);
    % y_est = exp(aPrime)*exp(x*bPrime);
    % y_est = reshape(y_est,[51,12]);
    % conf(20:70,:) = conf(20:70,:)-(y_est- mean(mean(conf(1:19,:))));

    confmean = mean(conf,2); %angle away from target in one direction
    confsem = std(conf')/sqrt(length(conf));
    handAnglemean = mean(handAngle,2); %hand angle away from target
    handAnglesem = std(handAngle')/sqrt(length(handAngle));
    feedbackErrmean = mean(feedbackErr,2); %feedback error away from target
    feedbackErrsem = std(feedbackErr')/sqrt(length(feedbackErr));

    if plot1 == 1
        %plotting raw trials
        figure; hold on
        %plot(handAngle(:))
        plot(feedbackErr(:))
        plot(conf(:))
        yline(0,'HandleVisibility','off');
        yline(-20,'--','HandleVisibility','off');
        ylabel('angle degrees')
        xlabel('trial')
        title(['raw trials P',num2str(ss)])
        legend('Hand Angle','Feedback Angle','Confidence Angle')
    end
    if plot2 == 1
        %Plotting means across blocks
        figure; hold on
        %plot(handAnglemean,'b','LineWidth',2)
        %plot(handAnglemean-handAnglesem','b--','HandleVisibility','off')
        %plot(handAnglemean+handAnglesem','b--','HandleVisibility','off')
        plot(feedbackErrmean,'r','LineWidth',2)
        plot(feedbackErrmean-feedbackErrsem','r--','HandleVisibility','off')
        plot(feedbackErrmean+feedbackErrsem','r--','HandleVisibility','off')
        plot(confmean,'y','LineWidth',2)
        %plot(-confmean,'y','LineWidth',2)
        plot(confmean-confsem','y--','HandleVisibility','off')
        plot(confmean+confsem','y--','HandleVisibility','off')
        %plot(-confmean-confsem','y--','HandleVisibility','off')
        %plot(-confmean+confsem','y--','HandleVisibility','off')
        yline(mean(confmean(1:19)),'--','HandleVisibility','off');
        %yline(-mean(confmean(1:19)),'--','HandleVisibility','off');
        yline(0,'HandleVisibility','off');
        %yline(20,'HandleVisibility','off');
        yline(-20,'--','HandleVisibility','off');
        %title('average block')
        legend('Hand Angle','Feedback Angle','Confidence Angle','location','best')
        ylabel('hand angle (degrees)')
        xlabel('trial')
        title(['average session P',num2str(ss)])
        set(gca, 'TickDir', 'out', 'FontSize', 18)
        set(gcf,'color','w')
    end
end
%%
    %Compare to simulations
    LS1 = nan(numParam(2:end));
    LS2 = nan(numParam(2:end));
    LS3 = nan(numParam(2:end));
    LS4 = nan(numParam(2:end));


    %model 1
    for aa = 1:numParam(2)
        for bb = 1:numParam(3)
            for cc= 1:numParam(4)
                for dd = 1:numParam(5)
                    for ee = 1:numParam(6)
                        for ff = 1:numParam(7)
                            for gg = 1:numParam(8)

                                sqErrArc = sum((confmean - mArc1(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                sqErrFeed = sum((feedbackErrmean - mFeed1(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                LS1(aa,bb,cc,dd,ee,ff,gg) = sqErrArc + sqErrFeed;
                                LSparam1{aa,bb,cc,dd,ee,ff,gg} = {[param1{1}(aa),param1{2}(bb),param1{3}(cc),param1{4}(dd),param1{5}(ee),param1{6}(ff),param1{7}(gg)]};

                            end
                        end
                    end
                end
            end
        end
    end


    %model 2
    for aa = 1:numParam(2)
        for bb = 1:numParam(3)
            for cc= 1:numParam(4)
                for dd = 1:numParam(5)
                    for ee = 1:numParam(6)
                        for ff = 1:numParam(7)
                            for gg = 1:numParam(8)

                                sqErrArc = sum((confmean - mArc2(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                sqErrFeed = sum((feedbackErrmean - mFeed2(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                LS2(aa,bb,cc,dd,ee,ff,gg) = sqErrArc + sqErrFeed;
                                LSparam2{aa,bb,cc,dd,ee,ff,gg} = {[param1{1}(aa),param1{2}(bb),param1{3}(cc),param1{4}(dd),param1{5}(ee),param1{6}(ff),param1{7}(gg)]};

                            end
                        end
                    end
                end
            end
        end
    end

    %model 3

    for aa = 1:numParam(2)
        for bb = 1:numParam(3)
            for cc= 1:numParam(4)
                for dd = 1:numParam(5)
                    for ee = 1:numParam(6)
                        for ff = 1:numParam(7)
                            for gg = 1:numParam(8)

                                sqErrArc = sum((confmean - mArc3(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                sqErrFeed = sum((feedbackErrmean - mFeed3(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                LS3(aa,bb,cc,dd,ee,ff,gg) = sqErrArc + sqErrFeed;
                                LSparam3{aa,bb,cc,dd,ee,ff,gg} = {[param1{1}(aa),param1{2}(bb),param1{3}(cc),param1{4}(dd),param1{5}(ee),param1{6}(ff),param1{7}(gg)]};

                            end
                        end
                    end
                end
            end
        end
    end

    %model 4
    for aa = 1:numParam(2)
        for bb = 1:numParam(3)
            for cc= 1:numParam(4)
                for dd = 1:numParam(5)
                    for ee = 1:numParam(6)
                        for ff = 1:numParam(7)
                            for gg = 1:numParam(8)

                                sqErrArc = sum((confmean - mArc4(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                sqErrFeed = sum((feedbackErrmean - mFeed4(:,aa,bb,cc,dd,ee,ff,gg)).^2);
                                LS4(aa,bb,cc,dd,ee,ff,gg) = sqErrArc + sqErrFeed;
                                LSparam4{aa,bb,cc,dd,ee,ff,gg} = {[param1{1}(aa),param1{2}(bb),param1{3}(cc),param1{4}(dd),param1{5}(ee),param1{6}(ff),param1{7}(gg)]};

                            end
                        end
                    end
                end
            end
        end
    end

LSquares = [min(LS1(:)),min(LS2(:)),min(LS3(:)),min(LS4(:))];
minLoc = [find(LS1 == min(LS1(:))), find(LS2 == min(LS2(:))), find(LS3 == min(LS3(:))), find(LS4 == min(LS4(:)))];
minParam = [LSparam1{minLoc(1)},LSparam2{minLoc(2)},LSparam3{minLoc(3)},LSparam4{minLoc(4)}];
winningModel = find(LSquares == min(LSquares));
winningParam = minParam{winningModel};

winMod = [winMod, winningModel];


filename = sprintf('%s_LSoutput.mat',subj);
save(fullfile(path,filename), 'LS1', 'LSparam1','LS2', 'LSparam2','LS3', 'LSparam3','LS4', 'LSparam4','handAnglemean','feedbackErrmean','conf','feedbackErr','confmean','handAnglesem','feedbackErrsem','confsem','LSquares','minLoc','minParam',...
    'winningModel','winningParam')


%end

toc
