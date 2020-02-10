function [img1] = myEdgeFilter(img0, sigma)

    hsize = 2 * ceil(3 * sigma) + 1;

    kSmooth = fspecial('gaussian',hsize,sigma);    
    kHoriz = double([1,0,-1;2,0,-2;1,0,-1]);
    kVert = double([1,2,1;0,0,0;-1,-2,-1]);

    smoothed = myImageFilter(img0, kSmooth);    
    imgx = myImageFilter(smoothed, kHoriz);
    imgy = myImageFilter(smoothed, kVert);
    
    amp = sqrt(imgx.^2+imgy.^2);
    ang = atand(imgy./imgx);    
    
    mappedAngles = mapAngles(ang);

    img1 = NMS(amp, mappedAngles);
    
    % remove border gradient
    img1(:,1:2) = 0;
    img1(:,end-1:end) = 0;
    img1(1:2,:) = 0;
    img1(end-1:end,:) = 0;
    
end
