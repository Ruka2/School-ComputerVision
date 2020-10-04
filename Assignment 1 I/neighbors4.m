function Nset = neighbors4(LB, L, P)
    Nset = [];
    [R, C] = size(LB);
    
    if L ~= 1 %N
        Nset = [Nset, [L-1,P]];
    end
    if L < R  %S
        Nset = [Nset, [L+1,P]];
    end
    if P ~= 1 %W
        Nset = [Nset, [L,P-1]];
    end 
    if P < C %E
        Nset = [Nset, [L,P+1]];
    end
end