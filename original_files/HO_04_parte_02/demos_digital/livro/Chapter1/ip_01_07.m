% MATLAB script for Illustrative Problem 7, Chapter 1.
echo on
df=0.01;					% Freq. resolution
fs=5;						% Sampling frequency
ts=1/fs;                            		% Sampling interval
t=[-5:ts:5];                        		% Time vector
x=zeros(1,length(t));          			% Input signal initiation
x(16:26)=t(16:26)+2;
x(27:31)=2*ones(1,5);
x(32:41)=2+2*cos(0.5*pi*t(32:41));
x(42:46)=2*ones(1,5);
% Part 1
[X,x1,df1]=fftseq(x,ts,df);         		% Spectrum of the input
f=[0:df1:df1*(length(x1)-1)]-fs/2;  		% frequency vector
X1=X/fs;                            		% Scaling
% Part 2
% Filter transfer function
H=[ones(1,ceil(1.5/df1)),zeros(1,length(X)-2*ceil(1.5/df1)),ones(1,ceil(1.5/df1))];     		
Y=X.*H;                             		% Output spectrum
y1=ifft(Y);                         		% Output of the filter
% Part 3
% LTI system impulse response
h=[zeros(1,ceil(5/ts)),t(ceil(5/ts)+1:ceil(6/ts)),ones(1,ceil(7/ts)-ceil(6/ts)),zeros(1,51-ceil(7/ts))];
y2=conv(h,x);					% Output of the LTI system
pause	% Press a key to see spectrum of the input
plot(f,fftshift(abs(X1)))
pause	% Press a key to see the output of the lowpass filter
plot(t,abs(y1(1:length(t))));
pause	% Press a key to see the output of the LTI system
plot([-10:ts:10],y2);
