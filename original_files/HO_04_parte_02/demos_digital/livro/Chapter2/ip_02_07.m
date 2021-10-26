% MATLAB script for Illustrative Problem 7, Chapter 2.
echo on
N=256;					% number of samples
deltaf=0.1;				% frequency separation
f=[0:deltaf:(N/2)*deltaf, -(N/2-1)*deltaf:deltaf:-deltaf];
		        		% swap the first half
Sy=1./(1+(2*pi*f).^2);  		% sampled spectrum
Ry=ifft(Sy);				% Autocorrelation of Y
% plotting command follows
plot(fftshift(real(Ry)));		