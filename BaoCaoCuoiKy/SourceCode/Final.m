function Final()
    strDataTrain = 'dataset/train-images.idx3-ubyte';
    strLabelTrain = 'dataset/train-labels.idx1-ubyte';
    strDataTest = 'dataset/t10k-images.idx3-ubyte';
    strLabelTest = 'dataset/t10k-labels.idx1-ubyte';
    
    % Load du lieu train va du lieu test
    [imgDataTrain, lblDataTrain] = loadData(strDataTrain, strLabelTrain);
    [imgDataTest, lblDataTest] = loadData(strDataTest, strLabelTest);
    
    % Menu chon chuc nang can thuc hien
    fprintf('HELP\n');
    fprintf('Features:\n');
    fprintf('[1] Raw (pixel intensity)\n');
    fprintf('[2] Histogram of Oriented Gradients (HOG)\n');
    fprintf('[3]\n');
    
    fprintf('Choose feature: \n');
    
    fprintf('[1] \n');
    
    
end