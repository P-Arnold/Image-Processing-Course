function MSE = calcMSE(Y1, Y2)
% It might be expected to do the calculations 
% but matlab has a mse function...
    MSE = immse(Y1,Y2);