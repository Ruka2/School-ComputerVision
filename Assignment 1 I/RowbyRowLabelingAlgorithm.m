% B = imread('big.png');
% imshow(B,'InitialMagnification','fit'), title('Original Image');
% fprintf('Row-by-Row Labeling Algorithm£º\n');
% 
% disp(RowbyRowAlgorithm(B(:, :, 1)));
% C = RowbyRowAlgorithm(B(:, :, 1));
% 
% C = mat2gray(C);
% figure, imshow(C,'InitialMagnification','fit'), title('Row by Row Image');

function LB = RowbyRowLabelingAlgorithm(B)
    tic
    LB = negate(double(B) / 255);   
    [R, C] = size(LB);
    U = []; % To record
    label = 0;
    
    % Pass 1
    for L = 1 : R
        for P = 1 : C
            if LB(L, P) == -1
                [LB, U, label] = AssignLabel(LB, L, P, U, label);
            end
        end
    end
    
    % Pass 2
    [M, N] = size(U);
    for i = 1 : +2 : N
        L = U(i);
        P = U(i + 1);
        if LB(L, P-1) < LB(L-1, P)
            LabelL = LB(L, P-1); 
            LabelT = LB(L-1, P);
        else
            LabelL = LB(L-1, P); 
            LabelT = LB(L, P-1);
        end
        LB = Replace_LabelL(LabelL, LabelT, LB, L, P);
    end
    toc
end

function [LB, U, label] = AssignLabel(LB, L, P, U, label)
    left = L ~= 1 && LB(L-1, P) ~= -1 && LB(L-1, P) ~= 0;
    top = P ~= 1 && LB(L, P-1) ~= -1 && LB(L, P-1) ~= 0;
    
    if left && top && LB(L, P-1) ~= LB(L-1, P)
        U = [U, [L, P]];
    end
    
    %assign_label
    if left 
        LB(L, P) = LB(L-1, P);
    elseif top
        LB(L, P) = LB(L, P-1);
    else
        label = label + 1;
        LB(L, P) = label;
    end
    
end

function LB = Replace_LabelL(LabelL, LabelH, LB, L, P)
    LB(L, P) = LabelL;
    Nset = neighbors4(LB, L, P);
    [X, Y] = size(Nset);
    for i = 1 : +2 : Y
        L1 = Nset(i);
        P1 = Nset(i+1);
        if LB(L1, P1) == LabelH
            LB = Replace_LabelL(LabelL, LabelH, LB, L1, P1);
        end
    end
end