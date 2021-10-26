clear all;clc;close all;
%% criar um seno em fs
tf = 2; % tempo final
fs = 512; % frequencia do seno
fa = 100*fs; % frequencia de amostragem
t = 0:1/fa:tf; % eixo do tempo
y=cos(2*pi*fs*t); % sinal

%% tocar sinal
wavplay(y,fa)

%% plotar sinal
plot(t,y)
axis([0 0.02 -1 1 ])


