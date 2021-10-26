%This function is used for bit stuffing. Whenever, 5 consecutive ones are encountered
% the function appends a zero after it.

function [ bit_stuffed_message ] = bitstuff(input_message)

    a = input_message(1);
    msg_length=length(input_message);
    count = 0;
    
    % Loop to test for five consecutive ones and stuffing with a 0 if
    % encountered
    for i=2:(msg_length)
      if ((input_message(i-1)==1 && input_message(i)==1))
         count = count + 1;
      else
         count = 0;
      end
        
      if (count==4)
        if (i == msg_length)
           a = [a input_message(i)];
        else
           a = [a input_message(i) 0];
           count = -1;
        end
      else
           a = [a input_message(i)];
      end
    end
    
    % Bit Stuffed output message
    bit_stuffed_message = a;
end