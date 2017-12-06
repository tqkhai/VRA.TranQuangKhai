function [nCount] = UsingSVM(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest)
    Mdl = fitcecoc(featureDataTrain', lblDataTrain);

    fprintf('-----------------------------------------\n');
    fprintf('Processing...\n');   

    lblResult = predict(Mdl, featureDataTest');
    
    fprintf('-----------------------------------------\n');
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
end