    % ****************************************************************
    % This code takes in a message sequence and appends a 2 bit CRC
    % checksum to it. The CRC generator polynomial used here is
    % X^2+ X^1+ 1
    
    % To run this function, Pass the input message as the argumenst to the
    % function as Example CRC2 ([1 1 1 0 1]).
    % It returns the answer as [1 1 1 0 1 1 1]
    %*****************************************************************
    
    
    
    % Function Definition
    function [ CRC_encoded_message ]= CRC2(input_message)
    
    % Defining the generator polynomial as X^2 + X^1 + 1
    generator_polynomial=[1 1 1];
   
    % Appending two zeros pertaining to the generator to the input
    % sequence
    input_message = [input_message 0 0];
    %input_message = [1 1 0 1 0 0];
    
    % Calculating the length of messages
    gen_length=length(generator_polynomial);
    msg_length=length(input_message);

    
    dividend=input_message(1:gen_length);
    
    % Computing CRC by dividing the message appended with extra zeros
    % corrsponding to the genrator polynomial by the generator polynomial
    % and obtaining the remainder
    
    for i=1:(msg_length-gen_length+1);
        if dividend(1)==1
           remainder=xor(dividend,generator_polynomial);
        else
           remainder=dividend;
        end
        if gen_length + i <= msg_length
           dividend=[remainder(2:end) input_message(length(generator_polynomial)+i)];
        end
    end
    
    
    remainder_append = remainder(2:end);
    
    % Message appended with CRC
    CRC_encoded_message=[input_message(1:msg_length-gen_length+1) remainder_append];
    
    end