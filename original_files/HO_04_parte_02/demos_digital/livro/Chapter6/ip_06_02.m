% MATLAB script for Illustrative Problem 2, Chapter 6.
echo on
T=1;
delta_f=1/(100*T);		
f=-5/T:delta_f:5/T;
Sv=2*(cos(pi*f*T).*sinc(f*T)).^2;
% plotting command follows
plot(f,Sv);