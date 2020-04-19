% warning('off','all');

% tic;
for(i=1:6)
x=imread(['im' num2str(i) '.jpg']);
ref=double(x);

%% SPLITTING THE IMAGE INTO RGB CHANNEL

redChannel =x(:,:,1); 
greenChannel =x(:,:,2);
blueChannel =x(:,:,3);
redChannel=adapthisteq(redChannel);
blueChannel=adapthisteq(blueChannel);
greenChannel=adapthisteq(greenChannel);
HSV = rgb2hsv(x);
H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);
S=adapthisteq(S);
V=adapthisteq(V);
recombinedRGBImage=cat(3, redChannel, greenChannel, blueChannel);
recombinedHSVImage=uint8(cat(3,H,S,V));
finalimage=recombinedRGBImage+recombinedHSVImage;
x=finalimage;
% figure,imshow(x);

%% GAMMA CORRECTION->GAUSSIAN FILTERING->DCP->HISTOGRAM EQUALIZATION->UNSHARP MASKING
y=gamma_correction(x, [0 1], [0 1], 0.2); 
% figure,imshow(y);
% y=imgaussfilt(y);
result=dehaze_fast(y,0.95,5);
% figure,imshow(result);

% toc;
%result=histeq(result); 
im2=imsharpen(result);%%UNSHARP MASK
figure,imshow(im2);

l=['data' num2str(i)]
l2=['------------------------------------']
MSE=immse(ref,im2)
SSI=ssim(im2,ref)
[peaksnr, snr] = psnr(im2, ref)

end
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