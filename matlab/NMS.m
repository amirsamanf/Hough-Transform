function [thinned] = NMS(amp, mappedAngles)

    %Zero pad image   
    paddedAmp = padarray(amp, [1 1], 'both');
    paddedAng = padarray(mappedAngles, [1 1], 'both');
    
    %Convolution
    thinned = amp;

    for i = 2:1:size(paddedAmp, 1) - 1
        for j = 2:1:size(paddedAmp, 2) - 1
            if paddedAng(i,j) == 0
                if paddedAmp(i,j) < paddedAmp(i,j-1) || paddedAmp(i,j) < paddedAmp(i,j+1)
                    thinned(i,j) = 0;
                end
            elseif paddedAng(i,j) == 135
                if paddedAmp(i,j) < paddedAmp(i-1,j+1) || paddedAmp(i,j) < paddedAmp(i+1,j-1)
                    thinned(i,j) = 0;
                end
            elseif paddedAng(i,j) == 90
                if paddedAmp(i,j) < paddedAmp(i-1,j) || paddedAmp(i,j) < paddedAmp(i+1,j)
                    thinned(i,j) = 0;
                end                    
            elseif paddedAng(i,j) == 45
                if paddedAmp(i,j) < paddedAmp(i-1,j-1) || paddedAmp(i,j) < paddedAmp(i+1,j+1)
                    thinned(i,j) = 0;
                end                     
            end
         end
    end

end