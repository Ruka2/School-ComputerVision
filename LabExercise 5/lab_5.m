%�@�� : sexyRella
Image = imread('finger.jpg');
hist = imhist(Image);
extrMaxIndex = find(diff(sign(diff(hist)))==-2)+1;  %�Ҧ������̤j�Ȧ�m
extrMinIndex = find(diff(sign(diff(hist)))==+2)+1;  %�Ҧ������̤p�Ȧ�m
extrMaxValue = hist(extrMaxIndex);                  %�Ҧ������̤j�ȼƭ�
extrMinValue = hist(extrMinIndex);                  %�Ҧ������̤p�ȼƭ�

extrMaxValueSorted = sort(extrMaxValue);
extrMinValueSorted = sort(extrMinIndex);
LocalMax1 = extrMaxValueSorted(length(extrMaxValue));       %�����̤j��
LocalMax2 = extrMaxValueSorted(length(extrMaxValue) - 1);   %�����ĤG�̤j��

LocalMaxIndex1 = extrMaxIndex(extrMaxValue == LocalMax1);   %�����̤j�Ȧ�m
LocalMaxIndex2 = extrMaxIndex(extrMaxValue == LocalMax2);   %�����ĤG�̤j�Ȧ�m

%�b�G�ӳ̤j�Ȫ��϶�����̤p���ƭȧ@��threshold
MinValue = 1 / 0;
for i = 1 : length(extrMinValue)
    if extrMinIndex(i) < LocalMaxIndex1 && extrMinIndex(i) > LocalMaxIndex2
        MinValue = min(extrMinValue(i), MinValue);
    end
end
MinIndex = extrMinIndex(extrMinValue == MinValue);

%�Ϲ�
plot([LocalMaxIndex1,LocalMaxIndex1],[0, 2.5*10^4],'m--')
hold on
plot([LocalMaxIndex2,LocalMaxIndex2],[0, 2.5*10^4],'m--')
hold on
plot([MinIndex,MinIndex],[0, 2.5*10^4],'m--')
hold on
plot(imhist(Image));
hold off

%�Ϥ����G
threshold = double(MinIndex) / 255;
Image = im2bw(Image, threshold);
figure,imshow(Image)