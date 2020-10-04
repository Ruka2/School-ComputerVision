function I = regionBlending(I1, I2, mask, levels, sigma)

    [~,L1] = pyramids(I1, levels, sigma);
    [~,L2] = pyramids(I2, levels, sigma);
    [GM,~] = pyramids(mask, levels, sigma);

    regionBlending = cell(levels, 1);
    for i = 1 : levels
        regionBlending{i} = GM{i} .* L1{i} + (1 - GM{i}) .* L2{i};
    end
    for i = levels-1 : -1 : 1
        regionBlending{i} = regionBlending{i} + imresize3(regionBlending{i+1}, size(regionBlending{i}));
    end
    I = uint8(round(regionBlending{1}));
    
end