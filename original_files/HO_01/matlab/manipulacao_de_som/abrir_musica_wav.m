close all;clc;clear all;
%% Abre arquivo de som
[vtSom, dFa, iNBits] = wavread('handson2_file_minicurso_44_1KHz.wav', 'native' );
% vtSom: amplitude das amostras de som
% dFa: frequência de amostrasgem do som (amostragem no tempo)
% iNBits: quantidade de bits por amostra (quantização)
% tempo entre amostras
dta = 1/dFa;
% eixo temporal do arquivo de som
dTFinal = (length(vtSom)-1)*dta;
vtTSom = 0:dta:dTFinal;
%% Faz gráfico da onda sonora
figure;
plot(vtTSom,vtSom);
set(gca,'FontWeight','bold','FontSize',12)
set(gcf,'color',[1 1 1])
title(['Sinal de Som - ' num2str(iNBits) ' bits/amostras'])
ylabel('Amplitude');
xlabel('Tempo (s)');

%% Toca arquivo de som, calcula e mostra suas informações
wavplay(vtSom, dFa);