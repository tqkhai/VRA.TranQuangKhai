function BaiTapQ48()
    fprintf('\n Load du lieu train');
    load('C:\Users\tqkha\Desktop\imgTrainImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTrainLabelsAll.mat');

    Mdl = fitcknn(imgTrainImagesAll', lblTrainLabelsAll);
        
    fprintf('\n Load du lieu test \n');
    load('C:\Users\tqkha\Desktop\imgTestImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTestLabelsAll.mat');
   
    lblTestAllCount = size(lblTestLabelsAll, 2);
	
    
    fprintf('\nPredicting... ');
    
    lblPredictTest = predict(Mdl, imgTestImagesAll');
    count = (lblPredictTest' == lblTestLabelsAll);
 
    Accuracy = sum(count) / lblTestAllCount;
    
    fprintf('Do chinh xac: %f8.3. \n', Accuracy);
end
