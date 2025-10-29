subjAll = [{'NA'},{'MP'},{'RW'},{'PK'},{'BY'},{'SX'},{'AN'},{'ET'},{'HP'},{'SM'},{'FM'},{'IJ'},{'SB'},{'PL'},{'GK'},{'VD'}];

for ss = 1:length(subjAll)
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);

    if subj == 'AN'
        load(sprintf('%s',path,'/AN_perturb_exp_S1_2023-12-03_14-55_controlresults.mat'));
        load(sprintf('%s',path,'/AN_perturb_exp_S1_2023-12-03_15-52_dispInfo.mat'));
        contResultsMat = R1.contResultsMat;

    elseif subj == 'BY'
        load(sprintf('%s',path,'/BY_perturb_exp_S1_2023-11-15_12-29_controlresults.mat'));
        load(sprintf('%s',path,'/BY_perturb_exp_S1_2023-11-15_12-29_dispInfo.mat'));

    elseif subj == 'ET'
        load(sprintf('%s',path,'/ET_perturb_exp_S1_2023-11-02_11-00_controlresults.mat'));
        load(sprintf('%s',path,'/ET_perturb_exp_S1_2023-11-02_11-00_dispInfo.mat'));

    elseif subj == 'FM'
        load(sprintf('%s',path,'/FM_perturb_exp_S1_2023-11-02_16-54_controlresults.mat'));
        load(sprintf('%s',path,'/FM_perturb_exp_S1_2023-11-02_16-54_dispInfo.mat'));

    elseif subj == 'GK'
        load(sprintf('%s',path,'/GK_perturb_exp_S1_2023-12-15_12-36_controlresults.mat'));
        load(sprintf('%s',path,'/GK_perturb_exp_S1_2023-12-15_12-36_dispInfo.mat'));

    elseif subj == 'HP'
        load(sprintf('%s',path,'/HP_perturb_exp_S1_2023-11-06_16-03_controlresults.mat'));
        load(sprintf('%s',path,'/HP_perturb_exp_S1_2023-11-06_16-03_dispInfo.mat'));

    elseif subj == 'IJ'
        load(sprintf('%s',path,'/IJ_perturb_exp_S1_2023-12-15_15-02_controlresults.mat'));
        load(sprintf('%s',path,'/IJ_perturb_exp_S1_2023-12-15_15-02_dispInfo.mat'));

    elseif subj == 'MP'
        load(sprintf('%s',path,'/MP_perturb_exp_S1_2023-10-31_14-47_controlresults.mat'));
        load(sprintf('%s',path,'/MP_perturb_exp_S1_2023-10-31_14-47_dispInfo.mat'));

    elseif subj == 'NA'
        load(sprintf('%s',path,'/NA_perturb_exp_S1_2023-11-27_15-06_controlresults.mat'));
        load(sprintf('%s',path,'/NA_perturb_exp_S1_2023-11-27_15-40_dispInfo.mat'));
        contResultsMat = R1.contResultsMat;

    elseif subj == 'PL'
        load(sprintf('%s',path,'/PL_perturb_exp_S1_2023-11-29_10-55_controlresults.mat'));
        load(sprintf('%s',path,'/PL_perturb_exp_S1_2023-11-29_10-55_dispInfo.mat'));

    elseif subj == 'PK'
        load(sprintf('%s',path,'/PK_perturb_exp_S1_2023-12-06_19-11_controlresults.mat'));
        load(sprintf('%s',path,'/PK_perturb_exp_S1_2023-12-06_19-11_dispInfo.mat'));

    elseif subj == 'SB'
        load(sprintf('%s',path,'/SB_perturb_exp_S1_2023-12-04_17-11_controlresults.mat'));
        load(sprintf('%s',path,'/SB_perturb_exp_S1_2023-12-04_17-11_dispInfo.mat'));

    elseif subj == 'SM'
        load(sprintf('%s',path,'/SM_perturb_exp_S1_2023-11-17_16-07_controlresults.mat'));
        load(sprintf('%s',path,'/SM_perturb_exp_S1_2023-11-17_16-07_dispInfo.mat'));

    elseif subj == 'VD'
        load(sprintf('%s',path,'/VD_perturb_exp_S1_2023-12-15_13-47_controlresults.mat'));
        load(sprintf('%s',path,'/VD_perturb_exp_S1_2023-12-15_13-47_dispInfo.mat'));

    elseif subj == 'RW'
        load(sprintf('%s',path,'/RW_perturb_exp_S1_2024-02-26_14-10_controlresults.mat'));
        load(sprintf('%s',path,'/RW_perturb_exp_S1_2024-02-26_14-10_dispInfo.mat'));

    elseif subj == 'SX'
        load(sprintf('%s',path,'/SX_perturb_exp_S1_2024-03-15_14-54_controlresults.mat'));
        load(sprintf('%s',path,'/SX_perturb_exp_S1_2024-03-15_14-54_dispInfo.mat'));
    end


    %Control experiment estimation IN DEGREES!!!
    reaches = contResultsMat.endPtAngle-90;
    indicated = contResultsMat.reportAngle-90;
    target = 0;

    reaches(isoutlier(reaches)) = mean(reaches(~isoutlier(reaches)));

    % figure; hold on
    % set(gcf,'color','w');
    % set(gca, 'TickDir', 'out', 'FontSize', 24)
    % plot(indicated(1:300),'LineWidth',2)
    % plot(reaches(1:300),'LineWidth',2)
    % yline(0,'--');
    % xlabel('trial')
    % ylabel('angle, degrees')
    % legend('Indicated','Reach')
    % title(['Participant ', num2str(ss)])
    % ylim([-20,20])
   


    %Control results full reaches
    % figure; hold on
    % set(gca, 'YDir', 'reverse')
    % for ii = 1:contResultsMat.tabletData(end,6)
    %     trialVals = contResultsMat.tabletData(:,6) == ii;
    %     plot(contResultsMat.tabletData(trialVals,1),contResultsMat.tabletData(trialVals,2))
    % end
    % xlim([0,2000])
    % title(['Participant ', num2str(ss)])

    %Likelihood fitting of sigma_m and sigma_p
    m_vec = 1:.1:10;
    p_vec = 1:.1:10;
    LL=zeros(length(m_vec),length(p_vec));
    LLigivene=zeros(length(m_vec),length(p_vec));
    LLe=zeros(length(m_vec),1);

    N = length(reaches);

    for vv = 1:length(m_vec)        %loop over all sigma_m options
        RmTemp = 1/m_vec(vv)^2;

        LLe(vv) = -N*log(2*pi) - 2*N*log(m_vec(vv)) - (sum(reaches.^2)/(2*m_vec(vv)^2));
        for jj = 1:length(p_vec)    %loop over all sigma_p options
            RpTemp = 1/p_vec(jj)^2;
            meanigivene = (RpTemp/(RpTemp+RmTemp))*reaches + ...
                (RmTemp/(RpTemp+RmTemp))*target;
            SDigivene = (RpTemp/(RpTemp+RmTemp))*p_vec(jj);

            % log likelihood of sigma_p given sensed location and endpoint:
            LLigivene(vv,jj) = -N*log(2*pi) - 2*N*log(SDigivene) - (sum((indicated-meanigivene).^2)/(2*SDigivene^2));

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
    sigMmarg(ss) = m_vec(find(mmarg == max(mmarg)));

    %Proprioception Marginal
    pmarg = sum(NormPost,1);
    pmarg = pmarg/sum(pmarg);
    sigPmarg(ss) = p_vec(find(pmarg == max(pmarg)));

    %filename = sprintf('%s_contExpFit.mat',subj);
    %save(fullfile(path,filename), 'sigPmarg','sigMmarg','NormPost');

    % figure
    % surf(m_vec,p_vec,NormPost)
    % xlabel('proprioceptive error degrees')
    % ylabel('motor error degrees')
    % zlabel('posterior')
end 
% figure; hold on
% scatter(1:16,sigMmarg)
% scatter(1:16,sigPmarg)
% legend('sigma_m', 'sigma_p')


figure; hold on
set(gcf,'color','w');
plot([0:10],[0:10], 'k--')
scatter(sigMmarg(1),sigPmarg(1),200,'r','filled')
text(sigMmarg(1),sigPmarg(1),{'  P1'},'FontSize',14)
scatter(sigMmarg(2:9),sigPmarg(2:9),200,'b','filled')
text(sigMmarg(2:9),sigPmarg(2:9),{'  P2','  P3','  P4','  P5','  P6','  P7','  P8','  P9',},'FontSize',14)
scatter(sigMmarg(10:16),sigPmarg(10:16),200,'g','filled')
text(sigMmarg(10:16),sigPmarg(10:16),{'  P10','  P11','  P12','  P13','  P14','  P15','  P16'},'FontSize',14)
ylim([0 10])
xlim([0 10])
axis square
box off
yticks([0:2:10])
xticks([0:2:10])
set(gca, 'TickDir', 'out', 'FontSize', 24)
ylabel('proprioceptive error sigma (deg)','FontSize', 34)
xlabel('motor error sigma (deg)','FontSize', 34)
legend('Equality line','Best fit Prospective','Best fit Retrospective','Best fit Full','Location','best')

