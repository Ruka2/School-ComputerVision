% B = imread('big.png');
% imshow(B,'InitialMagnification','fit'), title('Original Image');
% fprintf('Recursive Labeling Algorithm£º\n');
% 
% disp(RecursiveSearchAlgorithm(B(:,:,1)));
% C = RecursiveSearchAlgorithm(B(:, :, 1));
% 
% C = mat2gray(C);
% figure, imshow(C,'InitialMagnification','fit'), title('Recursive Image');

function LB = RecursiveSearchAlgorithm(B)
    tic
    LB = negate(double(B) / 255);
    label = 0;
    LB = find_components(LB, label);
    toc
end

function LB = search(LB, label, L, P)
    LB(L, P) = label;
    Nset = neighbors4(LB, L, P);
    [M, N] = size(Nset);
    for i = 1 : +2 : N
        % L'=Nset(i),P'=Nset(i+1)        
        if LB(Nset(i), Nset(i+1)) == -1
            LB = search(LB, label, Nset(i), Nset(i+1));
        end
    end
end

function LB = find_components(LB, label)
    [M, N] = size(LB);
	for L = 1 : M
    	for P = 1 : N
        	if LB(L, P) == -1
            	label = label + 1;
            	LB = search(LB, label, L, P);
            end
        end
    end
end