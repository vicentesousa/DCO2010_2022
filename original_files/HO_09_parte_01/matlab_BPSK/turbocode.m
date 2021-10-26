% Turbo Example
 i=1;
 for noiseVar = 0.1:0.1:6.0; 
 success = 0;
 
 frmLen = 100;
 s = RandStream('mt19937ar', 'Seed', 11);
 intrlvrIndices = randperm(s, frmLen);
 hTEnc  = comm.TurboEncoder('TrellisStructure', poly2trellis(4,[13 15 17], 13), 'InterleaverIndices', intrlvrIndices);
 hMod   = comm.BPSKModulator;
 hChan  = comm.AWGNChannel('NoiseMethod', 'Variance', 'Variance', noiseVar);
 hTDec  = comm.TurboDecoder('TrellisStructure', poly2trellis(4,[13 15 17], 13), 'InterleaverIndices', intrlvrIndices,'NumIterations', 4);
 hError = comm.ErrorRate;
  
  
    for frmIdx = 1:100
        data = randi(s, [0 1], frmLen, 1);
        encodedData = step(hTEnc, data);
        modSignal = step(hMod, encodedData);
        receivedSignal = step(hChan, modSignal);
  
        % Convert received signal to log-likelihood ratios for decoding
        receivedBits  = step(hTDec, (-2/(noiseVar/2))*real(receivedSignal));
        if (receivedBits == data)
            success = success + 1;
        end
        errorStats = step(hError, data, receivedBits);
    end
    fprintf('Error rate = %f\nNumber of errors = %d\nTotal bits = %d\n', ...
    errorStats(1), errorStats(2), errorStats(3))
    display('The noise variance is');
    display(noiseVar)
    error_matrix(i,1) = errorStats(1);
    error_matrix(i,2) = errorStats(2);
    error_matrix(i,3) = errorStats(3);
    success_results(i) = success;
    i = i+ 1;
 end