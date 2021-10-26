function [success] = BPSKmod_channel_BPSKdemod(tests)
% BPSK Modulator + Channel + Demodulator
success = 0;
for j =1:tests
    
    %number of data bits
    N=100;

    %Noise variance of AWGN channel 
    noiseVariance = 1.0; 

    %Generate uniformly distributed random data
    data_orig=randn(1,N)>=0; %Generate uniformly distributed random data 
   [data]=encoder([data_orig]);


    Rb=1e3; %bit rate 
    amplitude=1; % Amplitude of NRZ data 
    [time,nrzData,Fs]=NRZ_Encoder(data,Rb,amplitude,'Polar'); % NRZ Encoding
    Tb=1/Rb;

    %BPSK Modulation
    Fc=2*Rb; 
    osc = sin(2*pi*Fc*time); %BPSK modulation 
    bpskModulated = nrzData.*osc; 


    % Adding Channel Noise
    noise = sqrt(noiseVariance)*randn(1,length(bpskModulated)); 
    received = bpskModulated + noise; 


    %BPSK Demodulation
    v = received.*osc;
    %Integrator 
    integrationBase = 0:1/Fs:Tb-1/Fs; 
    for i = 0:(length(v)/(Tb*Fs))-1
        y(i+1)=trapz(integrationBase,v(int32(i*Tb*Fs+1):int32((i+1)*Tb*Fs)));
    end


    %Threshold Comparator 
    estimatedBits=(y>=0) ;
    %display(' Original data is ')
    %data_orig
    
    %display(' The transmitted data is ')
    %data
    
    %display(' The received data is ')
    %estimatedBits

%    BER = sum(xor(data,estimatedBits))/length(data)
    comparelength = length(data);
    if (estimatedBits(1:comparelength)==data)
        success = success + 1;
    end
    success
    clearvars estimatedBits;
    clearvars data_orig;
    clearvars data;
    
end




