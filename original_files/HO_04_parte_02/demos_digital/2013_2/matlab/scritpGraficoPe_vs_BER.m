% Script do Matlab para simulação (e comparação com fórmula teórica) de
% transmissão sinais ortogonais
clear all;close all;clc;echo off;
%% parâmetros
vtSNRSim=0:1:10;
vtSNRTeo=-1:0.1:12;
vtnMCSamples = [10 100 5000 100000];
vtMarkers = ['s';'o';'d';'*';'<'];
chLegend = [];
for is = 1:length(vtnMCSamples)
    nMCSamples = vtnMCSamples(is);
    % gera a curva simulada
    for ik=1:length(vtSNRSim),
        vtSimError(ik)= simOrtogonal( vtSNRSim(ik)+(-1)^(is), nMCSamples );
    end
    hand1 = semilogy(vtSNRSim + (-1)^(is),vtSimError, vtMarkers(is));
    clear vtSimError;
    hold all;
    set(hand1, 'linewidth', 2, 'markersize',14)
    chLegend = [chLegend;{['BER simulada com ' num2str(nMCSamples) ' amostras']}];
end
for ik=1:length(vtSNRTeo)
    dSNR=exp(vtSNRTeo(ik)*log(10)/10);
    vtTeoError(ik)=Qfunct(sqrt(dSNR));
end
chLegend = [chLegend;{['Teórico  - Pe']}];
hand1 = semilogy(vtSNRTeo,vtTeoError);
set(hand1, 'linewidth', 2)
legend(chLegend);
set(gca,'linewidth',2,'fontsize',12,'fontweight','bold')
set(gcf,'Name','@CETEL','color',[1 1 1])
xlabel('SNR')
ylabel('BER ou P_e')

