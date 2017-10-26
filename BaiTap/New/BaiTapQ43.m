function BaiTapQ43()
    fprintf('\n Load du lieu train\n');
    load('C:\Users\tqkha\Desktop\imgTrainImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTrainLabelsAll.mat');
    
    lblTrainLabelsAllCount = size(lblTrainLabelsAll, 2);
    
    index = 1;
    a = zeros(40);
    
    while index <= lblTrainLabelsAllCount
        label = lblTrainLabelsAll(index);
        a(label) = a(label) + 1;
        fprintf('%d\n', index);
        index = index + 1;
    end
    
    for i = 1 : 40
        fprintf('Label %d co %d anh. \n', i, a(i));
    end  
end
