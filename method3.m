for(i=1:9)
% tic;
x=imread(['im' num2str(i) '.jpg']);
% figure,imshow(x);
ref=double(x);
asdsadsadsad
y=gamma_correction(x, [0 1], [0 1], 0.2);
% figure,imshow(y);
% y=imgaussfilt(y);
result=dehaze_fast(y,0.95,5);
% figure,imshow(result);
% toc;
result=histeq(result);
% figure,imshow(result);
im2=imsharpen(result);%%UNSHARP MASK
figure,imshow(im2);

% immse(ref,im2)
% ssim(im2,ref)
% [peaksnr, snr] = psnr(im2, ref)

l=['data' num2str(i)]
l2=['------------------------------------']
MSE=immse(ref,im2)
SSI=ssim(im2,ref)
[peaksnr, snr] = psnr(im2, ref)

end
