function [X, k] = SimpleIteration(A, B, eps)
assert(ismatrix(A));
assert(iscolumn(B));

if (nargin < 3)
    eps = eps * max(rows, cols) * norm(A, inf);
end

% Задание вектора b и матрицы a
[A_m, A_n] = size(A);
[B_m, B_n] = size(B);

a = zeros(A_m, A_n);
b = zeros(B_m, B_n);

% Подготовка уравнения к методу простых итераций
for i = 1:A_m
    b(i) =  B(i) / A(i, i);
    a(i, i) = 0;
    for j = 1:A_n
        if i ~= j
            a(i, j) = -A(i, j) / A(i, i);
        end
    end
end

% Проверка условия norma(a)<1
assert(norm(a) < 1);
assert(norm(a, inf) < 1);

% delta = eps * (1 - norm(a)) / norm(a);
X0 = b;
X1 = a * X0 + b;
k = 1;
while norm(X1 - X0, inf) > eps
  X0 = X1;
  X1 = a * X0 + b;
  k = k + 1;
end;
X = X1;

q = norm(a);
disp(eps);
disp(q);
l = q;
k = 0;
while abs(l) >= eps
    l = l * q;
    k = k + 1;
    if k > 100
        break;
    end
end

end