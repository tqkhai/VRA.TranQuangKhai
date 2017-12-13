function [nCount, type] = ChooseMethod(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest)
    %% Methods
    KNN = 1;
    SVM = 2;
    DLM = 3; % deep learning method
    
    fprintf('-----------------------------------------\n');
    fprintf('Machine Learning Methods:\n');
    fprintf('[1] KNN\n');
    fprintf('[2] SVM\n');
    fprintf('[3] Deep Learning\n');            

    fprintf('-----------------------------------------\n');
    method = input('Choose method: ');

    fprintf('-----------------------------------------\n'); 
    fprintf(['Start time: ', datestr(datetime('now')), '\n']);
    fprintf('-----------------------------------------\n'); 
    switch method
        case KNN
            type = 'knn';
            nCount = UsingKNN(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest);
        case SVM
            type = 'svm';
            nCount = UsingSVM(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest);
        case DLM
            type = 'dl';
            nCount = UsingDL(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest);
    end
end