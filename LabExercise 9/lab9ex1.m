b=imread('w1.jpg');
d=imread('w2.jpg');
q=imread('w3.jpg');

b=rgb2gray(b);
d=rgb2gray(d);
q=rgb2gray(q);

b=imresize(b,[256 256]);
d=imresize(d,[256 256]); f=imnoise(q,'gaussian');
q=imresize(q,[256 256]);



d1=edge(b);
d2=edge(b,'Sobel');
d3=edge(b,'Prewitt');
d4=edge(b,'Roberts');
d5=edge(b,'log');
d6=edge(b,'zerocross');
d7=edge(b,'Canny');
d8=edge(b,'approxcanny');

figure,
subplot(3,3,1),imshow(b,'InitialMagnification','fit');title('Original')
subplot(3,3,2),imshow(d1,'InitialMagnification','fit');title('Edge');
subplot(3,3,3),imshow(d2,'InitialMagnification','fit');title('Sobel');
subplot(3,3,4),imshow(d3,'InitialMagnification','fit');title('Prewitt');
subplot(3,3,5),imshow(d4,'InitialMagnification','fit');title('Roberts');
subplot(3,3,6),imshow(d5,'InitialMagnification','fit');title('log');
subplot(3,3,7),imshow(d6,'InitialMagnification','fit');title('zerocross');
subplot(3,3,8),imshow(d7,'InitialMagnification','fit');title('Canny');
subplot(3,3,9),imshow(d8,'InitialMagnification','fit');title('approxcanny');