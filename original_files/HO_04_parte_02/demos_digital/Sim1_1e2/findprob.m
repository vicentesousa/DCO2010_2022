function  er=findprob(snrdB)
%Acha a probabilidade de um sistema binário PSK com um dado Eb/No(dB),
%através da simulação do sistema real
N=10000;%número de bits transmitidos
E=1;%energia por bits
snr=10^(snrdB/10);%relação Eb/No
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
