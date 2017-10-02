function Example003()
    strMessage = 'Nhap so nguyen n: ';
    n = input(strMessage);
    
    s = 0;
    i = 1;
    
    while i <= n
        s = s + i;
        i = i + 1;
    end
    
    fprintf('gia tri s = %d', s);
end