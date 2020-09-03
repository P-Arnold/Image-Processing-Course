
testArray = [1/2, 1/4, 1/8, 1/16, 1/64, 1/64, 1/64, 1/64];

logArray = testArray.*log2(testArray);
logArray(isnan(logArray))=0; %Replace any NaN from 0log0 with 0
entropy = sum(logArray)*-1;
fprintf("Entropy %d",entropy);