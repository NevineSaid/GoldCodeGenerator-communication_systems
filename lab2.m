    SR1 = [1 0 0 1 0 1 1 0 1 1];
SR2 = [0 0 0 1 0 1 1 0 1 1];
result1= [];
result2= [];
for i = 0:39
  
    %result with phase 3,8
    result1 =[result1 xor(SR1(10),xor(SR2(3),SR2(8)))];
    
    %result with phase 2,6
    result2 =[result2 xor(SR1(10),xor(SR2(2),SR2(6)))];
    % xor bit 3, 10
    out1 = xor(SR1(3), SR1(10));
    %shift reg
    SR1 = circshift(SR1,1);
    %replace bit
    SR1(1) = out1;

    %xor bits 2,3,6,8,9
    out2 = xor(xor(xor(xor(SR2(2),SR2(3)),SR2(6)), SR2(8)),SR2(9));
    %shift reg
    SR2 = circshift(SR2,1);
    %replace bit
    SR2(1) = out2;
    
end
 disp('first 20 chips: ');
 disp(result1(1:20));
 disp('second 20 chips: ');
 disp(result1(21:end));

 [c,lags] = xcorr(result1);
 stem(lags,c)
 figure;
 
 [c,lags] = xcorr(result2);
 stem(lags,c2)
 
 figure;
 [c,lags] = xcorr(result1,result2);
 stem(lags,c)
