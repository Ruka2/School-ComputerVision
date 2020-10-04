global I Ebin tlo thi;
Image = imread('image1.png');
I = imgaussfilt(rgb2gray(Image), 0.5);
tlo = 2;
thi = 15;
canny_edge_detector;
figure,
subplot(1, 2, 1), imshow(Image); title('Original Image');
subplot(1, 2, 2), imshow(Ebin); title('Canny Edge Detector')

tlo = 10;
thi = 20;
canny_edge_detector;
figure,
subplot(1, 2, 1), imshow(Image); title('Original Image');
subplot(1, 2, 2), imshow(Ebin); title('Canny Edge Detector')

tlo = 20;
thi = 30;
canny_edge_detector;
figure,
subplot(1, 2, 1), imshow(Image); title('Original Image');
subplot(1, 2, 2), imshow(Ebin); title('Canny Edge Detector')

function canny_edge_detector
    global I Emag Enms Ebin M N tlo thi;
    [M, N] = size(I);

    Hx = [-0.5 0 0.5];
    Hy = [-0.5 0 0.5];

    Ix = zeros(M, N);
    Iy = zeros(M, N);
    Emag = zeros(M, N);
    Enms = zeros(M, N);
    Ebin = zeros(M, N);
    
    for u = 2 : M - 1
        for v = 2 : N - 1
            NeighX = neighX(u, v);
            NeighY = neighY(u, v);
            for i = 1 : 3
                Ix(u, v) = Ix(u, v) + NeighX(i) * Hx(i);
                Iy(u, v) = Iy(u, v) + NeighY(i) * Hy(i);
            end
            Emag(u, v) = (Ix(u, v) ^ 2 + Iy(u, v) ^ 2) ^ 0.5;
        end
    end

    for u = 2 : M-1
        for v = 2 : N-1
            dx = Ix(u, v);
            dy = Iy(u, v);
            s = GetOrientationSector(dx, dy);
            if isLocalMax(u, v, s, tlo)
                Enms(u, v) = Emag(u, v);
            end
        end
    end
    for u = 2 : M-1
        for v = 2 : N-1
            if Enms(u, v) >= thi && Ebin(u, v) == 0
                    TraceAndThreshold(u, v, tlo);
            end
        end
    end
                
end

function N = neighX(Y, X)
    global I;
    N = double([I(Y,     X-1), I(Y,     X), I(Y,     X+1)]);
end

function N = neighY(Y, X)
    global I;
    N = double([I(Y-1,   X), I(Y,     X), I(Y+1,   X)]);
end

function s = GetOrientationSector(dx, dy)
    D = [cos(-pi/8) -sin(-pi/8); sin(-pi/8)  cos(-pi/8)] * [dx;dy];
    dx1 = D(1);
    dy1 = D(2);
    if dy1 < 0
        dx1 = -dx1;
        dy1 = -dy1;
    end
    if dx1 >= 0 && dx1 >= dy1
        s = 0;
    elseif dx1 >=0 && dx1 < dy1
        s = 1;
    elseif dx1 < 0 && -dx1 < dy1
        s = 2;
    elseif dx1 < 0 && -dx1 >= dy1
        s = 3;
    end
end

function bool = isLocalMax(u, v, s, tlo)
    global Emag;
    mC = Emag(u, v);
    if mC < tlo
        bool = 0;
        return;
    else
        if s == 0
            mL = Emag(u-1, v);
            mR = Emag(u+1, v);
        elseif s == 1
            mL = Emag(u-1, v-1);
            mR = Emag(u+1, v+1);
        elseif s == 2
            mL = Emag(u, v-1);
            mR = Emag(u, v+1);
        elseif s == 3
            mL = Emag(u-1, v+1);
            mR = Emag(u+1, v-1);
        end
        bool = mL <= mC && mC >= mR;
    end
end

function TraceAndThreshold(u0, v0, tlo)
    global Ebin Enms M N;
    Ebin(u0, v0) = 1;
    uL = max(u0-1, 0);
    uR = min(u0+1, M-1);
    uT = max(v0-1, 0);
    uB = min(v0+1, N-1);
    for u = uL : uR
        for v = uT : uB 
            if Enms(u, v) >= tlo && Ebin(u, v) == 0
                TraceAndThreshold(u, v, tlo);
            end
        end
    end
end

