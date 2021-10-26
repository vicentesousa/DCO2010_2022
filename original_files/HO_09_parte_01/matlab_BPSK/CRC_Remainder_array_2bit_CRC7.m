% This is the transmitter for CRC-7 With the polynomial X^7 + X^3 + 1 =
% 10001001 or 09H.

%Transmitter
clearvars *;
crc = 7;
msg=randi([0 1],1,8);
msg1=msg;
msg_count = numel(msg);


for c3=1:msg_count                                 %Iterate 16 times
    if msg(1)==1                            %Proceed with XOR only if the 1st bit is 1
    msg(1)=bitxor(msg(1),1);                %XOR with X^4
    msg(5)=bitxor(msg(5),1);                %XOR with X^3
    msg(8)=bitxor(msg(8),1);                %XOR with 1 (So makes it X^4+X^3+1)

    end
  
    if msg(1)==0                            % if the 1st bit of the message is 0 
        msg=[msg(2:msg_count) 0];                  %then left shift and append a '0' at the end.
    end
end
display('message')
mseg=[msg(1:crc)]                             %Select the first 4 bits of the 16 bit remainder to get 4 bits
trans=[msg1 mseg]                           %append remainder to the original message
% d = bi2de(mseg);
% disp (d);

%Receiver
remainder_array = 0;
i=1;
   for c4=1:(crc + msg_count)

       received_msg = trans;
        if received_msg(c4)== 1
           received_msg(c4) = 0;
        elseif received_msg(c4)== 0
           received_msg(c4) = 1;
        end
                 for c6=(c4+1):(crc + msg_count)
                        received_msg1 = received_msg;
                        if received_msg1(c6)== 1
                        received_msg1(c6) = 0;
                        elseif received_msg1(c4)== 0
                        received_msg1(c6) = 1;
                        end
                              
                            for c5=1:(crc + msg_count)                                
                             if received_msg1(1)==1                           
                             received_msg1(1)=bitxor(received_msg1(1),1);
                             received_msg1(5)=bitxor(received_msg1(5),1);                
                             received_msg1(8)=bitxor(received_msg1(8),1);                
                             end

                             if received_msg1(1)==0     
                             received_msg1=[received_msg1(2:(crc + msg_count)) 0]; 
                             end
                            end
                            
                         remainder = [received_msg1(1:crc)];
                         remainder_decimal = bi2de(remainder);
                         remainder_array(i,1) = c4;
                         remainder_array(i,2) = c6;
                         remainder_array(i,3) = remainder_decimal;

                         i=i+1;
                 end
   end
     remainder_array_sorted=sortrows(remainder_array,3);
     disp(remainder_array_sorted);       
   d=1;
for j=1:104
    z = j+1;
    if remainder_array_sorted(j,3) == remainder_array_sorted(z,3)
    remainder_array_repeated(d,:) = remainder_array_sorted(j,:);
    d = d + 1;
    remainder_array_repeated(d,:) = remainder_array_sorted(z,:);
    d = d+ 1;
    end
end
display ('Remainder Array Starts Here');
disp(remainder_array_sorted);
  