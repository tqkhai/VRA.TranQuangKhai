function Example001()
    a = rand();
    fprintf('\n a: [%8.3f]', a);
    
    r = randi([1 10]);
    fprintf('\n r [1 10]: [%d]', r);
    
    rArray = randi([-10 10], 1, 10);
    fprintf('\n so dong: %d.', size(rArray, 1));
    fprintf('\n so cot: %d.', size(rArray, 2));
    fprintf('\n Mang duoc tao la:');
    fprintf('%2d ', rArray);
 end