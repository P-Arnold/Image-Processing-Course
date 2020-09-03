 close all;
% Y = [5/8, 3/32, 3/32, 1/32, 1/8, 1/32];
% X = Y.*log2(Y);
% disp(-sum(X));
fileName = 'girlface.bmp';
pic = imread(fileName);

% figure(1);
% imshow(pic,[0,255]);
% title(fileName);

% Haar transform of original image
haar1 = calcHaarLevel1(pic); 

% Quantised images and quantised, haar transformed images
Q_step = 5;
qPic5 = Q_step*round(pic/Q_step);
haarq5 = Q_step*round(haar1/Q_step);
Q_step = 10;
qPic10 = Q_step*round(pic/Q_step);
haarq10 = Q_step*round(haar1/Q_step);
Q_step = 20;
qPic20 = Q_step*round(pic/Q_step);
haarq20 = Q_step*round(haar1/Q_step);

% Reconstructed, quantised images
invH5 = calcInvHaar(haarq5,1);
invH10 = calcInvHaar(haarq10,1);
invH20 = calcInvHaar(haarq20,1);

% montage([pic,qPic]);
% entr = calcEntropy(pic);
% disp(entr);


% Subplot of reconstructed and quantised images
figure(3);
subplot(2,3,1);
imshow(invH5,[0,255]);
title("Inverse Haar, q=5");
subplot(2,3,2);
imshow(invH10,[0,255])
title("Inverse Haar, q=10");
subplot(2,3,3);
imshow(invH20,[0,255])
title("Inverse Haar, q=20");

subplot(2,3,4);
imshow(qPic5,[0,255]);
title("q=5");
subplot(2,3,5);
imshow(qPic10,[0,255])
title("q=10");
subplot(2,3,6);
imshow(qPic20,[0,255])
title("q=20");

% Entropy of quantised haar transforms
hEntrQ5 = haarEntropy(haarq5);
fprintf("Entropy of Haar image, q=5 %d",hEntrQ5);
hEntrQ10 = haarEntropy(haarq10);
fprintf("Entropy of Haar image, q=10 %d",hEntrQ10);
hEntrQ20 = haarEntropy(haarq20);
fprintf("Entropy of Haar image, q=20 %d\n",hEntrQ20);

mseHaarInv5 = calcMSE(invH5,double(pic));
fprintf("MSE between original and Haar image, q=5 %d\n",mseHaarInv5);
mseHaarInv10 = calcMSE(invH10,double(pic));
fprintf("MSE between original and Haar image, q=10 %d\n",mseHaarInv10);
mseHaarInv20 = calcMSE(invH20,double(pic));
fprintf("MSE between original and Haar image, q=20 %d\n",mseHaarInv20);

mseQpic5 = calcMSE(qPic5,pic);
fprintf("MSE between original and Quantised Image, q=5 %d\n",mseQpic5);
mseQpic10 = calcMSE(qPic10,pic);
fprintf("MSE between original and Quantised Image, q=10 %d\n",mseQpic10);
mseQpic20 = calcMSE(qPic20,pic);
fprintf("MSE between original and Quantised Image, q=20 %d\n",mseQpic20);
% qPic15 = 15*round(pic/15);
% figure(76);
% imshow(qPic15, [0, 255]);
% qh = 15*round(haar1/15);
% invhu = calcInvHaar(qh,1);
% figure(77);
% imshow(invhu, [0, 255]);


% MAYBE i hsould have been quantising after the transformation and not
% before...



% Q4
haar2 = calcHaar(pic,2);
haar3 = calcHaar(pic,3);
haar4 = calcHaar(pic,4);
haar5 = calcHaar(pic,5);

Q_step = 10;
haar2q10 = Q_step*round(haar2/Q_step);
haar3q10 = Q_step*round(haar3/Q_step);
haar4q10 = Q_step*round(haar4/Q_step);
haar5q10 = Q_step*round(haar5/Q_step);

% invH10
inv2H10 = calcInvHaar(haar2q10,2);
inv3H10 = calcInvHaar(haar3q10,3);
inv4H10 = calcInvHaar(haar4q10,4);
inv5H10 = calcInvHaar(haar5q10,5);
% invn5 = calcInvHaar(hq5n5,5);

figure(8);
subplot(2,3,1);
imshow(invH10,[0,255]);
title("Haar 1, q=10");
subplot(2,3,2);
imshow(inv2H10,[0,255]);
title("Haar 2, q=10");
subplot(2,3,3);
imshow(inv3H10,[0,255]);
title("Haar 3, q=10");
subplot(2,3,4);
imshow(inv4H10,[0,255]);
title("Haar 4, q=10");
subplot(2,3,5);
imshow(inv5H10,[0,255]);
title("Haar 5, q=10");


% hEntrQ10
fprintf("Qstep=10 & Haar=1, Entropy=%d\n",hEntrQ10);
haarEntN2 = haarEntropyN(haar2q10,2);
fprintf("Qstep=10 & Haar=2, Entropy=%d\n",haarEntN2);
haarEntN3 = haarEntropyN(haar3q10,3);
fprintf("Qstep=10 & Haar=3, Entropy=%d\n",haarEntN3);
haarEntN4 = haarEntropyN(haar4q10,4);
fprintf("Qstep=10 & Haar=4, Entropy=%d\n",haarEntN4);
haarEntN5 = haarEntropyN(haar5q10,5);
fprintf("Qstep=10 & Haar=5, Entropy=%d\n",haarEntN5);
% 
% qh10 = 10*round(pic/10);
% qhe = calcEntropy(qh10);
% disp(qhe);