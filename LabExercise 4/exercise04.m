% CISC3029 DB725742 Ku Su Wa

J=imread('coins.jpg');

% init a all 0 matrix
% create a matrix with the same original image
% and make it double, it should be the same as format at equalation
K=zeros(270,669);
J1=im2double(J);
K=ones(size(J1));
 for i=1:1:100  % 100 times gaussian
    J=imnoise(I,'gaussian',0,0.02);
    J1=im2double(J);
    K=K+J1;
end
K=K/100;    %mean

figure;imshow(I);title('Original Image');
figure;imshow(J);title('Gaussian Image');
figure;imshow(K);title('De-noised Image');