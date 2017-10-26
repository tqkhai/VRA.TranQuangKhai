function BaiTapQ44()
    fprintf('\n Load du lieu train\n');
    load('C:\Users\tqkha\Desktop\imgTestImagesAll.mat');
    load('C:\Users\tqkha\Desktop\lblTestLabelsAll.mat');
    
    lblTestLabelsAllCount = size(lblTestLabelsAll, 2);
    
    index = 1;
    a = zeros(40);
    
    while index <= lblTestLabelsAllCount
        label = lblTestLabelsAll(index);
        a(label) = a(label) + 1;
        fprintf('%d\n', index);
        index = index + 1;
    end
    
    for i = 1 : 40
        fprintf('Label %d co %d anh. \n', i, a(i));
    end  
end
