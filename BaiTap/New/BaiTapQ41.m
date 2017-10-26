function BaiTapQ41()
    fprintf('\n Load du lieu train\n');
    
    load('C:\Users\tqkha\Desktop\imgTrainImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTrainLabelsAll.mat');
    
    strMessage = 'Anh muon hien thi n: ';
    n = input(strMessage);

    figure;
    img = imgTrainImagesAll(:, n);
    img2D = reshape(img, 112, 92);
    strLabelImage = num2str(lblTrainLabelsAll(n));
    imshow(img2D);
    title(strLabelImage);   
end