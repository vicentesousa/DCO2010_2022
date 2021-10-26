function central_teo()
clear all;close all;clc;
number_of_dice = [1 2 3 5 10 20 30 50 200 1000];
for id=1:length(number_of_dice)
    [df,dsem] = central_limit_theorem_dice(number_of_dice(id),id,length(number_of_dice));
    %pause;
    vtdf(id) = df;
    vtdsem(id) = dsem;
end
figure;
plot(number_of_dice,vtdf,'b-*');
hold all;
plot(number_of_dice,vtdsem,'r-s');
legend('Tempo com laço for','Tempo sem laço for');
xlabel('Valor de n');
ylabel('Tempo de execução [s]');
end

function [df,dsem]=central_limit_theorem_dice(n,thisPlot,nPlots) % Central Limit Theorem for n dice
disp('');
disp([num2str(n) ' somas ']);
% Implementação com laço for
dcfs = tic;
% for il=1:10000
%     for ic=1:n
%         x(ic,il)=ceil(6*rand) ; % Generate 10000 random numbers from 1 to 6 (numbers on a die) %independent and identically distributed Random variables
%     end
% end
for ic=1:n
        x(ic,:)=ceil(6*rand(1,10000)) ; % Generate 10000 random numbers from 1 to 6 (numbers on a die) %independent and identically distributed Random variables
end
for ik=1:length(x(1,:)),% Add individual columns to find the sum of n dice.
    y(ik)=sum(x(:,ik));
end
df = toc(dcfs);
disp([' Tempo com for = ' num2str(df) 's'])
% Implementação like-Matlab
dsfs = tic;
x = ceil(6*rand(n,10000)); 
y = sum(x,1);
dsem = toc(dsfs);
disp([' Tempo sem for = ' num2str(dsem) 's'])
disp([' Razão = ' num2str(df/dsem) ' vezes'])

subplot(2, ceil(nPlots/2), thisPlot )  

binWidth = 1; %This is the bin width
binCtrs = n:binWidth:n*6; %Bin centers, depends on your data
%n=length(Data);
%counts = hist(Data,binCtrs);
%   prob = counts / (n * binWidth);
%   H = bar(binCtrs,prob,'hist');
hist(y,binCtrs);% Plot histogram
hold on;
% histograma gaussiano estimado
mi = mean(y);
des = std(y);
ye = des*randn(1,length(y))+mi;
[yPlot, xPlot] = hist(ye,binCtrs);% Plot histogram
plot(xPlot, yPlot,'k','linewidth',2);
title(['n = ' num2str(n)]);
xlabel('Soma');
ylabel('Frequência de ocorrência');
if (thisPlot==1)
    legend('Dados','Gaussiana')
end
end
