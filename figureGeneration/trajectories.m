subjAll = [{'PL'},{'GK'},{'SB'},{'AN'},{'PK'},{'RW'},{'ET'},{'VD'},{'HP'},{'SM'},{'IJ'},{'NA'},{'FM'},{'BY'},{'SX'},{'MP'}];

sess = 1;
for ss = [9]%:length(subjAll)
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);

    if subj == 'AN'
        if sess == 1
            load(sprintf('%s',path,'/AN_perturb_exp_S2_2023-11-22_13-22_results.mat'));
            load(sprintf('%s',path,'/AN_perturb_exp_S2_2023-11-22_13-22_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/AN_perturb_exp_S3_2023-11-29_18-27_results.mat'));
            load(sprintf('%s',path,'/AN_perturb_exp_S3_2023-11-29_18-27_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/AN_perturb_exp_S4_2023-12-03_14-00_results.mat'));
            load(sprintf('%s',path,'/AN_perturb_exp_S4_2023-12-03_14-00_dispInfo.mat'));
        end

    elseif subj == 'BY'
        if sess == 1
            load(sprintf('%s',path,'/BY_perturb_exp_S2_2023-11-16_14-11_results.mat'));
            load(sprintf('%s',path,'/BY_perturb_exp_S2_2023-11-16_14-11_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/BY_perturb_exp_S3_2023-11-17_13-01_results.mat'));
            load(sprintf('%s',path,'/BY_perturb_exp_S3_2023-11-17_13-01_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/BY_perturb_exp_S4_2023-11-20_16-58_results.mat'));
            load(sprintf('%s',path,'/BY_perturb_exp_S4_2023-11-20_16-58_dispInfo.mat'));
        end

    elseif subj == 'ET'
        if sess == 1
            load(sprintf('%s',path,'/ET_perturb_exp_S2_2023-11-28_13-54_results.mat'));
            load(sprintf('%s',path,'/ET_perturb_exp_S2_2023-11-28_13-54_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/ET_perturb_exp_S3_2023-11-29_10-13_results.mat'));
            load(sprintf('%s',path,'/ET_perturb_exp_S3_2023-11-29_10-13_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/ET_perturb_exp_S4_2023-11-30_11-07_results.mat'));
            load(sprintf('%s',path,'/ET_perturb_exp_S4_2023-11-30_11-07_dispInfo.mat'));
        end

    elseif subj == 'FM'
        if sess == 1
            load(sprintf('%s',path,'/FM_perturb_exp_S2_2023-11-14_17-10_results.mat'));
            load(sprintf('%s',path,'/FM_perturb_exp_S2_2023-11-14_17-10_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/FM_perturb_exp_S3_2023-11-16_17-23_results.mat'));
            load(sprintf('%s',path,'/FM_perturb_exp_S3_2023-11-16_17-23_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/FM_perturb_exp_S4_2023-11-21_16-54_results.mat'));
            load(sprintf('%s',path,'/FM_perturb_exp_S4_2023-11-21_16-54_dispInfo.mat'));
        end

    elseif subj == 'GK'
        if sess == 1
            load(sprintf('%s',path,'/GK_perturb_exp_S2_2023-12-04_15-54_results.mat'));
            load(sprintf('%s',path,'/GK_perturb_exp_S2_2023-12-04_15-54_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/GK_perturb_exp_S3_2023-12-13_14-28_results.mat'));
            load(sprintf('%s',path,'/GK_perturb_exp_S3_2023-12-13_14-28_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/GK_perturb_exp_S4_2023-12-15_11-31_results.mat'));
            load(sprintf('%s',path,'/GK_perturb_exp_S4_2023-12-15_11-31_dispInfo.mat'));
        end

    elseif subj == 'HP'
        if sess == 1
            load(sprintf('%s',path,'/HP_perturb_exp_S2_2023-11-14_16-08_results.mat'));
            load(sprintf('%s',path,'/HP_perturb_exp_S2_2023-11-14_16-08_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/HP_perturb_exp_S3_2023-11-15_10-03_results.mat'));
            load(sprintf('%s',path,'/HP_perturb_exp_S3_2023-11-15_10-03_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/HP_perturb_exp_S4_2023-11-16_10-02_results.mat'));
            load(sprintf('%s',path,'/HP_perturb_exp_S4_2023-11-16_10-02_dispInfo.mat'));
        end

    elseif subj == 'IJ'
        if sess == 1
            load(sprintf('%s',path,'/IJ_perturb_exp_S2_2023-11-13_18-16_results.mat'));
            load(sprintf('%s',path,'/IJ_perturb_exp_S2_2023-11-13_18-16_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/IJ_perturb_exp_S3_2023-11-20_18-07_results.mat'));
            load(sprintf('%s',path,'/IJ_perturb_exp_S3_2023-11-20_18-07_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/IJ_perturb_exp_S4_2023-11-27_18-04_results.mat'));
            load(sprintf('%s',path,'/IJ_perturb_exp_S4_2023-11-27_18-04_dispInfo.mat'));
        end

    elseif subj == 'MP'
        if sess == 1
            load(sprintf('%s',path,'/MP_perturb_exp_S2_2023-11-21_10-00_results.mat'));
            load(sprintf('%s',path,'/MP_perturb_exp_S2_2023-11-21_10-00_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/MP_perturb_exp_S3_2023-11-27_13-52_results.mat'));
            load(sprintf('%s',path,'/MP_perturb_exp_S3_2023-11-27_13-52_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/MP_perturb_exp_S4_2023-11-28_10-05_results.mat'));
            load(sprintf('%s',path,'/MP_perturb_exp_S4_2023-11-28_10-05_dispInfo.mat'));
        end

    elseif subj == 'NA'
        if sess == 1
            load(sprintf('%s',path,'/NA_perturb_exp_S2_2023-11-13_16-57_results.mat'));
            load(sprintf('%s',path,'/NA_perturb_exp_S2_2023-11-13_16-57_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/NA_perturb_exp_S3_2023-11-15_17-16_results.mat'));
            load(sprintf('%s',path,'/NA_perturb_exp_S3_2023-11-15_17-16_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/NA_perturb_exp_S4_2023-11-21_15-50_results.mat'));
            load(sprintf('%s',path,'/NA_perturb_exp_S4_2023-11-21_15-50_dispInfo.mat'));
        end

    elseif subj == 'PL'
        if sess == 1
            load(sprintf('%s',path,'/PL_perturb_exp_S2_2023-11-14_15-05_results.mat'));
            load(sprintf('%s',path,'/PL_perturb_exp_S2_2023-11-14_15-05_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/PL_perturb_exp_S3_2023-11-15_11-08_results.mat'));
            load(sprintf('%s',path,'/PL_perturb_exp_S3_2023-11-15_11-08_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/PL_perturb_exp_S4_2023-11-16_11-17_results.mat'));
            load(sprintf('%s',path,'/PL_perturb_exp_S4_2023-11-16_11-17_dispInfo.mat'));
        end

    elseif subj == 'PK'
        if sess == 1
            load(sprintf('%s',path,'/PK_perturb_exp_S2_2023-11-29_17-05_results.mat'));
            load(sprintf('%s',path,'/PK_perturb_exp_S2_2023-11-29_17-05_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/PK_perturb_exp_S3_2023-12-01_14-46_results.mat'));
            load(sprintf('%s',path,'/PK_perturb_exp_S3_2023-12-01_14-46_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/PK_perturb_exp_S4_2023-12-05_19-06_results.mat'));
            load(sprintf('%s',path,'/PK_perturb_exp_S4_2023-12-05_19-06_dispInfo.mat'));
        end

    elseif subj == 'SB'
        if sess == 1
            load(sprintf('%s',path,'/SB_perturb_exp_S2_2023-11-27_17-02_results.mat'));
            load(sprintf('%s',path,'/SB_perturb_exp_S2_2023-11-27_17-02_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/SB_perturb_exp_S3_2023-12-01_13-07_results.mat'));
            load(sprintf('%s',path,'/SB_perturb_exp_S3_2023-12-01_13-07_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/SB_perturb_exp_S4_2023-12-03_16-22_results.mat'));
            load(sprintf('%s',path,'/SB_perturb_exp_S4_2023-12-03_16-22_dispInfo.mat'));
        end

    elseif subj == 'SM'
        if sess == 1
            load(sprintf('%s',path,'/SM_perturb_exp_S2_2023-11-20_09-59_results.mat'));
            load(sprintf('%s',path,'/SM_perturb_exp_S2_2023-11-20_09-59_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/SM_perturb_exp_S3_2023-11-21_15-00_results.mat'));
            load(sprintf('%s',path,'/SM_perturb_exp_S3_2023-11-21_15-00_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/SM_perturb_exp_S4_2023-11-27_11-58_results.mat'));
            load(sprintf('%s',path,'/SM_perturb_exp_S4_2023-11-27_11-58_dispInfo.mat'));
        end

    elseif subj == 'VD'
        if sess == 1
            load(sprintf('%s',path,'/VD_perturb_exp_S2_2023-11-29_20-06_results.mat'));
            load(sprintf('%s',path,'/VD_perturb_exp_S2_2023-11-29_20-06_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/VD_perturb_exp_S3_2023-12-06_17-03_results.mat'));
            load(sprintf('%s',path,'/VD_perturb_exp_S3_2023-12-06_17-03_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/VD_perturb_exp_S4_2023-12-08_13-01_results.mat'));
            load(sprintf('%s',path,'/VD_perturb_exp_S4_2023-12-08_13-01_dispInfo.mat'));
        end

    elseif subj == 'RW'
        if sess == 1
            load(sprintf('%s',path,'/RW_perturb_exp_S2_2024-03-01_13-06_results.mat'));
            load(sprintf('%s',path,'/RW_perturb_exp_S2_2024-03-01_13-06_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/RW_perturb_exp_S3_2024-03-06_11-59_results.mat'));
            load(sprintf('%s',path,'/RW_perturb_exp_S3_2024-03-06_11-59_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/RW_perturb_exp_S4_2024-03-15_15-59_results.mat'));
            load(sprintf('%s',path,'/RW_perturb_exp_S4_2024-03-15_15-59_dispInfo.mat'));
        end

    elseif subj == 'SX'
        if sess == 1
            load(sprintf('%s',path,'/SX_perturb_exp_S2_2024-03-04_14-08_results.mat'));
            load(sprintf('%s',path,'/SX_perturb_exp_S2_2024-03-04_14-08_dispInfo.mat'));
        elseif sess == 2
            load(sprintf('%s',path,'/SX_perturb_exp_S3_2024-03-06_13-15_results.mat'));
            load(sprintf('%s',path,'/SX_perturb_exp_S3_2024-03-06_13-15_dispInfo.mat'));
        else
            load(sprintf('%s',path,'/SX_perturb_exp_S4_2024-03-08_14-52_results.mat'));
            load(sprintf('%s',path,'/SX_perturb_exp_S4_2024-03-08_14-52_dispInfo.mat'));
        end
    end



    %% Creating transforms from calibration

    %Inverse transform to get from pixel to tablet space
    invtform = invert(displayInfo.tform);           %Inverse transformation from participant's calibration

    %Creating a matrix for the calibration points in tablet space
    wacX = displayInfo.calibration{1,6};
    wacY = displayInfo.calibration{1,7};
    wac = [wacX' wacY'];

    %Calibration point locations in mm measurments from edge of tablet active
    %area
    mmWacSpace = [23,244; 23,134; 23,27; 238,244; 238,134; 238,27; 446, 244; 446,134; 446,27;];

    %affine transform from tablet space to mm
    M = affine_least_square(wac(3,1),wac(3,2),wac(5,1),wac(5,2),wac(6,1),wac(6,2), mmWacSpace(3,1),mmWacSpace(3,2),mmWacSpace(5,1),mmWacSpace(5,2),mmWacSpace(6,1),mmWacSpace(6,2));
    tformMM = affine2d(M');

    [startPos(1),startPos(2)] = transformPointsForward(invtform,resultsMat.startPos(1),resultsMat.startPos(2));
    [startPos(1),startPos(2)] = transformPointsForward(tformMM,startPos(1),startPos(2));

    %% Plotting trajectories
    %BLUE COLOR SPECTRUM
    lightTone = [235, 82, 52]./256;
    darkTone = [59, 7, 230]./256;

    blueGRADIENTflexible = @(i,N) lightTone + (darkTone-lightTone)*(((i))/(N));

    figure; hold on
    sgtitle(['Participant ', num2str(ss)])

    for ii = 1:100
        theta = resultsMat.tarAngle(ii);

        trialVals = resultsMat.tabletData(:,7) == ii;
        if sum(resultsMat.tabletData(trialVals,5) == 0) > 1
            firstInd = find(resultsMat.tabletData(trialVals,5) == 0);
            idxVals = find(trialVals == 1);
            trialVals(idxVals(1):idxVals(1)+firstInd(1)-1) = 0;
        end
        x = resultsMat.tabletData(trialVals,1);
        y = resultsMat.tabletData(trialVals,2);
        [x,y] = transformPointsForward(tformMM,x,y);
        x = x - startPos(1);
        y = y - startPos(2);
        %x = resultsMat.tabletData(trialVals,1)-960;
        %y = resultsMat.tabletData(trialVals,2)-515;

        R = [cosd(theta) sind(theta); -sind(theta) cosd(theta)];

        vals = R*[x,-y]';
        %vals = [x,-y]';
        set(gcf,'Color','white','position',[0,0,2200,300])
        if ii < 20
            subplot(1,3,1); hold on
            plot(vals(1,:),vals(2,:),'Color',blueGRADIENTflexible(ii,20))
            xlim([0,200])
            ylim([-100,100])
            xline(0);
            yline(0);
            title('Veridical Feedback, Trials 1-19')
            xlabel('x - mm')
            %ylabel('y - mm')
            set(gca, 'TickDir', 'out', 'FontSize', 18)
            set(gca,'TickDir','out','FontSize',18)
            
        elseif ii < 71
            subplot(1,3,2); hold on
            plot(vals(1,:),vals(2,:),'Color',blueGRADIENTflexible(ii-19,50))
            xlim([0,200])
            ylim([-100,100])
            xline(0);
            yline(0);
            title('Perturbation ON, Trials 20-70')
            xlabel('x - mm')
            %ylabel('y - mm')
            set(gca, 'TickDir', 'out', 'FontSize', 18)
            set(gcf,'color','w')
        else
            subplot(1,3,3); hold on
            plot(vals(1,:),vals(2,:),'Color',blueGRADIENTflexible(ii-70,30))
            xlim([0,200])
            ylim([-100,100])
            xline(0);
            yline(0);
            title('Washout, Trials 71-100')
            xlabel('x - mm')
            %ylabel('y - mm') 
            set(gca, 'TickDir', 'out', 'FontSize', 18)
            set(gcf,'color','w')
        end
    end

end