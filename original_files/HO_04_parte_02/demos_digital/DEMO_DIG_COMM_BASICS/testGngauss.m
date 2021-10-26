% teste gngauss
clear all;close all;clc;echo off;
nSamples = 1000;
snr_in_dB = 2;
dE = 1; 
dSNR = exp(snr_in_dB*log(10)/10);
dsgma = dE/sqrt(2*dSNR);
for ik=1:nSamples
   vtGn(ik) = gngauss(dsgma);
end
vtRandn = dsgma*randn(1,nSamples);

cdfplot(vtGn)
hold on
cdfplot(vtRandn)
legend('gngauss','randn')
