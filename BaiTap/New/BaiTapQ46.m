function BaiTapQ46()
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
    
    figure;
    img = imgTestImagesAll(:, n);
    img2D = reshape(img, 112, 92);
    strLabelImage = num2str(lblTestLabelsAll(n));
    imshow(img2D);
    
    caption = ['Label: ', strLabelImage, ' | Predict: ', num2str(lblPredictTest)];
    
    if(lblTestLabelsAll(n) == lblPredictTest)
        caption = [caption, ' ~ KHOP'];
    else
        caption = [caption, ' ~ KHONG KHOP'];
    end 
    
    title(caption);  
end
