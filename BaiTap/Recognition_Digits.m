function Recognition_Digits()
    %% Pro#1: nap du lieu anh train va anh test
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');
      
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
    %%
    
    %% Pro#2: Cho biet so luong anh train va anh test
    %anh train co cot la so luong anh / dong la kich thuoc cua anh
    nTrainImages = size(imgTrainAll, 2); % so cot
    nTrainLabels = size(lblTrainAll, 1); % so dong
    
    nTestImages = size(imgTestAll, 2);
    nTestLabels = size(lblTestAll, 1);
    
    nSizeOfImage = size(imgTrainAll, 1);
    
    fprintf('\n So luong anh train la: %d', nTrainImages);
    fprintf('\n So luong nhan anh train la: %d', nTrainLabels);
    fprintf('\n So luong anh test la: %d', nTestImages);
    fprintf('\n So luong nhan anh test la: %d', nTestLabels);
    fprintf('\n Kich thuoc cua mot anh la: %d', nSizeOfImage);
    %%
    
    %% Pro#3: hien thi anh #1 va anh cuoi cung cua du lieu train
%     figure;
%     img = imgTrainAll(:,1);
%     img2D = reshape(img,28, 28);
%     strLabelImage = num2str(lblTrainAll(1));
%     imshow(img2D);
%     title(strLabelImage);
%     
%     figure;
%     img = imgTrainAll(:, nTrainImages);
%     img2D = reshape(img, 28, 28);
%     strLabelImage = num2str(lblTrainAll(nTrainLabels));
%     imshow(img2D);
%     title(strLabelImage);
    
    %%
    
    %% Pro#4: hien thi anh ngau nhien trong bo du lieu train - test
    nNumber = randi([1 nTrainImages]);
    figure;
    img = imgTrainAll(:, nNumber);
    img2D = reshape(img, 28, 28);
    strLabelImage = num2str(lblTrainAll(nNumber));
    imshow(img2D);
    title(strLabelImage);
    
    
    %%
    
    fprintf('\n Ket thuc.\n');
end