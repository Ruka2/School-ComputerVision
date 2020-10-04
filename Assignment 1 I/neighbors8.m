function Nset = neighbors8(LB, L, P)
    Nset = [];
    [R, C, ~] = size(LB);

    if L ~= 1
        Nset = [Nset, [L-1,P]]; %N
    end
    if L < R
        Nset = [Nset, [L+1,P]]; %S
    end
    if P ~= 1
        Nset = [Nset, [L,P-1]]; %W
    end
    if P < C
        Nset = [Nset, [L,P+1]]; %E
    end
    if L ~= 1 && P ~= 1
        Nset = [Nset, [L-1,P-1]]; %NW
    end
    if P ~= 1 && L < R
        Nset = [Nset, [L+1,P-1]]; %SW
    end
    if L ~= R && P < C
        Nset = [Nset, [L+1,P+1]]; %SE
    end
    if L ~= 1 && P < C
        Nset = [Nset, [L-1,P+1]]; %NE
    end
    
end