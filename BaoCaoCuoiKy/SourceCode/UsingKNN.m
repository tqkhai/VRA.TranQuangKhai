function [nCount] = UsingKNN(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest)
    k = input('k = ');
    standardize = input('Standardize (0 or 1): ');
    Mdl = fitcknn(featureDataTrain', lblDataTrain, 'NumNeighbors', k, 'Standardize', standardize);

    fprintf('-----------------------------------------\n');
    fprintf('Processing...\n');   

    lblResult = predict(Mdl, featureDataTest');
    
    fprintf('-----------------------------------------\n');
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
end