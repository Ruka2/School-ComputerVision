M = [1 8 4 3 4
     1 1 1 7 8
     8 8 3 3 1
     2 2 1 5 2
     1 1 8 5 2];

[R, C] = size(M);
A = zeros(1, max(max(M)));
for i = 1 : R
    for j = 1 : C
       A(M(i, j)) = A(M(i, j)) + 1;
       disp(A);
    end
end
A = A / sum(A);

for i = 2 : length(A)
    A(i) = A(i-1) + A(i);
end

A = round(A * max(max(M)));
for i = 1 : R
    for j = 1 : C
       M(i, j) = A(M(i, j));
    end
end