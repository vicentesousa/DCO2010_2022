%Demonstration of BPSK Modulation and Demodulation


clear; 
clearvars;

N=8; %number of data bits
noiseVariance = 1.0; %Noise variance of AWGN channel 

%data=randn(1,N)>=0; %Generate uniformly distributed random data 
data_orig=randn(1,N)>=0; %Generate uniformly distributed random data 

[data]=encoder([data_orig]);


Rb=1e3; %bit rate 
amplitude=1; % Amplitude of NRZ data 
[time,nrzData,Fs]=NRZ_Encoder(data,Rb,amplitude,'Polar');
Tb=1/Rb;
subplot(4,2,1);
stem(data);
xlabel('Samples');
ylabel('Amplitude');
title('Input Binary Data');

axis([0,N,-0.5,1.5]); 
subplot(4,2,3);

plotHandle=plot(time,nrzData);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Polar NRZ encoded data'); 
set(plotHandle,'LineWidth',2.5); 
maxTime=max(time); 
maxAmp=max(nrzData); 
minAmp=min(nrzData); 
axis([0,maxTime,minAmp-1,maxAmp+1]); 
grid on;

Fc=2*Rb; 
osc = sin(2*pi*Fc*time); %BPSK modulation 
bpskModulated = nrzData.*osc; 
subplot(4,2,5); 
plot(time,bpskModulated);
xlabel('Time'); 
ylabel('Amplitude'); 
title('BPSK Modulated Data'); 
maxTime=max(time); 
maxAmp=max(nrzData); 
minAmp=min(nrzData); 
axis([0,maxTime,minAmp-1,maxAmp+1]);

%Adding Channel Noise

noise = sqrt(noiseVariance)*randn(1,length(bpskModulated)); 
received = bpskModulated + noise; 
subplot(4,2,2); 
plot(time,received); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('BPSK Modulated Data with AWGN noise');

%Receiver
%Multiplying the received signal with reference Oscillator

v = received.*osc;
%Integrator 
integrationBase = 0:1/Fs:Tb-1/Fs; 
for i = 0:(length(v)/(Tb*Fs))-1
    y(i+1)=trapz(integrationBase,v(int32(i*Tb*Fs+1):int32((i+1)*Tb*Fs)));
end

%Threshold Comparator 
estimatedBits=(y>=0) ;
subplot(4,2,4); 

stem(estimatedBits);
xlabel('Samples'); ylabel('Amplitude'); title('Estimated Binary Data'); axis([0,N,-0.5,1.5]);


[data_rcvd]=tc([estimatedBits]);

%Bit Error rate Calculation 
%BER = sum(xor(data,estimatedBits))/length(data)


BER = sum(xor(data_orig,data_rcvd))/length(data)
display ('The original data is');
%data
data_orig
display ('The original data is');
%estimatedBits
data_rcvd





