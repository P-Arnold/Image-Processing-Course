function entropy = calcEntropy(pic)
    %This function takes as input a 2D array Y containing
    %the image intensities and returns the entropy.
    [vRes,hRes] = size(pic);
    numPix = vRes*hRes;
    s = size(unique(pic)); %Decided to take the number of different values in the image
    s = s(1);
    hist = histcounts(pic,s); %only create s bins
    probHist = hist/numPix;
    logArray = probHist.*log2(probHist);
    logArray(isnan(logArray))=0; %Replace any NaN from 0log0 with 0
    entropy = sum(logArray)*-1;