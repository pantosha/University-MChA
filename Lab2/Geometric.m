b = [1.2; 2.2; 4.0; 0.0; -1.2];
b_norm = norm(b, inf);
k = 0;
l = 1;
q = 1/b_norm;
eps = 10^(-4);
while l >= eps
    l = l * q;
    k = k + 1;
    if k > 100
        break;
    end
end
disp(k);