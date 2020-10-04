% : sexyRella
Image = imread('finger.jpg');
hist = imhist(Image);
extrMaxIndex = find(diff(sign(diff(hist)))==-2)+1;  %┮ΤЫ场程竚
extrMinIndex = find(diff(sign(diff(hist)))==+2)+1;  %┮ΤЫ场程竚
extrMaxValue = hist(extrMaxIndex);                  %┮ΤЫ场程计
extrMinValue = hist(extrMinIndex);                  %┮ΤЫ场程计

extrMaxValueSorted = sort(extrMaxValue);
extrMinValueSorted = sort(extrMinIndex);
LocalMax1 = extrMaxValueSorted(length(extrMaxValue));       %Ы场程
LocalMax2 = extrMaxValueSorted(length(extrMaxValue) - 1);   %Ы场材程

LocalMaxIndex1 = extrMaxIndex(extrMaxValue == LocalMax1);   %Ы场程竚
LocalMaxIndex2 = extrMaxIndex(extrMaxValue == LocalMax2);   %Ы场材程竚

%程跋丁いт程计threshold
MinValue = 1 / 0;
for i = 1 : length(extrMinValue)
    if extrMinIndex(i) < LocalMaxIndex1 && extrMinIndex(i) > LocalMaxIndex2
        MinValue = min(extrMinValue(i), MinValue);
    end
end
MinIndex = extrMinIndex(extrMinValue == MinValue);

%瓜钩
plot([LocalMaxIndex1,LocalMaxIndex1],[0, 2.5*10^4],'m--')
hold on
plot([LocalMaxIndex2,LocalMaxIndex2],[0, 2.5*10^4],'m--')
hold on
plot([MinIndex,MinIndex],[0, 2.5*10^4],'m--')
hold on
plot(imhist(Image));
hold off

%瓜挡狦
threshold = double(MinIndex) / 255;
Image = im2bw(Image, threshold);
figure,imshow(Image)