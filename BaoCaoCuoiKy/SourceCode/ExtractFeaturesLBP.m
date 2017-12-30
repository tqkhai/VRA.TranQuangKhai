function [featuresDataTrain] = ExtractFeaturesLBP(imgDataTrain, numNeighbors, radius, cellSize, normalization)
    
    imgI1D = imgDataTrain(:, 1);
    imgI2D = reshape(imgI1D, 28, 28);
    featureVector = extractLBPFeatures(imgI2D, 'NumNeighbors', numNeighbors, 'Radius', radius, 'CellSize', [cellSize cellSize], 'Normalization', normalization);
    
    nSize = length(featureVector);
    nTrainData = size(imgDataTrain, 2);
    featuresDataTrain = zeros(nSize, nTrainData);
    
    for i = 1 : nTrainData
        imgI1D = imgDataTrain(:, i);
        imgI2D = reshape(imgI1D, 28, 28);
        featuresDataTrain(:, i) = extractLBPFeatures(imgI2D, 'NumNeighbors', numNeighbors, 'Radius', radius, 'CellSize', [cellSize cellSize], 'Normalization', normalization);
    end
end