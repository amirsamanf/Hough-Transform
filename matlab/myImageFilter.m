function [img1] = myImageFilter(img0, h)

    %Flip kernel
    kernel = h;
    kernelFlip = kernel(end:-1:1,end:-1:1);
    
    %Zero pad image
    padding = floor((length(kernel)) / 2);    
    paddedImage = padarray(img0, [padding padding], 'both');    
    
    %Convolution
    img1 = double(ones(size(img0)));
    
    for i = padding+1:1:size(paddedImage, 1) - padding
        for j = padding+1:1:size(paddedImage, 2) - padding
            pix = 0;
            for kRow = -padding:1:padding
                for kCol = -padding:1:padding
                    pix = pix + paddedImage(i+kRow, j+kCol) * kernelFlip(kRow+padding+1, kCol+padding+1);
                end
            end
            img1(i,j) = pix;
         end
    end
    
    img1 = img1(padding+1:end,padding+1:end);

end


