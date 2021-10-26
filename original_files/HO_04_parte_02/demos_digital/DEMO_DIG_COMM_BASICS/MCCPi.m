clear all;clc;close all;
echo off;
% Estimar valor de pi através do método de monte carlo
lQuadrado = 5;
rCirculo = lQuadrado;
vtPontos = [ 1e3 1e4 1e7];
format long; pi
for nPontos = vtPontos
    % Pocisionar ponto no quadrado
    vtPontos = lQuadrado*rand(1,nPontos) + i*lQuadrado*rand(1,nPontos);
    
    % Selecionar pontos do círculo
    indexPontCirculo = ( abs(vtPontos) <= rCirculo );
    vtPontosCirculo = vtPontos(indexPontCirculo);
    % plots
    %plot(vtPontos,'r*')
    %hold on;
    %plot(vtPontosCirculo,'bs')
    % estimativa de pi
    razaoArea = length(find(indexPontCirculo))/nPontos;
    valordePi = 4*razaoArea;
    format long;valordePi
    disp(['# de pontos = ' num2str(nPontos) ' - Razão =  ' num2str(razaoArea) ' - pi =  ' num2str(valordePi) ' - Erro =  ' num2str(pi-valordePi)])
end