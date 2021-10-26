close all;clear all
%Table
Eb_N0_dB = [-3:2:13];
theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10)));
format long
tab = [Eb_N0_dB' theoryBer']

% noise amplitude
%amp01 = 10.^(-Eb_N0_dB/20)*1/sqrt(2)
%amp02 = 1 ./ sqrt(10.^(Eb_N0_dB/10))
