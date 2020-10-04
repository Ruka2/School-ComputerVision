T = imread('1.png');
T = im2bw(T,0.5); %#ok<IM2BW>
imshow(T);

[m, n]=size(T);
B = zeros(m, n);
N = [ -1 0; -1 -1; 0 -1; 1 -1; 1 0; 1 1; 0 1; -1 1 ];

for i = 2:m-1
    for j = 2:n-1
        
        if T(i, j) == 1
            for P8 = 1:8
                ii = i+N(P8, 1);
                jj = j+N(P8, 2);
                if T(ii, jj) == 0
                    B(ii, jj) = 1;
                    i = -ii + N(P8, 1);
                    j = -jj + N(P8, 1);
                    
                end
            end  

        end
    end
end
    
figure, imshow(B);
disp(B);
