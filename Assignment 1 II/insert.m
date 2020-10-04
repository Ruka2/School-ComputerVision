function B = insert(B, P)
    [R, ~] = size(B);
    if B(R, 1) ~= P(1) ||  B(R, 2) ~= P(2)
        B = [B; P];
    end
end