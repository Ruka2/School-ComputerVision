I = imread('binaryImage.png');
% I = [0 0 0 0 0 0
%      0 0 0 1 0 0
%      0 0 1 1 1 0
%      0 0 0 1 1 0
%      0 0 1 1 0 0
%      0 0 1 0 0 0
%      0 0 0 0 0 0];
 
I = im2bw(I,0.5); %#ok<IM2BW>

tic
[R, C] = size(I);
T = zeros(R+2, C+2);
for i = 1 : R
    for j = 1 : C
        T(i+1, j+1) = I(i, j);
    end
end

% From bottom to top and left to right scan the cells of
% T until a black pixel, s, of P is found
[L, P] = size(T);
for i = L : -1 : 1
    for j = 1 : P
        [Y, X] = scan(T, i, j);
        if Y ~= -1
            break;
        end
    end
    if Y ~= -1
        break;
    end
end

B = [];         % Set B to be empty.
S = [Y, X];
B = [B, S];     % Insert s in B. 
C = [Y-1, X];   % Set c to be the next clockwise pixel. 
startPoint = 6;

while ~isequal(S, C)  % While c not equal to s do 
    n = [Y-1, X-1,  Y-1,X,  Y-1,X+1,  Y,X+1,  Y+1,X+1,  Y+1,X,  Y+1,X-1,  Y,X-1]; % neigh
    startPoint = startPoint - 1;
    for i = 1 : 8
        Y = n(startPoint * 2 - 1);
        X = n(startPoint * 2);
        C = [Y, X];
        
        if isequal(S, C)
            break;
        end
        
        if T(Y, X) == 1
            B = [B; C]; %#ok<AGROW>  %insert c in B
            startPoint = backtrack(C, startPoint, n); % backtrack (move the current pixel c to the pixel from which p was entered)
            break;
        else
            if startPoint == 8
                startPoint = 1;
            else
                startPoint = startPoint + 1; % advance the current pixel c to the next clockwise pixel
            end
        end
          
    end
    
end
toc

fprintf("Moore Neighborhood Tracing Algorithm\n");
B_O = visualization(B, T);
fprintf("  the coordinate:\n")
disp(B);
fprintf("  the coordinate axis:\n")
disp(B_O);
subplot(1,2,1), imshow(T,'InitialMagnification','fit'); title('original image');
subplot(1,2,2), imshow(B_O,'InitialMagnification','fit'); title('boundary image');