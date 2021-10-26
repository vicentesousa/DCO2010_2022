function x=invmulaw(y,mu)
%INVMULAW		The inverse of mu-law nonlinearity
%X=INVMULAW(Y,MU)	Y=Normalized output of the mu-law nonlinearity

x=(((1+mu).^(abs(y))-1)./mu).*signum(y);
