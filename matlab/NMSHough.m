function [thinned] = NMSHough(H)

    %Zero pad image   
    paddedH = padarray(H, [1 1], 'both');
    
    for i = 2:1:size(paddedH, 1) - 1
        for j = 2:1:size(paddedH, 2) - 1
            if paddedH(i,j) < paddedH(i,j-1) || paddedH(i,j) < paddedH(i,j+1) || paddedH(i,j) < paddedH(i-1,j+1) || paddedH(i,j) < paddedH(i+1,j-1) || paddedH(i,j) < paddedH(i-1,j) || paddedH(i,j) < paddedH(i+1,j) || paddedH(i,j) < paddedH(i-1,j-1) || paddedH(i,j) < paddedH(i+1,j+1)
                paddedH(i,j) = 0;
            end
            
         end
    end
    
    thinned = paddedH(2:end-1,2:end-1);

end