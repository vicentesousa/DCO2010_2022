% MATLAB script for Illustrative Problem 1, Chapter 6.
echo on
T=1;
delta_f=1/(100*T);		
f=-5/T:delta_f:5/T;
sgma_a=1;
Sv=sgma_a^2*sinc(f*T).^2;
% plotting command follows
plot(f,Sv);