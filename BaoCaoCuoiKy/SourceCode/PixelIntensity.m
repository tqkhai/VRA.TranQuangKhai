function [imgTrainAll_hist, imgTestAll_hist] = PixelIntensity(imgDataTrain, imgDataTest)
    % set parameters for k and standardize
    nBins = input('Bins: ');
    

    % extract features of data test and data train
    imgTrainAll_hist = ExtractFeaturesHistogram(imgDataTrain, nBins);
    imgTestAll_hist = ExtractFeaturesHistogram(imgDataTest, nBins);
end