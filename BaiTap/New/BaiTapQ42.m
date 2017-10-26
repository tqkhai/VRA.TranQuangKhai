function BaiTapQ42()
    fprintf('\n Load du lieu train\n');
    
    load('C:\Users\tqkha\Desktop\imgTestImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTestLabelsAll.mat');
    
    strMessage = 'Anh muon hien thi n: ';
    n = input(strMessage);

    figure;
    img = imgTestImagesAll(:, n);
    img2D = reshape(img, 112, 92);
    strLabelImage = num2str(lblTestLabelsAll(n));
    imshow(img2D);
    title(strLabelImage);   
end