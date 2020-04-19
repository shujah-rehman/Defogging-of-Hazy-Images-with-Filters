for(i=1:9)
    
x=imread(['im' num2str(i) '.jpg']);
% figure,imshow(x);
ref=double(x);

y=gamma_correction(x, [0 1], [0 1], 0.2);
% figure,imshow(y);
% y=imgaussfilt(y);
result=dehaze_fast(y,0.95,5);
% figure,imshow(result);

filtered_img =( result + (-0.5).*imfilter(result,[0,1,0;1,-4,1;0,1,0],'replicate'));
figure,imshow(filtered_img);

% immse(ref,filtered_img)
% ssim(filtered_img,ref)
% [peaksnr, snr] = psnr(filtered_img, ref)


l=['data' num2str(i)]
l2=['------------------------------------']
MSE=immse(ref,filtered_img)
SSI=ssim(filtered_img,ref)
[peaksnr, snr] = psnr(filtered_img, ref)

end