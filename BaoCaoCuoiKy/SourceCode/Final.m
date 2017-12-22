function Final()
    %% Path of dataset
    strDataTrain = 'dataset/train-images.idx3-ubyte';
    strLabelTrain = 'dataset/train-labels.idx1-ubyte';
    strDataTest = 'dataset/t10k-images.idx3-ubyte';
    strLabelTest = 'dataset/t10k-labels.idx1-ubyte';
    
    %% Features
    RAW = 1;
    HOG = 2;
    LBP = 3;
    BOW = 4;
    DF = 5; % deep learning features
    
    
    
    %% Load du lieu train va du lieu test
    [imgDataTrain, lblDataTrain] = loadData(strDataTrain, strLabelTrain);
    [imgDataTest, lblDataTest] = loadData(strDataTest, strLabelTest);
    
    %% Menu chon chuc nang can thuc hien
    fprintf('HELP\n');
    fprintf('Features:\n');
    fprintf('[1] Raw (pixel intensity)\n');
    fprintf('[2] Histogram of Oriented Gradients (HOG)\n');
    fprintf('[3] Local Binary Pattern (LBP)\n');
    fprintf('[4] Bag of Words (BoW)\n');
    fprintf('[5] Deep Features (DF)\n');
   
    fprintf('-----------------------------------------\n');
    feature = input('Choose feature: ');
    
%     %if(feature )
%     method = input('Choose machine learning method: ');
    
    fprintf('-----------------------------------------\n');
    
    switch feature
        case RAW %% Raw (pixel intensity)
            fprintf('Your choice is [1] raw (pixel intensity)\n');
            
            fprintf('-----------------------------------------\n');
            [imgTrainAll_hist, imgTestAll_hist] = PixelIntensity(imgDataTrain, imgDataTest);
            
            [nCount, type] = ChooseMethod(imgTrainAll_hist, lblDataTrain, imgTestAll_hist, lblDataTest);
            
            fprintf(['So luong mau dung (raw-', type, '): %d\n'], nCount);

        case HOG %% Hog
            fprintf('Your choice is [2] histogram of oriented gradients (HoG)\n');
            
            fprintf('-----------------------------------------\n');
            fprintf('Extracting Hog features...\n');
            featuresDataTrain = ExtractFeaturesHog(imgDataTrain);
            featuresDataTest = ExtractFeaturesHog(imgDataTest);
            
            [nCount, type] = ChooseMethod(featuresDataTrain, lblDataTrain, featuresDataTest, lblDataTest);

            fprintf(['So luong mau dung (hog-', type, '): %d\n'], nCount);
            
        case LBP %% LBP
            fprintf('Your choice is [3] local binary patterns (LBP)\n');
            
            fprintf('-----------------------------------------\n');
            fprintf('Extracting LBP features...\n');
            featuresDataTrain = ExtractFeaturesLBP(imgDataTrain);
            featuresDataTest = ExtractFeaturesLBP(imgDataTest);

            [nCount, type] = ChooseMethod(featuresDataTrain, lblDataTrain, featuresDataTest, lblDataTest);
            
            fprintf(['So luong mau dung (lbp-', type, '): %d\n'], nCount);
            
        case BOW %% Bag of Words
            fprintf('Your choice is [4] bag of words\n');
            fprintf('Processing...');
            
            rootFolder = fullfile('DataTrain');
            categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

            imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
            tbl01 = countEachLabel(imds)

            minSetCount = min(tbl01{:, 2});
            imds = splitEachLabel(imds, minSetCount, 'randomize');
            tbl02 = countEachLabel(imds)

            load('bags.mat');
    
    %         bags = bagOfFeatures(imds);
    %         % save bags
    %         filename = 'bags.mat';
    %         save(filename, 'bags'); 

            img =  readimage(imds, 1);
            featureVector = encode(bags, img);
            figure
            bar(featureVector)
            title('Visual word occurrences');
            xlabel('Visual word index');
            ylabel('Frequency of occurrence');

            load('categoryClassifier.mat');
             
    %         categoryClassifier = trainImageCategoryClassifier(imds, bags);
    %         % save category classifier
    %         filename = 'categoryClassifier.mat';
    %         save(filename, 'categoryClassifier');

            rootFolder = fullfile('DataTest');
            categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
            imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
            tbl01 = countEachLabel(imds)
            confMatrixTest = evaluate(categoryClassifier, imds);
            mean(diag(confMatrixTest));
            
        case DF %% Deep Features
            fprintf('Your choice is [5] deep features (DF)\n');
            
            fprintf('-----------------------------------------\n');
            
            if exist('DataTrain', 'dir') ~= 7
                fprintf('Creating DataTrain folder...\n');
                CreateDataTrain();
                fprintf('-----------------------------------------\n');
            end
            
            if exist('DataTest', 'dir') ~= 7
                fprintf('Creating DataTest folder...\n');
                CreateDataTrain();
                fprintf('-----------------------------------------\n');
            end
            
            fprintf('Extracting deep features...\n');
            
            strFolderDataTrain = fullfile('DataTrain');
            categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

            imdsDataTrain = imageDatastore(fullfile(strFolderDataTrain, categories), 'LabelSource', 'foldernames');
            imdsDataTrain.ReadFcn = @(filename)readAndPreprocessImage(filename);

            net = alexnet();
            featureLayer = 'fc7';
            featuresDataTrain = activations(net, imdsDataTrain, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
            lblDataTrain = imdsDataTrain.Labels;
            
            strFolderDataTest = fullfile('DataTest');
            categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

            imdsDataTest = imageDatastore(fullfile(strFolderDataTest, categories), 'LabelSource', 'foldernames');
            imdsDataTest.ReadFcn = @(filename)readAndPreprocessImage(filename);

            featuresDataTest = activations(net, imdsDataTest, featureLayer, 'MiniBatchSize', 32);
            lblActualDataTest = imdsDataTest.Labels;
            
            [nCount, type] = ChooseMethod(featuresDataTrain, lblDataTrain, featuresDataTest, lblActualDataTest);
            
            fprintf(['So luong mau dung (deep-', type, '): %d\n'], nCount);            
    end   
    
    fprintf('-----------------------------------------\n'); 
    fprintf(['End time: ', datestr(datetime('now')), '\n']);
    fprintf('-----------------------------------------\n');
end