close all;
clear all;
clc;

%% Display gaussian and laplacian pyramids of an image
I = imread('image\img_GL_1.jpg');
[Gau,Lap] = pyramids(I,5,2);

GP = Gau{2};
for i = 2 : 4
    GP = [padarray(Gau{i+1},[0 size(Gau{2},2)-size(Gau{i+1},2)], 255, 'post');GP];
end
GP = [Gau{1} padarray(GP,[size(Gau{1},1)-size(GP,1) 0], 255, 'pre');];
figure,imshow(uint8(round(GP))),title('Gaussian pyramid');

LP = Lap{2};
for i = 2 : 3
    LP = [padarray(Lap{i+1},[0 size(Lap{2},2)-size(Lap{i+1},2)], 255, 'post');LP];
end
LP = [Lap{1} padarray(LP,[size(Lap{1},1)-size(LP,1) 0], 255, 'pre');];
% figure,imshow(uint8(round(LP))),title('Laplacian pyramid');

A = [1 2; 3 4];
B = padarray(A, [1, 0],'post');
disp(B);