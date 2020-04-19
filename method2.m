%% histogram equalization
for(i=1:9)
% clear all;
I = imread(['im' num2str(i) '.jpg']);
J = histeq(I);

filtered_img =double( J - 0.8.*imfilter(J,[0,1,0;1,-4,1;0,1,0],'replicate'));
% filtered_img2 = I + 0.8.*imfilter(I,[0,1,0;1,-4,1;0,1,0],'replicate');

% filtered_img4 = J - imfilter(J,[-1,-1,-1;-1,8,-1;-1,-1,-1],'replicate');
% figure;
% imshow(uint8(filtered_img));
result=dehaze_fast(filtered_img,0.95,5);
% result2=histeq(result);
% result=double( result - 0.8.*imfilter(result,[0,1,0;1,-4,1;0,1,0],'replicate'));
% im2=imsharpen(result);
figure;
imshow(uint8(result));

l=['data' num2str(i)]
l2=['------------------------------------']
MSE=immse(double(I),result)
SSI=ssim(result,double(I))
[peaksnr, snr] = psnr(result, double(I))
end
%% DCP

