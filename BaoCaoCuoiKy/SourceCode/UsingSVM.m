function [nCount] = UsingSVM(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest)
    fprintf('Processing...\n');   
    
    Mdl = fitcecoc(featureDataTrain', lblDataTrain);

    lblResult = predict(Mdl, featureDataTest');
    
    fprintf('-----------------------------------------\n');
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
end