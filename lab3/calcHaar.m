function H = calcHaar(Y,n)
if n
    if n>1 
        H = calcHaarLevel1(Y);
        [vRes,hRes] = size(H);
        lolo = H(1:vRes/2,1:hRes/2);
        H(1:vRes/2,1:hRes/2) = calcHaar(lolo,n-1);

    else
        H = calcHaarLevel1(Y);
    end
else 
    H = calcHaarLevel1(Y);
end