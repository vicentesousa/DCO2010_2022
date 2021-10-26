function q_func=q_func(ordem)
%Calcula a função Q(z)=1/sqrt(2*pi)*int(exp(-z^2/2),z,inf)
q_func=0.5*erfc(ordem/sqrt(2));
