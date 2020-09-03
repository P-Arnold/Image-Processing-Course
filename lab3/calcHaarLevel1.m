function H = calcHaarLevel1(Y)
 % This function takes as input a 2D array Y containing
   % the image intensities of a picture and returns 1-level Haar
   % Haar Transform
   [vRes,hRes] = size(Y);
   H = zeros(vRes,hRes);
   T = 2^(-0.5) .* [1,1 ; 1,-1];
   for j = 1:2:vRes
       for i = 1:2:hRes 
           H(j:j+1,i:i+1) = T * double(Y(j:j+1,i:i+1)) * T' ;
       end
   end
   A = zeros(vRes/2,hRes/2);
   B = A;
   C = A;
   D = A;
   for j = 1:2:vRes
       for i = 1:2:hRes 
           a = H(j,i);
           A((j+1)/2,(i+1)/2) = a;
           b = H(j,i+1);
           B((j+1)/2,(i+1)/2) = b;
           c = H(j+1,i);
           C((j+1)/2,(i+1)/2) = c;
           d = H(j+1,i+1);
           D((j+1)/2,(i+1)/2) = d;
       end
   end
   H(1:vRes/2,1:hRes/2) = A;
   H(1:vRes/2,(hRes/2)+1:end) = B;
   H((vRes/2)+1:end,1:hRes/2) = C;
   H((vRes/2)+1:end,(hRes/2)+1:end) = D;
