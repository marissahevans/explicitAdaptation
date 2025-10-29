subjAll = [{'PK'},{'MP'},{'RW'},{'NA'},{'BY'},{'SX'},{'AN'},{'ET'},{'HP'},{'SM'},{'FM'},{'IJ'},{'SB'},{'PL'},{'GK'},{'VD'}];

for ss = 1:length(subjAll)
    subj = subjAll{ss};
    path = sprintf('/Users/mhe229/Documents/Landy Lab/perturbExperiment/data_perturb/%s',subj);
    filename = sprintf('%s_badsMinOutput2.mat',subj);
    load(sprintf('%s_LSoutput.mat',subj))
    load(sprintf('%s_fMinOutput_1.mat',subj))
    load(sprintf('%s_contExpFit.mat',subj))
    load([path '/' filename])

    winnerAll(ss,:) = winner;
end

for ii = 1:16
    winnerCounts(ii,:) = [sum(winnerAll(ii,:) == 1),sum(winnerAll(ii,:) == 2),sum(winnerAll(ii,:) == 3)];
end
for ii = 1:16
    topMod = find(winnerCounts(ii,:) == max(winnerCounts(ii,:)));
    winningMod(ii) = topMod(1);
end


figure
set(gcf,'Color','white')
heatmap(1:16,{'Prospective','Retrospective','Full'},winnerCounts')
ylabel('Model')
xlabel('Participant')
set(gca,'FontSize',18)
