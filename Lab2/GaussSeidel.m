function [X, k] = GaussSeidel(A, B, eps)
assert(ismatrix(A));
assert(iscolumn(B));

[cols] = size(A,2);
X = zeros(cols, 1);
V = zeros(cols, 1);
k = 0;
while true
    for i = 1:cols
        var = 0;
        for j = 1:cols
            if(i ~= j)
                var = var + A(i, j)*X(j);
            end
        end
        V(i) = X(i);
        X(i) = (B(i) - var) / A(i, i);
    end
	k = k + 1;
    if norm(X-V, inf) < eps
        return
    end
end
end