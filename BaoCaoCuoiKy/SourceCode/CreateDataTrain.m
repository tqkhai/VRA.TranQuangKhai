function CreateDataTrain()
    %% Load image data train
    imgTrainAll = loadMNISTImages('dataset\train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('dataset\train-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll, 2);
    
    %% Create Folders
    parfor i = 0 : 9
        mkdir(['DataTrain\' num2str(i)]);        
    end

    %% Extract images to folders
    index = zeros(1, 10);
    for i = 1 : nTrainImages
        imgI = imgTrainAll(:, i);
        img2D = reshape(imgI, 28, 28);
        category = lblTrainAll(i);
      
        %%n Padding fname with leading zeros
        strFileName = ['image_' num2str(index(1, category + 1), '%05d') '.jpg'];
        strPath = ['DataTrain\' num2str(category) '\' strFileName];
        
        %% Save images
        imwrite(img2D, strPath);
        index(1, category + 1) = index(1, category + 1) + 1;
    end
end