% Script do Matlab para simula��o (e compara��o com f�rmula te�rica) de
% transmiss�o sinais ortogonais
clear all;close all;clc;echo off;
%% par�metros
vtSNRSim=0:1:12;
vtnMCSamples = [100 1000 5000 10000 50000 100000];
vtTempoLathi = [];
vtTempoVicente = [];
for nMCSamples = vtnMCSamples
    % gera a curva simulada
    tic;
    for ik=1:length(vtSNRSim),
       vtSimError(ik)= simOrtogonal( vtSNRSim(ik), nMCSamples );
    end
    vtTempoVicente = [vtTempoVicente toc];
    tic;
    for ik=1:length(vtSNRSim),
        smld_err_prb(ik)=smldpe54(vtSNRSim(ik),nMCSamples);
    end
    vtTempoLathi = [vtTempoLathi toc];
    clear vtSimError smld_err_prb;
end
% Plots
hand1 = plot(vtnMCSamples,vtTempoVicente,'r-o');
set(hand1, 'linewidth', 2)
hold on;
hand2 = plot(vtnMCSamples,vtTempoLathi,'k-*');
set(hand2, 'linewidth', 2)
legend('Script com poucos la�os', 'Script com muitos la�os')
set(gca,'linewidth',2,'fontsize',12,'fontweight','bold')
set(gcf,'Name','@CETEL','color',[1 1 1])
xlabel('N�mero de Amostras')
ylabel('Tempo [s]')

