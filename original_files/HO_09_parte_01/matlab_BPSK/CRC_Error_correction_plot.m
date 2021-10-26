%CRC Error Correction Capability Graph
% This graph represents the error correction capability of the CRC code.
% Typically the maximum CRC polynomial order used is 64
%
%x = 2:2:64;
%ezplot(nchoosek(L,2) == 2.^x);
%plot(x,L);



clearvars;
% syms t;
% L = (sqrt(1+4*t))/2;
% n = log2(t);
% axis([0 64 0 1000]);
% ezplot(L,n);

%L = 0:1:1000;
%n = log2(L*(L-1))-1;
%plot(L,n);

% Two bit errors

L =(2:100:10000);

n1 = log2(L);
n2 = log2(L.^2 - L);
n3 = log2(L.^3 - 3*L.^2 + 2*L);
n4 = log2(L.^4 + 6*L.^3 + 9*L.^2 + 2*L -6);

plotHandle1=semilogy(n1, L, 'Marker','o','color','k');
hold on

plotHandle2=semilogy(n2, L, 'Marker','x','color','k');
plotHandle3=semilogy(n3, L, 'Marker','^','color','k');
plotHandle4=semilogy(n4, L, 'Marker','+','color','k');


title('CRC Error Correction Capability'); 
ylabel('Size of Data packet in bits'); 
xlabel('Order of CRC polynomial');
grid on;
legend('1-bit error','2-bit error','3-bit error','4-bit error'); 

%hold off
 %plot(n1,L,'--rs','LineWidth',2)
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','g',...
%                 'MarkerSize',10);


