function Example004()
    strMessage = 'Nhap so nguyen n: ';
    n = input(strMessage);
    
    
    s = 0;
    
    for i = 1 : 2 :  n
        s = s + i;
    end
         
    
    fprintf('gia tri s = %d', s);
end