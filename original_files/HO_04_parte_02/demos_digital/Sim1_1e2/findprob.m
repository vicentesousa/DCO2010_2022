function  er=findprob(snrdB)
%Acha a probabilidade de um sistema bin�rio PSK com um dado Eb/No(dB),
%atrav�s da simula��o do sistema real
N=10000;%n�mero de bits transmitidos
E=1;%energia por bits
snr=10^(snrdB/10);%rela��o Eb/No
nbitserrados=0;%inicializa��o do contador de erros de bits

%#############################################
%mapeamento do sinal
%#############################################

s0=[-1];%bit 0
s1=[1];%bit 1

%#############################################
%gera��o da fonte de dados
%#############################################


for u=1:N,
   aux(u)=rand;
   %gera um n�mero entre 0 e 1
   %atribui��o de -1 e -1 aos d�gitos da fonte
   if (aux(u)<0.5)
      dados(u)=-1;
   else
      dados(u)=1;
   end;
end;
%#############################################
%Canal e detec��o
%#############################################

for i=1:N,

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
      nbitserrados=nbitserrados+1
   end;
   
 
end
er=nbitserrados/N;
