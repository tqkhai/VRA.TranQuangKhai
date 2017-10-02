function Example002()
    strMessage = '\n Nhap m:';
    m = input(strMessage);
    
    strMessage = '\n Nhap n:';
    n = input(strMessage);
    
    a = ones(m, n);
    fprintf('\n');
    fprintf('%2d ', a);
    b = zeros(m, n);
    fprintf('\n');
    fprintf('%2d ', b);
    c = eye(m, n);
    fprintf('\n');
    fprintf('%2d ', c);
    d = randi([-10, 10], m, n);
    fprintf('\n');
    fprintf('%2d ', d);
    a(1, 1) = 5;
    e = size(a);
    fprintf('\n');
    fprintf('%2d ', e);
    
 end