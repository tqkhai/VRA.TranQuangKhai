function BaiTapQ45()
    fprintf('\n Load du lieu train');
    load('C:\Users\tqkha\Desktop\imgTrainImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTrainLabelsAll.mat');
    
    Mdl = fitcknn(imgTrainImagesAll', lblTrainLabelsAll);
        
    fprintf('\n Load du lieu test \n');
    load('C:\Users\tqkha\Desktop\imgTestImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTestLabelsAll.mat');
    
    strMessage = 'Anh muon du doan n: ';
    n = input(strMessage);
 
    imgTest = imgTestImagesAll(:,n);
    lblPredictTest = predict(Mdl, imgTest');
    
    fprintf('Label: %d. \n', lblPredictTest);;
end
