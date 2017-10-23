function BaiTap021()
    imgI = imread('cameraman.jpg');
    arrPointI = detectSURFFeatures(imgI);
    
    imgJ = imread('cameraman30.jpg');
    arrPointJ = detectSURFFeatures(imgJ);
    
    [arrFeatureI, arrValidPointI] = extractFeatures(imgI, arrPointI);
    [arrFeatureJ, arrValidPointJ] = extractFeatures(imgJ, arrPointJ);
    
    arrIndexPair = matchFeatures(arrFeatureI, arrFeatureJ);
    
    arrMatchedPointI = arrValidPointI(arrIndexPair(:, 1), :);
    arrMatchedPointJ = arrValidPointJ(arrIndexPair(:, 2), :);
    
    figure;
    ax = axes;
    
    showMatchedFeatures(imgI, imgJ, arrMatchedPointI, arrMatchedPointJ, 'montage', 'Parent', ax);
    title(ax, 'Candidate point matches');
    legend(ax, 'Matched points I', 'Matched points J');
end