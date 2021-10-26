% Prof. Vicente Angelo de Sousa Junior
% Objetivo: demonstra��o simples de codifica��o de fonte (quantiza��o) e seus efeitos
% Scritp baseado em fun��o disponibilizada gentilmente pelo prof. Luiz
% Gonzaga (DCO/UFRN)
clear all;clc;close all;

% Cria��o do sinal "anal�gico"
clear;
% taxa de "gera��o" do sinal anal�gico
Tg = 0.1;
% tempo final
nInitalSamples = 200; % garante um n�mero fixo de amostras
Tf =1000; % somente para gerar um n�mero grande de amostras
t=0:Tg:Tf; % Definindo a escala de tempo
% reajustando tempo final para garantir o numero fixo de amostras
Tf = t(nInitalSamples);
t = t(1:nInitalSamples);
%Tf = ;
fc1=.1;
fc2=.4;
x=sin(2*pi*fc1*t)+sin(2*pi*fc2*t);

% Amostragem (coleta de n amostras de x)
n =50; % decima��o =  n/nInitalSamples
Ts_in_samples = ceil(length(x)/n);
x_sampled = x(1:Ts_in_samples:end);
t_sampled = t(1:Ts_in_samples:end);
Ts = t_sampled(2);

% sampled vector with zeros to plot sampled spectrum
x_sampled_with_zeros = zeros(1,nInitalSamples);
t_sampled_with_zeros = zeros(1,nInitalSamples);
x_sampled_with_zeros(1:Ts_in_samples:end) = x(1:Ts_in_samples:end);
t_sampled_with_zeros(1:Ts_in_samples:end) = t(1:Ts_in_samples:end);

% Gr�ficos do sinal "anal�gico" e amostrado
figure(1);
subplot(2,1,1);
plot(t,x,'r');
title(['Sinal de "Tempo Cont�nuo" - f_{max} = ' num2str(max(fc1,fc2))]);
xlabel('t');
ylabel('x(t)');
grid on;
%Inicio da amostragem
subplot(2,1,2);
stem(t_sampled, x_sampled,'filled');
hold on;
plot(t,x,'r-o');
title(['Sinal amostrado (' num2str(n) ' amostras) - f_s = ' num2str(1/Ts)]);
legend('Amostras','Sinal de "Tempo Cont�nuo" ');
xlabel('n');
ylabel('x_s(n)');
grid on;

% Construct a questdlg with three options
options.Interpreter = 'tex';
options.Default = 'Sim';
choice = questdlg(['Reconstruir o sinal "cont�nuo" baseado no sinal discreto?'], ...
    'Menu de reconstru��o do sinal', ...
    'Sim','N�o',options);

% Gerenciar a resposta
switch choice
    case 'Sim'
        yrec = x_sampled;
        TsNew = Ts;
        x_recon=0;
        nSamples = length(yrec);
        xSamples = 0 : nSamples-1;
        trec = nSamples/Tf*[0:Tg:Tf];
        trec2=trec;
        %trec2 = [1:(nSamples-1)/(Tf)*Tg:nSamples]-1;
        %trec3 = [1:(nSamples-1)/(t(end))*Tg:nSamples]-1;
        tSinc = 0.005;
        Tfsinc = 50;
        %tSinc = Ts;
        for ik = xSamples
            %lsin=ik:-tSinc:-nSamples+ik;
            tnew = 0:tSinc:Tfsinc;
            x_recon=x_recon+yrec(ik+1)*sinc(2*pi*max(fc1,fc2)*(tnew-ik*Ts));
            figure(2);
            subplot(2,1,1);
            stem(t_sampled, x_sampled,'filled');
            hold on;
            plot(t,x,'r-o');
            title('Sinal de "Tempo Cont�nuo"')
            xlabel('t');
            ylabel('x(t)');
            plot(tnew,yrec(ik+1)*sinc(2*pi*max(fc1,fc2)*(tnew-ik*Ts)),'k')
            axis([0 Tf -2 2]);
            
            subplot(2,1,2);
            plot(t,x,'r');
            title('Sinal de "Tempo Cont�nuo"')
            xlabel('t');
            ylabel('x(t)');
            hold on;
            plot(tnew,x_recon,'k');
            axis([0 Tf -2 2]);
            waitforbuttonpress;
            subplot(2,1,1);
            hold off;
            subplot(2,1,2);
            hold off;
        end
    case 'N�o'
        %break;
end


% ver o espectro
% Construct a questdlg with three options
options.Interpreter = 'tex';
options.Default = 'Sim';
choice = questdlg(['Ver o espectro dos sinais original e amostrado?'], ...
    'Menu de reconstru��o do sinal', ...
    'Sim','N�o',options);

% Gerenciar a resposta
switch choice
    case 'Sim'
        figure;
        subplot(2,2,1);
        plot(t,x,'r');
        title('Sinal original ("Cont�nuo no tempo")');
        xlabel('Tempo');
        ylabel('Amplitude');
        subplot(2,2,2)
        spec = fftshift(abs(fft(x,1024)).^2);
        Fg = 1/Tg;
        freq = [-Fg/2:Fg/1024:Fg/2];
        freq = freq(1:end-1);
        plot(freq,spec,'r');
        title('Espectro do sinal original ("Cont�nuo no tempo")');
        xlabel('Frequ�ncia');
        ylabel('Amplitude');
        
        subplot(2,2,3);
        plot(t,x,'r');
        hold on
        plot(t_sampled_with_zeros,x_sampled_with_zeros,'bo');
        legend('Sinal original','Sinal amostrado');
        title('Sinal amostrado');
        xlabel('Tempo');
        ylabel('Amplitude');
        subplot(2,2,4)
        fftsize = 1024;
        spec = fftshift(abs(fft(x_sampled_with_zeros,fftsize)).^2);
        Fd = 1/Ts;
        freq = [-Fd/2:Fd/fftsize:Fd/2];
        freq = freq(1:end-1);
        plot(freq,spec);
        title('Espectro do sinal amostrado');
        xlabel('Frequ�ncia');
        ylabel('Amplitude');
    case 'N�o'
        break;
end


