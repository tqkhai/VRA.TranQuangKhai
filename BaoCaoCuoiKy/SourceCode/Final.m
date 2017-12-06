function Final()
    %% Path of dataset
    strDataTrain = 'dataset/train-images.idx3-ubyte';
    strLabelTrain = 'dataset/train-labels.idx1-ubyte';
    strDataTest = 'dataset/t10k-images.idx3-ubyte';
    strLabelTest = 'dataset/t10k-labels.idx1-ubyte';
    
    %%
    RAW = 1;
    HOG = 2;
    LBP = 3;
    BOW = 4;
    DL = 5;
    
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
    fprintf('[5] Deep Learning\n');
   
    fprintf('-----------------------------------------\n');
    
    feature = input('Choose feature: ');
    
%     %if(feature )
%     method = input('Choose machine learning method: ');
    
    fprintf('-----------------------------------------\n');
    
    
    
    switch feature
        case RAW %% Raw (pixel intensity)
            fprintf('Your choice is [1] raw (pixel intensity)\n');
            
            % extract features of data test and data train
            imgTrainAll_hist = ExtractFeaturesHistogram(imgDataTrain);
            imgTestAll_hist = ExtractFeaturesHistogram(imgDataTest);

%             % set parameters for knn
%             fprintf('Give some parameters:\n');
%             fprintf('[1] Standardize: true\n');
%             fprintf('[2] Standardize: true\n');
            
            Mdl = fitcknn(imgTrainAll_hist', lblDataTrain, );
            fprintf('Processing...');            
            lblResult = predict(Mdl, imgTestAll_hist');

            nResult = (lblResult == lblDataTest);
            nCount = sum(nResult);
            fprintf('\nSo luong mau dung (raw): %d\n',nCount);
            
        case HOG %% Hog
            fprintf('Your choice is [2] histogram of oriented gradients\n');
            fprintf('Processing...');
            
            featuresDataTrain = ExtractFeaturesHog(imgDataTrain);
            featuresDataTest = ExtractFeaturesHog(imgDataTest);

            Mdl = fitcknn(featuresDataTrain', lblDataTrain);
            lblResult = predict(Mdl, featuresDataTest');

            nResult = (lblResult == lblDataTest);
            nCount = sum(nResult);
            fprintf('\nSo luong mau dung (Hog): %d\n',nCount);
            
        case LBP %% LBP
            fprintf('Your choice is [3] local binary patterns\n');
            fprintf('Processing...');
            
            featuresDataTrain = ExtractFeaturesLBP(imgDataTrain);
            featuresDataTest = ExtractFeaturesLBP(imgDataTest);

            Mdl = fitcknn(featuresDataTrain', lblDataTrain);
            lblResult = predict(Mdl, featuresDataTest');

            nResult = (lblResult == lblDataTest);
            nCount = sum(nResult);
            fprintf('\nSo luong mau dung (LBP): %d\n',nCount);
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
    %         
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
    %          
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
            
        case DL %% Deep Learning
            fprintf('Your choice is [5] deep learning\n');
            fprintf('Processing...');
            
            strFolderDataTrain = fullfile('DataTrain');
            categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

            imdsDataTrain = imageDatastore(fullfile(strFolderDataTrain, categories), 'LabelSource', 'foldernames');
            imdsDataTrain.ReadFcn = @(filename)readAndPreprocessImage(filename);

            net = alexnet();
            featureLayer = 'fc7';
            featuresDataTrain = activations(net, imdsDataTrain, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');

            lblDataTrain = imdsDataTrain.Labels;

            classifier = fitcecoc(featuresDataTrain, lblDataTrain, 'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'columns');

            strFolderDataTest = fullfile('DataTest');
            categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

            imdsDataTest = imageDatastore(fullfile(strFolderDataTest, categories), 'LabelSource', 'foldernames');
            imdsDataTest.ReadFcn = @(filename)readAndPreprocessImage(filename);

            featuresDataTest = activations(net, imdsDataTest, featureLayer, 'MiniBatchSize', 32);

            lblActualDataTest = imdsDataTest.Labels;
            lblResult = predict(classifier, featuresDataTest);
            nResult = (lblActualDataTest == lblResult);
            nCount = sum(nResult);

            fprintf('So luong mau nhan dang dung: %d\n', nCount);
    end   
end