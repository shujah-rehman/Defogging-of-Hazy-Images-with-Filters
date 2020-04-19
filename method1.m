% warning('off','all');
clear all;
close all;
% tic;
x=imread('im9.jpg');
% figure,imshow(x);
ref=double(x);

%% GAMMA CORRECTION->DCP->UNSHARP MASKING
y=gamma_correction(x, [0 1], [0 1], 0.2); 
% figure,imshow(y);
result=dehaze_fast(y,0.95,5);
% toc;
% figure,imshow(result);
%result=histeq(result); 
im2=imsharpen(result);%%UNSHARP MASK
figure,imshow(im2);

mse=immse(ref,im2)
SSI=ssim(im2,ref)
[peaksnr, snr] = psnr(im2, ref)

%% 
%%image = double(imread('city_2.jpg'))/255;
%%image = imresize(image, 0.4);
%image=histeq(image); %%HISTOGRAM EQUALIZATION
%%result = dehaze_fast(image, 0.95, 5);
%%toc;
%%im2=imsharpen(result); %%UNSHARP MASK
%%figure,imshow(result);
%%figure, imshow(image);

% warning('on','all');