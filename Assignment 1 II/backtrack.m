function start = backtrack(C, start, neigh)
    posi = [8, 8, 2, 2, 4, 4, 6, 6];
    if start * 2 - 3 < 1
        C = [neigh(15), neigh(16)];
    else
        C = [neigh(start * 2 - 3), neigh(start * 2 - 2)];
    end
    start = posi(start);
end