function BaiTap025()
    %% Load image data train
    rootFolder = fullfile('DataTrain');
    categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    
    imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
    tbl01 = countEachLabel(imds)
    
   
    
    minSetCount = min(tbl01{:, 2});
    imds = splitEachLabel(imds, minSetCount, 'randomize');
    tbl02 = countEachLabel(imds)
%     bags = bagOfFeatures(imds);
%     
%      %% save bags
%     filename = 'bags.mat';
%     save(filename, 'bags');  

    load('bags.mat');
    
    img =  readimage(imds, 1);
    featureVector = encode(bags, img);
    figure
    bar(featureVector)
    title('Visual word occurrences');
    xlabel('Visual word index');
    ylabel('Frequency of occurrence');
    
    categoryClassifier = trainImageCategoryClassifier(imds, bags);
    
    %% save category classifier
    filename = 'categoryClassifier.mat';
    save(filename, 'categoryClassifier');
    
    rootFolder = fullfile('DataTest');
    categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
    tbl01 = countEachLabel(imds)
    confMatrixTest = evaluate(categoryClassifier, imds);
    mean(diag(confMatrixTest));
    

    
end