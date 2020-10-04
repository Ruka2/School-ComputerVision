% CISC3029 Project 2019
% Student no.1: DB725742
% Student name 1: Ku Su Wa
% Student no.2: DB725820
% Student name 2: Wong Weng Mui

clc;
clear;
close all;
%% Project 1
img = imread('image\img_GL_1.jpg');
[Gau,Lap] = pyramids(img,5,1);
% Gaussian Pyramid
GP = Gau{2};
for i = 2 : 4
    pad = size(Gau{2},2)-size(Gau{i+1},2);
    GP = [GP padarray(Gau{i+1},[pad 0], 255, 'pre')];
end
pad = size(Gau{1},1)-size(GP,1);
GP = [Gau{1} padarray(GP,[pad 0], 255, 'pre')];
figure();imshow(uint8(round(GP)));title('Gaussian pyramid');
% Laplacian Pyramid
LP = Lap{2};
for i = 2 : 3
    pad = size(Lap{2},2)-size(Lap{i+1},2);
    LP = [LP padarray(Lap{i+1},[pad 0], 255, 'pre')];
end
pad = size(Lap{1},1)-size(LP,1);
LP = [Lap{1} padarray(LP,[pad 0], 255, 'pre')];
figure();imshow(uint8(round(LP)));title('Laplacian pyramid')
%% Project 2
% method: hybridImage(img1, img2, layer)
% layer: cut off what pyramids

% [input 1]
I1 = imread('image\img_HI_1.jpg');
I2 = imread('image\img_HI_2.jpg');
I = hybridImage(I1, I2, 3);
figure();
subplot(1,3,1),imshow(I);title('Hybrid Image 1');
subplot(1,3,2),imshow(I1);title('Image 1');
subplot(1,3,3),imshow(I2);title('Image 2');
imwrite(I,'image\img_HI_Output_1.jpg');

% [input 2]
I1 = imread('image\img_HI_3.jpg');
I2 = imread('image\img_HI_4.jpg');
I = hybridImage(I1, I2, 3);
figure();
subplot(1,3,1),imshow(I);title('Hybrid Image 2');
subplot(1,3,2),imshow(I1);title('Image 1');
subplot(1,3,3),imshow(I2);title('Image 2');
imwrite(I,'image\img_HI_Output_2.jpg');

% [input 3]
I1 = imread('image\img_HI_5.jpg');
I2 = imread('image\img_HI_6.jpg');
I = hybridImage(I1, I2, 2);
figure();
subplot(1,3,1),imshow(I);title('Hybrid Image 3');
subplot(1,3,2),imshow(I1);title('Image 1');
subplot(1,3,3),imshow(I2);title('Image 2');
imwrite(I,'image\img_HI_Output_3.jpg');
%% Project 3
% Method: regionBlending(A,B,mask,levels,sigma)

% [input 1]
load('image\mask_1');
I1 = imread('image\img_RB_1.jpg');
I2 = imread('image\img_RB_2.jpg');
I = regionBlending(I1, I2, mask, 7, 2);
figure();
subplot(1,3,1),imshow(I);title('Region blending image 1');
subplot(1,3,2),imshow(I1);title('Image 1');
subplot(1,3,3),imshow(I2);title('Image 2');
imwrite(I,'image\img_RB_Output_1.jpg');

% [input 2]
load('image\mask_2');
I1 = imread('image\img_RB_3.jpg');
I2 = imread('image\img_RB_4.jpg');
I = regionBlending(I1, I2, mask, 5, 2);
figure();
subplot(1,3,1),imshow(I);title('Region blending image 2');
subplot(1,3,2),imshow(I1);title('Image 1');
subplot(1,3,3),imshow(I2);title('Image 2');
imwrite(I,'image\img_RB_Output_2.jpg');

% [input 3]
load('image\mask_3');
I1 = imread('image\img_RB_5.jpg');
I2 = imread('image\img_RB_6.jpg');
I = regionBlending(I1, I2, mask, 4, 2);
figure();
subplot(1,3,1),imshow(I);title('Region blending image 3');
subplot(1,3,2),imshow(I1);title('Image 1');
subplot(1,3,3),imshow(I2);title('Image 2');
imwrite(I,'image\img_RB_Output_3.jpg');
