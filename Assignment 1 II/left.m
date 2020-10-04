function [X, Y, path] = left(X, Y, path)
    if path == 'N'
        X = X-1;
        path = 'W';
    elseif path == 'E'
        Y = Y-1;
        path = 'N';
    elseif path == 'S'
        X = X+1;
        path = 'E';
    elseif path == 'W'
        Y = Y+1;
        path = 'S';
    end
end