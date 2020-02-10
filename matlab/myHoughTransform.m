function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)

    rows = size(Im,1);
    cols = size(Im,2);
    
    maxD = sqrt((rows - 1)^2 + (cols - 1)^2);
    diag = rhoRes*ceil(maxD/rhoRes);
    
    rhoScale = -diag:rhoRes:diag;
    thetaScale = 0:thetaRes:pi - thetaRes;
            
    numRhos = 2*(ceil(maxD/rhoRes)) + 1;
    numThetas = length(thetaScale);
    
    H = zeros(numRhos,numThetas);
    
    for theta = 1:numThetas
        for i = 1:rows
            for j = 1:cols
                if Im(i,j) > threshold
                    r = (j-1)*cos(thetaScale(theta)) + (i-1)*sin(thetaScale(theta));
                    [~,rho] = min(abs(rhoScale-ones(1,numRhos)*r));
                    H(rho,theta) = H(rho,theta) + 1;
                end
            end
        end    
    end 
        
    
    
end
        
        