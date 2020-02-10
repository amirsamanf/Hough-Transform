function [rhos, thetas] = myHoughLines(H, nLines)

    h2 = NMSHough(H);

    [~, sortIndex] = sort(h2(:), 'descend');
    maxIndex = sortIndex(1:nLines);

    indeces = zeros(nLines,2);
    for i = 1:length(maxIndex)
        [row,col] = ind2sub(size(h2),maxIndex(i));
        indeces(i,1) = row;
        indeces(i,2) = col;
    end
    
    rhos = indeces(:,1);
    thetas = indeces(:,2);


end
        