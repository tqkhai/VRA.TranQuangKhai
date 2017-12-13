function [nCount] = UsingDL(featureDataTrain, lblDataTrain, featureDataTest, lblDataTest)
    classifier = fitcecoc(featureDataTrain, lblDataTrain, 'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'columns');
    
    lblResult = predict(classifier, featureDataTest);
    nResult = (lblDataTest == lblResult);
    nCount = sum(nResult);
end