k = 9;
C = [
        0.2    0  0.2    0    0;
          0  0.2    0  0.2    0;
        0.2    0  0.2    0  0.2;
          0  0.2    0  0.2    0;
          0    0  0.2    0  0.2;
    ];
D = [
         2.33   0.81   0.67   0.92  -0.53;
        -0.53   2.33   0.81   0.67   0.92;
         0.92  -0.53   2.33   0.81   0.67;
         0.67   0.92  -0.53   2.33   0.81;
         0.81   0.67   0.92  -0.53   2.33;
    ];
b = [4.2; 4.2; 4.2; 4.2; 4.2];

A = k * C + D;

disp('Исходные данные:');
disp('Матрица A:');
disp(A);
disp('Вектор b:');
disp(b);
disp('Решение методом Гаусса:');
disp(Gauss(A, b));
disp('Решение методом Гаусса с выбором главного элемента по столбцу:');
disp(GaussPivotOnColumn(A, b));
disp('Решение методом Гаусса с выбором главного элемента по всей матрице:');
disp(GaussPivotOnMatrix(A, b));
disp('Решение, основанное на вычислениях Matlab:');
disp(A^(-1) * b);

rows = 1000;
A = rand(rows);
b = rand(rows, 1);

tic();
gauss = Gauss(A, b);
elapsedTime = toc();
fprintf('Метод Гаусса: %fс\n', elapsedTime);

tic();
gaussPivotOnColumn = GaussPivotOnColumn(A, b);
elapsedTime = toc();
fprintf('Метод Гаусса с выбором главного элемента по столбцу: %fс\n', elapsedTime);

tic();
gaussPivotOnMatrix = GaussPivotOnMatrix(A, b);
elapsedTime = toc();
fprintf('Метод Гаусса с выбором главного элемента по матрице: %fс\n', elapsedTime);

tic();
matlab = A^(-1) * b;
elapsedTime = toc();
fprintf('Метод, реализованный в Matlab: %fс\n', elapsedTime);

disp([gauss gaussPivotOnColumn gaussPivotOnMatrix matlab]);