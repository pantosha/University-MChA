k = 9;
C = [
        0.01     0  -0.02     0      0;
        0.01  0.01  -0.02     0      0;
           0  0.01   0.01     0  -0.02;
           0     0   0.01  0.01      0;
           0     0      0  0.01   0.01;
    ];
D = [
         1.33   0.21   0.17   0.12  -0.13;
        -0.13  -1.33   0.11   0.17   0.12;
         0.12  -0.13  -1.33   0.11   0.17;
         0.17   0.12  -0.13  -1.33   0.11;
         0.11   0.67   0.12  -0.13  -1.33;
    ];
b = [1.2; 2.2; 4.0; 0.0; -1.2];
eps = 10^(-4);
A = k*C+D;

disp('Исходные данные:');
disp('Матрица A:');
disp(A);
disp('Вектор b:');
disp(b);

disp('Решение методом простых итераций (столбец 1):');
disp('Решение методом Гаусса-Зейделя (столбец 2):');
disp('Решение, основанное на вычислениях Matlab (столбец 3):');

[simpleIterationX, simpleIterationK] = SimpleIteration(A, b, eps);
simpleIterationResidual = b - A * simpleIterationX;

[gaussSeidelX, gaussSeidelK] = GaussSeidel(A, b, eps);
gaussSeidelResidual = b - A * gaussSeidelX;

matlabX = A^(-1) * b;
matlabResidual = b - A * matlabX;

disp('Невязка:')
disp([simpleIterationResidual gaussSeidelResidual matlabResidual]);

disp('Итерации:');
disp([simpleIterationK gaussSeidelK]);

disp('Вектор X:');
disp([simpleIterationX gaussSeidelX matlabX]);

count = 100;
tic();
for i = 1:count
    [simpleIteration, k] = SimpleIteration(A, b, eps);
end
elapsedTime = toc();
fprintf('Метод простых итераций: %fс\n', elapsedTime);

tic();
for i = 1:count
    [gaussSeidel, k] = GaussSeidel(A, b, eps);
end
elapsedTime = toc();
fprintf('Метод Гаусса-Зейделя: %fс\n', elapsedTime);

tic();
for i = 1:count
    matlab = A^(-1) * b;
end
elapsedTime = toc();
fprintf('Метод, реализованный в Matlab: %fс\n', elapsedTime);

disp([simpleIteration gaussSeidel matlab]);