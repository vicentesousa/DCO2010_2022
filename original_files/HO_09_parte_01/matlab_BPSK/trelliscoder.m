function [trellis_coded_message]= trelliscoder(input_message)

% Trellis needs to be initialized into a null array
    trellis_coded_message=[];
    
    N=size(input_message,2);                         

    y=zeros(1,4);                              
    for k=1:N                                  
        y=[input_message(k) y(1:3)];                 

        % (2,1,4 Convolutional code)
        out1=xor(xor(y(1),y(2)),xor(y(3),y(4)));  
        out2=xor(xor(y(1),y(2)),y(4));
        trellis_coded_message=[trellis_coded_message out1 out2];      
    end
end