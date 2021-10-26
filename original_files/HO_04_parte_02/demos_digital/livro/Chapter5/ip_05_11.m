% MATLAB script for Illustrative Problem 11, Chapter 5.
echo on
SNRindB=0:2:10;	  		     	
for i=1:length(SNRindB),
  % simulated error rate
  smld_err_prb(i)=smldP511(SNRindB(i));
  echo off;
end;
echo on ;
% Plotting commands follow