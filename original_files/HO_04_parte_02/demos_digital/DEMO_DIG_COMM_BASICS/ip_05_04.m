% MATLAB script for Illustrative Problem 4, Chapter 5.
clear all;close all;clc;echo off;
SNRindB1=0:1:12;
SNRindB2=0:0.1:12;
N=10000;
tic;
for i=1:length(SNRindB1),
  % simulated error rate
  smld_err_prb(i)=smldpe54(SNRindB1(i),N);   
end;
toc
for i=1:length(SNRindB2),
  SNR=exp(SNRindB2(i)*log(10)/10);  
  % theoretical error rate       
  theo_err_prb(i)=Qfunct(sqrt(SNR));  	    
end;
% Plotting commands follow
semilogy(SNRindB1,smld_err_prb,'*');
hold
semilogy(SNRindB2,theo_err_prb);
legend('BER (simulada)', 'P_{e} (te�rica)')
set(gca,'linewidth',2,'fontsize',12,'fontweight','bold')
set(gcf,'Name','@CETEL','color',[1 1 1])

