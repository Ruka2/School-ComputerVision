function [Gaussian, Laplacian] = pyramids(img,levels,sigma)
    img = double(img);
    Gaussian = cell(levels,1);
    Gaussian{1} = img;

    % Guassian filter
    hsize = [3 3];
    h = fspecial('gaussian',hsize,sigma);
    
    %% Gaussian Pyramid %%%
    for i = 2:levels
        % Guassian filtering
        img = imfilter(Gaussian{i-1}, h,'conv','same','replicate');
        % Downsampling
        Gaussian{i} = img(1:2:end,1:2:end,:);
    end
    %% Laplacian Pyramid %% 
    Laplacian = cell(levels-1,1);
    Laplacian{levels} = Gaussian{levels};
    for i = levels-1:-1:1 
    % Upsampling
    if ndims(img) == 3
        img = imresize3(Gaussian{i+1}, size(Gaussian{i}));
    elseif ismatrix(img)
        img = imresize(Gaussian{i+1}, size(Gaussian{i}));
    end
    Laplacian{i} = Gaussian{i} - imfilter(img, h,'conv','same','replicate');
    end 
end