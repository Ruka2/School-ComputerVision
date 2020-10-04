T = imread('a1.jpg');
T = im2bw(T,0.5); %#ok<IM2BW>
figure, imshow(T,'InitialMagnification','fit');

[m, n]=size(T);
B = zeros(m, n);
N = [-1 -1;  0 -1;  1 -1;
      1  0;         1  1;
      0  1;  -1 1; -1 0];

for i = 2:m-1
    for j = 2:n-1
        
        if T(i, j) == 1
            for P = 1:8
                ii = i+N(P, 1);
                jj = j+N(P, 2);
                if T(ii, jj) == 0
                    B(ii, jj) = 1;
                end
            end  

        end
    end
end
    
figure, imshow(B,'InitialMagnification','fit');
disp(B);










% N8 = [-1 -1;  0 -1;  1 -1;
%       1  0;         1  1;
%       0  1;  -1 1; -1 0];

%             for P8 = 1:8         %neighbor8
%                 ii = i+N4(P8, 1);
%                 jj = j+N4(P8, 2);
%                 if T(ii, jj) == 0
%                     B(ii, jj) = 1;
%                 end
%             end 
