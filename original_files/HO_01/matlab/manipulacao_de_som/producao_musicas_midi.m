clear all;clc;close all;
tf = 0.3;% duração de cada tom
% tabela notas musicais
% do- 1; re- 2; mi- 3; fa- 4; sol-5; la-6; si-7
vtmusic = [1 2 3 4 0 4 4 0 1 2 1 2 0 2 2 0 1 5 4 3 0 3 3 0 1 2 3 4 0 4 4]; % vetor de "música"
% Frequencia fundamental da nota Dó 
fdo = 512; %Hz
% Relação de frequências entre as notas musicais
vtTom2Freq = [1 9/8 5/4 4/3 3/2 5/3 15/8]; 
%% gerar e tocar musica 
for iplay = vtmusic
    if iplay == 0
        pause(tf);
    else
        fs = vtTom2Freq(iplay)*fdo; 
        fa = 100*fs;
        t = 0:1/fa:tf;
        y=cos(2*pi*fs*t);
        wavplay(y,fa)
    end
end

%y=cos(2*pi*fs*t)+0.8*cos(2*pi*0.01*fs*t);
