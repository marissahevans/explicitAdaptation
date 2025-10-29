subjAll = [{'BY'},{'FM'},{'HP'},{'MP'},{'NA'},{'PL'},{'SM'},{'ET'},{'IJ'},{'AN'},{'SB'},{'VD'},{'GK'},{'PK'},{'RW'},{'SX'}];
for ss = 1:length(subjAll)
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

    pts(ss) = sum([R2.resultsMat.pointsEarned; R3.resultsMat.pointsEarned; R4.resultsMat.pointsEarned]);
    ptsPos(ss) = sum([R2.resultsMat.pointsPossible; R3.resultsMat.pointsPossible; R4.resultsMat.pointsPossible]);

    ptsRaw = [R2.resultsMat.pointsEarned; R3.resultsMat.pointsEarned; R4.resultsMat.pointsEarned];
    ptsPercent(ss) = sum(ptsRaw~=0)/length(ptsRaw(:));

    fbAngle = [R2.resultsMat.feedbackAngle; R3.resultsMat.feedbackAngle; R4.resultsMat.feedbackAngle];
    tAngle = [R2.resultsMat.tarAngle'; R3.resultsMat.tarAngle'; R4.resultsMat.tarAngle'];
    z = length(fbAngle)/100;
    feedbackAngle = reshape(fbAngle,[100,z]);
    tarAngle = reshape(tAngle,[100,z]); 
    feedbackErr = (tarAngle-feedbackAngle).*[-1 1 -1 1 -1 1 -1 1 -1 1 -1 1];
    feedbackErr(feedbackErr>100) = 360-feedbackErr(feedbackErr>100);
    feedbackErr(feedbackErr<-100) = 360+feedbackErr(feedbackErr<-100);
    feedbackErr(abs(feedbackErr)<=1) = 0;
    pointsPerfect = 10-(abs(feedbackErr)*(10/44));
    pointsPerfect(pointsPerfect<0) = 0;

    ptsPerf(ss) = sum(pointsPerfect(:));


end