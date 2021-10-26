% LDPC Example\\
 i = 1;
 for noiseVar = 0.1:0.1:0.1; 
 success = 0;
    hEnc = comm.LDPCEncoder;
    hMod = comm.PSKModulator(2, 'BitInput',true);
    hChan  = comm.AWGNChannel('NoiseMethod', 'Variance', 'Variance', noiseVar);
    hDemod = comm.PSKDemodulator(2, 'BitOutput',true,...
            'DecisionMethod','Approximate log-likelihood ratio', ...
            'Variance', noiseVar);
    hDec = comm.LDPCDecoder;
    hError = comm.ErrorRate;
    for counter = 1:100
      data           = logical(randi([0 1], 32400, 1));
      encodedData    = step(hEnc, data);
      modSignal      = step(hMod, encodedData);
      receivedSignal = step(hChan, modSignal);
      demodSignal    = step(hDemod, receivedSignal);
      receivedBits   = step(hDec, demodSignal);
      errorStats     = step(hError, data, receivedBits);
      if (receivedBits == data)
         success = success + 1;
      end
    end
    fprintf('Error rate       = %1.2f\nNumber of errors = %d\nNumber of bits = %d\n', ...
      errorStats(1), errorStats(2), errorStats(3))

    display('The noise variance is');
    display(noiseVar)
    error_matrix(i,1) = errorStats(1);
    error_matrix(i,2) = errorStats(2);
    error_matrix(i,3) = errorStats(3);
    success_results(i) = success;
    i = i+ 1;
 end