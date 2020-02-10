clear;

datadir     = '../ec';    %the directory containing the images
resultsdir  = '../ec'; %the directory for dumping results

%parameters
sigma     = 3;
threshold = 0.07;
rhoRes    = 1;
thetaRes  = pi/360;
nLines    = 50;
%end of parameters

imglist = dir(sprintf('%s/*.jpg', datadir));
for i = 1:numel(imglist)
    
    %read in images%
    [path, imgname, dummy] = fileparts(imglist(i).name);
    img = imread(sprintf('%s/%s', datadir, imglist(i).name));

    if (ndims(img) == 3)
        img = rgb2gray(img);
    end

    img = double(img) / 255;

    %actual Hough line code function calls%  
    [Im] = myEdgeFilter(img, sigma);   
    [H,rhoScale,thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes);
    [rhos, thetas] = myHoughLines(H, nLines);
        

    imshow(H,[],'XData',thetaScale,'YData',rhoScale,'InitialMagnification','fit');
    xlabel('\theta'), ylabel('\rho');
    axis on, axis normal, hold on;
    plot(thetaScale(thetas),rhoScale(rhos),'s','color','white');
    
    lines = houghlines(Im>threshold, 180*(thetaScale/pi), rhoScale, [rhos,thetas],'FillGap',5,'MinLength',10);
    
    %everything below here just saves the outputs to files%
    fname = sprintf('%s/%s_01edge.png', resultsdir, imgname);
    imwrite(sqrt(Im/max(Im(:))), fname);
    fname = sprintf('%s/%s_02threshold.png', resultsdir, imgname);
    imwrite(Im > threshold, fname);
    fname = sprintf('%s/%s_03hough.png', resultsdir, imgname);
    imwrite(H/max(H(:)), fname);
    fname = sprintf('%s/%s_04lines.png', resultsdir, imgname);
    
    img2 = img;
    for j=1:numel(lines)
       img2 = drawLine(img2, lines(j).point1, lines(j).point2); 
    end     
    imwrite(img2, fname);

    
end
    
