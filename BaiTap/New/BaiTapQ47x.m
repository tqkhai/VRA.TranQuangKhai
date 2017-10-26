function BaiTapQ47x()
    a = zeros(40, 40);
    
    fprintf('\n Load du lieu train');
    load('C:\Users\tqkha\Desktop\imgTrainImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTrainLabelsAll.mat');

    Mdl = fitcknn(imgTrainImagesAll', lblTrainLabelsAll);
        
    fprintf('\n Load du lieu test \n');
    load('C:\Users\tqkha\Desktop\imgTestImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTestLabelsAll.mat');
   
    for index = 1:120
        imgTest = imgTestImagesAll(:,index);
        lblPredictTest = predict(Mdl, imgTest');
 
        if(lblPredictTest ~= lblTestLabelsAll(index))
            a(lblTestLabelsAll(index), lblPredictTest) = a(lblTestLabelsAll(index), lblPredictTest) + 1; 
        end
    end
    
    disp(a);
end
