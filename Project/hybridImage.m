function I = hybridImage(img1, img2, layer)
    sigma = 2;
    levels = 5;
%   h=high channel
%   l=low channel
    [~,h] = pyramids(img1,levels,sigma);
    [~,l] = pyramids(img2,levels,sigma);
    hybrid = cell(levels,1);
    hybrid{levels} = l{levels};

    for i = levels-1 : -1 : layer+1
        hybrid{i} = l{i} + imresize3(hybrid{i+1}, size(l{i}));
    end
    for i = layer: -1 : 1
        hybrid{i} = h{i} + imresize3(hybrid{i+1}, size(h{i}));
    end
    I = uint8(round(hybrid{1}));
end