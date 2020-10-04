function [Y, X] = scan(T, Y, X)
    [R, C] = size(T);
    if Y > 1 && T(Y-1, X) == 1
        Y = Y-1;
        
    elseif X > 1 && T(Y, X-1) == 1
        X = X-1;
        
    elseif Y < R && T(Y+1, X) == 1
        Y = Y+1;
        
    elseif X < C && T(Y, X+1) == 1
        X = X-1;
        
    else
        Y = -1;
        X = -1;
    end
end