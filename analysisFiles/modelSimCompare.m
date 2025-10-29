
numTrial = 70;      %number of trials
numSims = 100;
ptb = zeros(1,numTrial);
ptb(20:70) = 20;
arcSize = 0:45; %possible arc angles
r = [10,linspace(10,0,length(2:length(arcSize)))];

var1 = [3,.8,.8,.1,1]; %sigma_m,alpha_m,sigma_aim,alpha_mf, bias
var2 = [3,10,.7,.3,.8,1]; %sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim, bias
var3 = [3,10,.7,.3,.8,.7,1]; %sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim,alpha_mf, bias
%var4 = [3,10,.7,.3,.8,.7]; %sigma_m,sigma_p,alpha_m,alpha_p,sigma_aim,alpha_mf, bias

[AS1, fb1, ASsem1, fbSem1] = pterbModel1sim(numTrial,numSims,r,ptb,arcSize,var1(1),var1(2),var1(3),var1(4),var1(5));


[AS2, fb2, ASsem2, fbSem2] = pterbModel2sim(numTrial,numSims,r,ptb,arcSize,var2(1),var2(2),var2(3),var2(4),var2(5),var2(6));


[AS3, fb3, ASsem3, fbSem3] = pterbModel3sim(numTrial,numSims,r,ptb,arcSize,var3(1),var3(2),var3(3),var3(4),var3(5),var3(6),var3(7));


%[AS4, fb4, ASsem4, fbSem4] = pterbModel4sim(numTrial,numSims,r,ptb,arcSize,var4(1),var4(2),var4(3),var4(4),var4(5),var4(6));


x = 1:70;
figure
subplot(1,3,1); hold on
plot(x,AS1,'k','LineWidth',2)
plot(AS1-ASsem1','k--','HandleVisibility','off')
plot(AS1+ASsem1','k--','HandleVisibility','off')
plot(x,-AS1,'k','LineWidth',2,'HandleVisibility','off')
plot(-AS1-ASsem1','k--','HandleVisibility','off')
plot(-AS1+ASsem1','k--','HandleVisibility','off')
plot(x,fb1,'b','LineWidth',2)
plot(fb1-fbSem1','b--','HandleVisibility','off')
plot(fb1+fbSem1','b--','HandleVisibility','off')
yline(0,'HandleVisibility','off');
legend('Model Confidence +/- SEM','Model Feedback +/- SEM','location','best')
ylabel('angle (degrees)')
xlabel('trial')
set(gca, 'TickDir', 'out', 'FontSize', 18)
set(gcf,'color','w')
title(['Prospective'])
ylim([-30 30])

subplot(1,3,2); hold on
plot(x,AS2,'k','LineWidth',2)
plot(AS2-ASsem2','k--','HandleVisibility','off')
plot(AS2+ASsem2','k--','HandleVisibility','off')
plot(x,-AS2,'k','LineWidth',2,'HandleVisibility','off')
plot(-AS2-ASsem2','k--','HandleVisibility','off')
plot(-AS2+ASsem2','k--','HandleVisibility','off')
plot(x,fb2,'b','LineWidth',2)
plot(fb2-fbSem2','b--','HandleVisibility','off')
plot(fb2+fbSem2','b--','HandleVisibility','off')
yline(0,'HandleVisibility','off');
%legend('Feedback Angle','Confidence Angle','model Conf','model Feed','location','best')
ylabel('angle (degrees)')
xlabel('trial')
set(gca, 'TickDir', 'out', 'FontSize', 18)
set(gcf,'color','w')
title(['Retrospective'])
ylim([-30 30])

subplot(1,3,3); hold on
plot(x,AS3,'k','LineWidth',2)
plot(AS3-ASsem3','k--','HandleVisibility','off')
plot(AS3+ASsem3','k--','HandleVisibility','off')
plot(x,-AS3,'k','LineWidth',2,'HandleVisibility','off')
plot(-AS3-ASsem3','k--','HandleVisibility','off')
plot(-AS3+ASsem3','k--','HandleVisibility','off')
plot(x,fb1,'b','LineWidth',2)
plot(fb3-fbSem3','b--','HandleVisibility','off')
plot(fb3+fbSem3','b--','HandleVisibility','off')
yline(0,'HandleVisibility','off');
%legend('Feedback Angle','Confidence Angle','model Conf','model Feed','location','best')
ylabel('angle (degrees)')
xlabel('trial')
set(gca, 'TickDir', 'out', 'FontSize', 18)
set(gcf,'color','w')
title(['Full'])
ylim([-30 30])

% subplot(1,4,4); hold on
% plot(x,AS4,'k','LineWidth',2)
% plot(AS4-ASsem4','k--','HandleVisibility','off')
% plot(AS4+ASsem4','k--','HandleVisibility','off')
% plot(x,-AS4,'k','LineWidth',2,'HandleVisibility','off')
% plot(-AS4-ASsem4','k--','HandleVisibility','off')
% plot(-AS4+ASsem4','k--','HandleVisibility','off')
% plot(x,fb4,'b','LineWidth',2)
% plot(fb4-fbSem4','b--','HandleVisibility','off')
% plot(fb4+fbSem4','b--','HandleVisibility','off')
% yline(0,'HandleVisibility','off');
% %legend('Feedback Angle','Confidence Angle','model Conf','model Feed','location','best')
% ylabel('angle (degrees)')
% xlabel('trial')
% set(gca, 'TickDir', 'out', 'FontSize', 18)
% set(gcf,'color','w')
% title(['Model 4'])
% ylim([-30 30])