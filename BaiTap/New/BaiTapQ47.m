function BaiTapQ47()
    fprintf('\n Load du lieu train');
    load('C:\Users\tqkha\Desktop\imgTrainImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTrainLabelsAll.mat');

    Mdl = fitcknn(imgTrainImagesAll', lblTrainLabelsAll);
        
    fprintf('\n Load du lieu test \n');
    load('C:\Users\tqkha\Desktop\imgTestImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTestLabelsAll.mat');
    
    lblTestAllCount = size(lblTestLabelsAll, 2);
    
    strMessage = 'Anh muon du doan n: ';
    n = input(strMessage);
    
    index = 1;
    FailedTestRecognitionCount = 0; 
    
    while index ~= lblTestAllCount
        if(lblTestLabelsAll(index) == n)
            imgTest = imgTrainImagesAll(:,index);
            lblPredictTest = predict(Mdl, imgTest');
            
            if(lblPredictTest ~= n)
                FailedTestRecognitionCount = FailedTestRecognitionCount + 1;
            end
        end
        
        index = index + 1;
    end
    
    fprintf('So luong anh sai: %d. \n', FailedTestRecognitionCount);
end
