clear all
close all

%  T = imread('binary_image.png');
% T = imread('1.png');
 T = imread('a2.jpg');
T = im2bw(T,0.5); %#ok<IM2BW>
traceit(T);
% disp(T);
figure, imshow(T,'InitialMagnification','fit');



function boundary = traceit(img)
    [R, C] = size(img);
    a(R, C) = 0;
    T(2 : R + 1, 2 : C + 1) = img;
    
    N = circshift( T, [ 0  1] );
    S = circshift( T, [ 0 -1] );
    E = circshift( T, [-1  0] );
    W = circshift( T, [ 1  0] );
    T_output = T - ( T + N + S + E + W == 5);
    
    
    for i = 1 : R
        for j = 1 : C
           if img(i, j) == 1
               break;
           end
        end
        if img(i, j) == 1
            break;
        end
    end
    
    B = [ j, i ] + 1;
    neigh = [ -1 0; -1 -1; 0 -1; 1 -1; 1 0; 1 1; 0 1; -1 1 ];
    exit_d = [1 2 3 4 6 7 8 9];
    
    for n = 1 : 8
        c = B + neigh(n, :);
        if T(c(2), c(1) ) == 1
            initial_position = c;
            break;
        end
    end
    
    init_d = exit_d( n );
    boundary(1, : ) = initial_position;
    
    position = initial_position;
    direction = init_d;
    
    while true
        for n = circshift( 1 : 8, [ 0, 1 - direction ] )
            c = position + neigh( n, : );
            if T( c( 2 ), c( 1 ) ) == 1
                position = c;
                break;
            end
        end
        
        direction = exit_d( n );
        
        if all( position == initial_position ) &&( direction == init_d )
           break;
        end
    end
    
    
%     disp(boundary_image);
    figure, imshow(T_output,'InitialMagnification','fit');
end