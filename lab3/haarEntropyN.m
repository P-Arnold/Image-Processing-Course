function entropy = haarEntropyN(Y,n)
if n
    if n>1 
        [vRes,hRes] = size(Y);
        lolo = Y(1:vRes/2,1:hRes/2);
        
        loloEntropy = haarEntropyN(lolo,n-1);
        
        hilo = Y(1:vRes/2,(hRes/2)+1:end);
        lohi = Y((vRes/2)+1:end,1:hRes/2);
        hihi = Y((vRes/2)+1:end,(hRes/2)+1:end);
        tempEntropy = loloEntropy;
        tempEntropy = tempEntropy + calcEntropy(hilo);
        tempEntropy = tempEntropy + calcEntropy(lohi);
        tempEntropy = tempEntropy + calcEntropy(hihi);
        entropy = tempEntropy/4;
    else
        entropy =  haarEntropy(Y);
    end
else 
    entropy = haarEntropy(Y);
end