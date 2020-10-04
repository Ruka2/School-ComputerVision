function B_O = visualization(B, T)
    [R, C] = size(T);
    B_O = zeros(R, C);
    [B_r, ~] = size(B);
    for B_i = 1 : B_r
        B_x = B(B_i,1);
        B_y = B(B_i,2);
        B_O(B_x, B_y) = 1;
    end
end