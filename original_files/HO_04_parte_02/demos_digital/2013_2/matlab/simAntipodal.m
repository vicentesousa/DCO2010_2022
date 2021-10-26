function [dBER] = simAntipodal(snr_in_dB,nMCSamples)
% Simula a BER para sinais antipodais para uma dada SNR em dB
% par�metros
dE = 10; % energia do sinal s0 e s1
dSNR = exp(snr_in_dB*log(10)/10); % SNR em escala linear
dsgma = dE/sqrt(2*dSNR);	% desvio padr�o do ru�do

% gera��o dos n�meros bin�rios 0 e 1 com igual probabilidade
vtBin = randi([0 1],1,nMCSamples);

% Tranmiss�o e detec��o de erro
% Acha os �ndice de bits iguais a 0
vtIndex0 = find(vtBin == 0);
% Acha os �ndice de buts iguais a 1
vtIndex1 = find(vtBin == 1);

% Gera saida do correlator para cada entrada 0
vtEnergiaR(vtIndex0) = dE + dsgma*randn(1,length(vtIndex0));
vtEnergiaR(vtIndex1) = -dE + dsgma*randn(1,length(vtIndex1));

% Detec��o: 0 se, r>0; e 1, se r<0
vtBinDetec = vtEnergiaR < 0;

% Detec��o de erros (soma dos vetores originais e detectados)
% 0 + 0 = 0 (acerto)
% 1 + 1 = 2 (acerto)
% 0 + 1 = 1 (erro)
% 1 + 0 = 1 (erro)
vtError = vtBin + vtBinDetec; 
nErrors = length(find(vtError == 1));
% Estimativa da probabilidade de erro, i.e., BER
dBER = nErrors/nMCSamples;	  	      		