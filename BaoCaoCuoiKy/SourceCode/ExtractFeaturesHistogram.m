function [imgData_hist] = ExtractFeaturesHistogram(imgData)
    nBins = 256;
    nData = size(imgData, 2);
    imgData_hist = zeros(nBins, nData);
    
    for i = 1 : nData
        imgData_hist(:, i) = imhist(imgData(:, i), nBins);
    end
end