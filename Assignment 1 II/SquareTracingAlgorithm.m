% I = imread('binaryImage.png');
I = [0 0 0 0 0 0 0 0;
     0 0 0 1 0 1 0 0;
     0 0 0 1 1 1 0 0;
     0 0 0 0 1 0 1 0;
     0 0 1 0 1 1 0 0;
     0 0 1 1 1 0 1 0;
     0 0 0 0 0 0 0 0];
I = im2bw(I,0.5); %#ok<IM2BW>

tic
[R, C] = size(I);
T = zeros(R+2, C+2);
for i = 1 : R
    for j = 1 : C
        T(i+1, j+1) = I(i, j);
    end
end

% From bottom to top and left to right 
% scan the cells of T until a black pixel, s, 
% of P is found. 
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

B = [];       % Set B to be empty
S = [Y, X];   % to be the starting pixel, s
B = [B, S];
P = [Y, X-1]; % Set the current pixel, p
path = 'W';

while ~isequal(P, S)           % While p not equal to s do
    Y = P(1); X = P(2);
    if T(Y, X) == 1            % If the current pixel p is black 
        B = insert(B, P);      % Insert s in B
        [X, Y, path] = left(X, Y, path);  % Turn left visit the left adjacent pixel of p
    else
        [X, Y, path] = right(X, Y, path); % Turn right
    end
    P = [Y, X];                % Update p i.e. set it to be the current pixel
end
B = B - 1;
toc

B_O = visualization(B, T); % visualization boundary
fprintf("Square Tracing Algorithm\n");
fprintf("  the coordinate:\n")
disp(B);
fprintf("  the coordinate axis:\n")
disp(B_O);
subplot(1,2,1), imshow(T,'InitialMagnification','fit'); title('original image');
subplot(1,2,2), imshow(B_O,'InitialMagnification','fit'); title('boundary image');