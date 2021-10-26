% This is the transmitter for CRC-5 With the polynomial X^5 + X^3 + 1 =
% 101001 or 09H.

%Transmitter
msg=[1 1 1 1 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0];
msg1=msg;
for c3=1:26                                 %Iterate 16 times
    if msg(1)==1                            %Proceed with XOR only if the 1st bit is 1
    msg(1)=bitxor(msg(1),1);                %XOR with X^4
    msg(3)=bitxor(msg(3),1);                %XOR with X^3
    msg(6)=bitxor(msg(6),1);                %XOR with 1 (So makes it X^4+X^3+1)

    end
  
    if msg(1)==0                            % if the 1st bit of the message is 0 
        msg=[msg(2:26) 0];                  %then left shift and append a '0' at the end.
    end
end
display('message')
mseg=[msg(1:5)]                             %Select the first 4 bits of the 16 bit remainder to get 4 bits
trans=[msg1 mseg]                           %append remainder to the original message
% d = bi2de(mseg);
% disp (d);
remainder_array = 0;
%Receiver

  for c4=1:31
      received_msg = trans;
      if received_msg(c4)== 1
         received_msg(c4) = 0;
      elseif received_msg(c4)== 0
         received_msg(c4) = 1;
      end
      received_msg1 = received_msg;
    for c5=1:31                                         %Iterate 31 times
    if received_msg(1)==1                               %Proceed with XOR only if the 1st bit is 1
    received_msg(1)=bitxor(received_msg(1),1);          %XOR with X^4
    received_msg(3)=bitxor(received_msg(3),1);          %XOR with X^3
    received_msg(6)=bitxor(received_msg(6),1);          %XOR with 1 (So makes it X^4+X^3+1)
    end
  
    if received_msg(1)==0                            % if the 1st bit of the message is 0 
       received_msg=[received_msg(2:31) 0];                  %then left shift and append a '0' at the end.
    end
    end
     remainder = [received_msg(1:5)];
    remainder_decimal = bi2de(remainder);
    remainder_array(c4,1) = remainder_decimal;
    remainder_array(c4,2) = c4;
    remainder_array_sorted=sortrows(remainder_array,1);
    

  end
      disp(remainder_array);  
%  end