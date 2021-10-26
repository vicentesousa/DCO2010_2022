% Script do Matlab para simulação (e comparação com fórmula teórica) de
% transmissão sinais ortogonais
clear all;close all;clc;echo off;
%% parâmetros
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
legend('Script com poucos laços', 'Script com muitos laços')
set(gca,'linewidth',2,'fontsize',12,'fontweight','bold')
set(gcf,'Name','@CETEL','color',[1 1 1])
xlabel('Número de Amostras')
ylabel('Tempo [s]')

