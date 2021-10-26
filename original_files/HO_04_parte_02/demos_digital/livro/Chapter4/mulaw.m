function [y,a]=mulaw(x,mu)
%MULAW		mu-law nonlinearity for non-uniform PCM.
%		Y=MULAW(X,MU) 
%		X=input vector.

a=max(abs(x));
y=(log(1+mu*abs(x/a))./log(1+mu)).*signum(x);

