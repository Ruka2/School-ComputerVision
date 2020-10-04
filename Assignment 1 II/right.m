function [X, Y, path] = right(X, Y, path)
    if path == 'W'
        Y = Y-1;
        path = 'N';
    elseif path == 'N'
        X = X+1;
        path = 'E';
    elseif path == 'E'
        Y = Y+1;
        path = 'S';
    elseif path == 'S'
        X = X-1;
        path = 'W';
    end
end