function BaiTap014()
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    img1D= imgTrainAll(:, 1);
    img2D = reshape(img1D, 28, 28);
    featuresVector = extractHOGFeatures(img2D);
    nSize = length(featuresVector);
    nTrainData = size(imgTrainAll, 2);
    
    featuresDataTrain = zeros(nSize, nTrainData);
    for i = 1 : nTrainData
        img1D = imgTrainAll(:, i);
        img2D = reshape(img1D, 28, 28);
        featuresDataTrain(:, i) = extractHOGFeatures(img2D);
    end
    
    Mdl = fitcknn(featuresDataTrain', lblTrainAll);
    
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    
    imgI1D = imgTestAll(:, 1);
    imgI2D = reshape(imgI1D, 28, 28);
    featuresVector = extractHOGFeatures(imgI2D);
    nSize = length(featuresVector);
    nTestData = size(imgTestAll, 2);
    
    featuresDataTest = zeros(nSize, nTestData);
    
    for i = 1 : nTestData
        imgI1D = imgTestAll(:, i);
        imgI2D = reshape(imgI1D, 28, 28);
        featuresDataTest(:, i) = extractHOGFeatures(imgI2D);
    end
    
    lblResult = predict(Mdl, featuresDataTest');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);
end