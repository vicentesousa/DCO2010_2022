function bpsk_func=bpsk_func(ordem)
%programa produzido por Vicente Angelo de Sousa Junior
%outubro 2000

if strcmp(ordem,'simular'),
   handmem=findobj('Tag','mensagem');
   set(handmem,'String','Cálculo da Curva Teórica');
   pemin=1e-6;
   %zerar contadores
   handsnr=findobj('Tag','snrout');
	set(handsnr,'String','0');
   handerro=findobj('Tag','errout');
   set(handerro,'String','0');
   handbits=findobj('Tag','bitsout');
   set(handbits,'String','0');
   handpe=findobj('Tag','peout');
	set(handpe,'String','0');
   handts=findobj('Tag','tsout');
   set(handts,'String','0');
   %limpar gráfico
   handgraf=findobj('Tag','Axes1');
   set(gcf,'CurrentAxes',handgraf);
   cla;  
   %ler valor mínimo de escala em dB
   hdado2=findobj('tag','midB');
   aux2=get(hdado2,'string');
   mindB=str2num(aux2);
   
   %ler valor máximo de escala em dB
   hdado3=findobj('tag','madB');
   aux3=get(hdado3,'string');
   maxdB=str2num(aux3);
   
   EbNodB=mindB:0.1:maxdB;
   EbNo=10.^(EbNodB/10);
   proerr=q_func(sqrt(2*EbNo));
   semilogy(EbNodB,proerr);
   drawnow;
   hold on;
   axis([mindB maxdB pemin 1]);
   title('Probabilidade de Erro de Bit para Sistemas BPSK');
   xlabel('Eb/No(dB)');
   ylabel('Probabilidade de Erro de Bit');
   set(gcf,'Name','Probabilidade de Erro de Bit para Sistemas BPSK');
   set(gcf,'NumberTitle','off');
   
   %chamada para a simulação real do BPSK
   
   EbNon=mindB:1:maxdB;
   for v=1:length(EbNon),
      handmem=findobj('Tag','mensagem');
      mem=['Simulação: Ponto ' num2str(v)];
      set(handmem,'String',mem);
      probe(v)=findpe(EbNon(v));
      semilogy(EbNon(v),probe(v),'o');
      %teoria-simulação
      teorsimu=proerr-probe(v);
      handts=findobj('Tag','tsout');
      tsatual=num2str(teorsimu);
      set(handts,'String',tsatual);
      drawnow;
   end;
   %semilogy(EbNon,probe,'o');
   
elseif strcmp(ordem,'info'),
   
    ttlStr = 'Probabilidade de Erro em Sistemas BPSK'; 

    hlpStr1= ...                                              
      ['                                                        '
       '                                                        '
       '           Sistemas BPSK                                '
       '                                                        '
       ' Mapeamento do Sinal:                                   '
       '############################################            '
       '   S0 = -Eb, para o digito zero                         '
       '   S1 = Eb, para o digito um                            '
       'Onde: Eb é a energia do sinal(Normalizada para 1)       '
       '                                                        '
       '                                                        '
       '                                                        '
       ' Fonte de Sinal:                                        '
       '############################################            '
       ' Gerada com símbolos s(t) aleatórios e equiprováveis:   '
       ' +1 ou -1                                               '
       '                                                        '
       ' Canal:                                                 '
       '############################################            '
       ' Canal AWGN com densidade espectral igual a No/2 e média'
       ' m=0                                                    '
       '                                                        '
       ' O ruído visto pelo receptor e:                         '
       '    nr(t) = integral{n(t)*s(t)dt}                       '
       ' Assim, se sigma^2 é a variância:                       '
       ' sigma^2 = E[n^2]= Eb*No/2, mas sabendo que snr=Eb/No   '
       ' sigma^2 = Eb/sqrt(2*snr)                               '
       '                                                        '
       ' Detector:                                              '
       '############################################            '
       ' Filtro casado, com decisor de limiar igual a zero      '
       '                                                        '
       '                                                        '];
    
    helpwin(hlpStr1,ttlStr);
    
 end
   
function er=findpe(valordB)
  
%#####################################################################   
%Acha a probabilidade de um sistema binário PSK com um dado Eb/No(dB),
%através da simulação do sistema real
%#####################################################################


%######################
%leitura dos campos
%######################

%ler campo do número de bits transmitidos

hdado1=findobj('tag','nbt');
aux1=get(hdado1,'string');
N=str2num(aux1);


%N=10000;%número de bits transmitidos
E=1;%energia por bits
snr=10^(valordB/10);%relação Eb/No

handsnr=findobj('Tag','snrout');
snratual=num2str(valordB);
set(handsnr,'String',snratual);

nbitserrados=0;%inicialização do contador de erros de bits

%#############################################
%mapeamento do sinal
%#############################################

s0=[-1];%bit 0
s1=[1];%bit 1

%#############################################
%geração da fonte de dados
%#############################################

for u=1:N,
   aux(u)=rand;
   %gera um número entre 0 e 1
   %atribuição de -1 e -1 aos dígitos da fonte
   if (aux(u)<0.5)
      dados(u)=-1;
   else
      dados(u)=1;
   end;
end;
%#############################################
%Canal e detecção
%#############################################

for i=1:N,
   
handbits=findobj('Tag','bitsout');
Natual=num2str(i);
set(handbits,'String',Natual);
   
%#############################################
%Canal AWGN
%#############################################

   sigma=E/sqrt(2*snr);
   n=sigma*randn;
   r=dados(u)+n;%sinal na entrada do receptor
   
   
%#############################################
%decisor(lambda=0)
%#############################################

if (r<0)
   y=-1;%bit 0
else
   y=1;%bit 1
end;
   
%#############################################
%verificador de bit errado
%#############################################

if (y~=dados(u))
   nbitserrados=nbitserrados+1;
   handerro=findobj('Tag','errout');
   nbitserradosatual=num2str(nbitserrados);
   set(handerro,'String',nbitserradosatual);
end;

end
er=nbitserrados/N;

handpe=findobj('Tag','peout');
peatual=num2str(er);
set(handpe,'String',peatual);


%#############################################
%final da simulação
%#############################################

function q_func=q_func(ordem)
%Calcula a função Q(z)=1/sqrt(2*pi)*int(exp(-z^2/2),z,inf)
q_func=0.5*erfc(ordem/sqrt(2));
