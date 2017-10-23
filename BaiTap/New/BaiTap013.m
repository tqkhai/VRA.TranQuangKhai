function BaiTap013()
    %% Load Data Train
    strData = './train-images.idx3-ubyte';
    strDataLabel = './train-labels.idx1-ubyte';
    
    [imgTrainData, lblTrainData] = loadData(strData, strDataLabel);
    
    %% Extract Features
    featuresDataTrain = ExtractFeaturesLBP(imgTrainData);
    
    %% Build model KNN
    Mdl = fitcknn(featuresDataTrain', lblTrainData);
    
    %% Load Data Test
    strTest = './t10k-images.idx3-ubyte';
    strTestLabel = './t10k-labels.idx1-ubyte';
    
    [imgDataTest, lblActualDataTest] = loadData(strTest, strTestLabel);
    
    %% Extract Features
    featuresDataTest = ExtractFeaturesLBP(imgDataTest);
    
    %% Save Result
    lblResult = predict(Mdl, featuresDataTest');
    nResult = (lblResult == lblActualDataTest);
    nCount = sum(nResult);
    
    fprintf('\nSo luong mau dung: %d\n', nCount);
end