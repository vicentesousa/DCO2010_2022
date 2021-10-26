clear all;
maxdB=12;
mindB=-4;
EbNodB=mindB:0.1:maxdB;
%EbNo=10.^(EbNodB/10);


EbNo=10.^(EbNodB/10);
   
proerr=q_func(sqrt(2*EbNo));

semilogy(EbNodB,proerr);
hold on;

axis([mindB maxdB 1e-5 1]);

title('Probabilidade de Erro de Bit para Sistemas BPSK');
xlabel('Eb/No(dB)');
ylabel('Probabilidade de Erro de Bit');
set(gcf,'Name','Probabilidade de Erro de Bit para Sistemas BPSK');
set(gcf,'NumberTitle','off');
clear all;


%simulação real do BPSK
EbNon=0:1:12;
for v=1:length(EbNon),
  probe(v)=findprob(EbNon(v));
end;

semilogy(EbNon,probe,'o');