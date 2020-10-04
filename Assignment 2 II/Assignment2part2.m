% CISC3029
% DB725742
% Ku Su Wa

clc
clear all
close all

RGB = imread('peppers.jpg');
RChannel    = RGB(:,:,1);
GChannel    = RGB(:,:,2);
BChannel    = RGB(:,:,3);

z   = zeros(size(RGB),class(RGB));
RImage = z;RImage(:,:,1) = RChannel;
GImage = z;GImage(:,:,2) = GChannel;
BImage = z;BImage(:,:,3) = BChannel;

subplot(2,2,1);image(RImage);title('Red segmentation')
subplot(2,2,2);image(GImage);title('Green segmentation')
subplot(2,2,3);image(BImage);title('Blue segmentation')
subplot(2,2,4);image(RGB);title('Final image')