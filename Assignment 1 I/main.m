%{ RecursiveSearchAlgorithm }%
A = imread('binary_image_2.png');
fprintf('Recursive Labeling Algorithm£º\n');
disp(RecursiveSearchAlgorithm(A(:,:,1)));

%{ RowbyRowLabelingAlgorithm }%
B = imread('binary_image_2.png');
fprintf('Row-by-Row Labeling Algorithm£º\n');
disp(RowbyRowLabelingAlgorithm(B(:, :, 1)));

imshow(A,'InitialMagnification','fit'), title('Original Image');


%{ This is imshow binary image and processed image }%
% figure, imshow(B,'InitialMagnification','fit'), title('Original Image');
% C = RecursiveSearchAlgorithm(A(:, :, 1));
% C = mat2gray(C);
% figure, imshow(C,'InitialMagnification','fit'), title('Recursive Image');
% D = RowbyRowLabelingAlgorithm(B(:, :, 1));
% D = mat2gray(D);
% figure, imshow(D,'InitialMagnification','fit'), title('Row by Row Image');