% Script do Matlab para simula��o (e compara��o com f�rmula te�rica) de
% transmiss�o sinais antipodais
clear all;close all;clc;echo off;
%% par�metros
vtSNRSim=0:1:12;
nMCSamples = 10000;
vtSNRTeo=0:0.1:12;
% gera a curva simulada
tic;
for ik=1:length(vtSNRSim),
  vtSimError(ik)= simAntipodal( vtSNRSim(ik), nMCSamples );   
end
toc
% gera a curva te�rica
for ik=1:length(vtSNRTeo)
  dSNR=exp(vtSNRTeo(ik)*log(10)/10);   
  vtTeoError(ik)=Qfunct(sqrt(2*dSNR));     
end
% Plotting commands follow
semilogy(vtSNRSim,vtSimError,'o');
hold on;
semilogy(vtSNRTeo,vtTeoError);
legend('BER (simulada)', 'P_{e} (te�rica)')
set(gca,'linewidth',2,'fontsize',12,'fontweight','bold')
set(gcf,'Name','@CETEL','color',[1 1 1])
xlabel('SNR')
ylabel('BER (simulada) ou Pe (te�rica)')
