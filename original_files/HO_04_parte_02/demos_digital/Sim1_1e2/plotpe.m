clear all;
EbNodB=-4:0.1:24;

%EbNo=exp(EbNodB.*log(10)/10);
EbNo=10.^(EbNodB/10);

for k=1:5,
   M=2^k;
   proerr=2*q_func(sqrt(2*k*EbNo)*sin(pi/M));
   if (k==2)
      proerr=proerr/2;
   end
   
   semilogy(EbNodB,proerr);
   hold on;
end
axis([-4 24 1e-5 1]);
title('Probabilidade de Erro de Símbolo para Sistemas M-PSK');
xlabel('Eb/No(dB)');
ylabel('Probabilidade de Erro de Simbolo');
set(gcf,'Name','Probabilidade de Erro Teórica de Símbolo para Sistemas M-PSK');
set(gcf,'NumberTitle','off');
clear all;


%EbNon=0:1:10;
%for v=1:length(EbNon),
%  probe(v)=findprob(EbNon(v));
%end;

%semilogy(EbNon,probe,'o');