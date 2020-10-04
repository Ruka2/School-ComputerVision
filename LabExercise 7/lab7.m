% CISC3029 LAB 7 Image Filtering in Spatial Domain
% DB725742
% Ku Su Wa

Index=3;
I=imread('cameraman.tif');
I=imnoise(I,'salt & pepper',0.1);


k=zeros(Index);
[m,n]=size(I);
I2=zeros(m,n);

start = Index - floor(Index*0.5);
for x = start:1:m-floor(Index*0.5)
    for y = start:1:n-floor(Index*0.5)
        
        x1 = x-(floor(Index*0.5));
        y1 = y-(floor(Index*0.5));
        for p=1:1:Index % median of the gray-levels
            for q=1:1:Index
                k(p, q) = I(x1+p-1,y1+q-1);
            end
        end
        
        array=reshape(k,1,[]);
        c=length(array);
        for i=1:1:c-1  % Sort
            for i=1:1:c-1 %#ok<FXSET>
                a = array(1,i);
                b = array(1,i+1);
                if(a>b)
                    array(1,i) = b;
                    array(1,i+1) = a;
                end
            end
        end
        
        I2(x,y) = array(1,floor(Index*Index*0.5)+1); % median
        
    end
end

subplot(1,2,1),imshow(I,[]), title('Input');
subplot(1,2,2),imshow(I2,[]), title('Output');