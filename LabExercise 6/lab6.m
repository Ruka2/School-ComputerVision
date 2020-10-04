A = [1 8 4 3 4
     1 1 1 7 8
     8 8 3 3 1
     2 2 1 5 2
     1 1 8 5 2];

[m, n] = size(A);
C = zeros(1, max(max(A)));
for x=1:1:m
    for y=1:1:n
        C(A(x, y)) = C(A(x, y)) + 1;
    end
end
C=C/sum(C);

for x=2:length(C)
    C(x) = C(x-1) + C(x);
end

C = round(C * max(max(A)));
for x=1:1:m
    for y=1:1:n
        A(x, y) = C(A(x, y));
    end
end

disp(C);