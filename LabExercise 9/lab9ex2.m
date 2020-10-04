b=imread('w1.jpg');
d=imread('w2.jpg');
q=imread('w3.jpg');

b=rgb2gray(b);
d=rgb2gray(d);
q=rgb2gray(q);

f=imnoise(q,'gaussian');

figure,
subplot(3,3,1),imshow(q,'InitialMagnification','fit');title('Original')
subplot(3,3,2),imshow(edge(q,'Prewitt'),'InitialMagnification','fit');title('Prewitt');
subplot(3,3,3),imshow(edge(q,'Canny'),'InitialMagnification','fit');title('Canny');

subplot(3,3,4),imshow(f,'InitialMagnification','fit');title('Original')
subplot(3,3,5),imshow(edge(f,'Prewitt'),'InitialMagnification','fit');title('Prewitt');
subplot(3,3,6),imshow(edge(f,'Canny'),'InitialMagnification','fit');title('Canny');

subplot(3,3,7),imshow(d,'InitialMagnification','fit');title('Original')
subplot(3,3,8),imshow(edge(d,'Prewitt'),'InitialMagnification','fit');title('Prewitt');
subplot(3,3,9),imshow(edge(d,'Canny'),'InitialMagnification','fit');title('Canny');