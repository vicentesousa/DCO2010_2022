function [dBER] = simOrtogonal(snr_in_dB,nMCSamples)
% Simula a BER para sinais ortogonais para uma dada SNR em dB
% parâmetros
dE = 1; % energia do sinal s0 e s1
dSNR = exp(snr_in_dB*log(10)/10); % SNR em escala linear
dsgma = dE/sqrt(2*dSNR);	% desvio padrão do ruído

% geração dos números binários 0 e 1 com igual probabilidade
vtBin = randi([0 1],1,nMCSamples);

% Tranmissão e detecção de erro
% Acha os índice de bits iguais a 0
vtIndex0 = find(vtBin == 0);
% Acha os índice de buts iguais a 1
vtIndex1 = find(vtBin == 1);

% Gera saida do correlator para cada entrada 0
vtEnergiaRo(vtIndex0) = dE + dsgma*randn(1,length(vtIndex0));
vtEnergiaR1(vtIndex0) = dsgma*randn(1,length(vtIndex0));
% Gera saida do correlator para cada entrada 1
vtEnergiaRo(vtIndex1) = dsgma*randn(1,length(vtIndex1));
vtEnergiaR1(vtIndex1) = dE + dsgma*randn(1,length(vtIndex1));

% Detecção: 0 se, r0>r1; e 1, se r0<r1
vtBinDetec = vtEnergiaRo < vtEnergiaR1;

% Detecção de erros (soma dos vetores originais e detectados)
% 0 + 0 = 0 (acerto)
% 1 + 1 = 2 (acerto)
% 0 + 1 = 1 (erro)
% 1 + 0 = 1 (erro)
vtError = vtBin + vtBinDetec; 
nErrors = length(find(vtError == 1));
% Estimativa da probabilidade de erro, i.e., BER
dBER = nErrors/nMCSamples;	  	      		