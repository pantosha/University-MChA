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

disp('�������� ������:');
disp('������� A:');
disp(A);
disp('������ b:');
disp(b);
disp('������� ������� ������:');
disp(Gauss(A, b));
disp('������� ������� ������ � ������� �������� �������� �� �������:');
disp(GaussPivotOnColumn(A, b));
disp('������� ������� ������ � ������� �������� �������� �� ���� �������:');
disp(GaussPivotOnMatrix(A, b));
disp('�������, ���������� �� ����������� Matlab:');
disp(A^(-1) * b);

rows = 1000;
A = rand(rows);
b = rand(rows, 1);

tic();
gauss = Gauss(A, b);
elapsedTime = toc();
fprintf('����� ������: %f�\n', elapsedTime);

tic();
gaussPivotOnColumn = GaussPivotOnColumn(A, b);
elapsedTime = toc();
fprintf('����� ������ � ������� �������� �������� �� �������: %f�\n', elapsedTime);

tic();
gaussPivotOnMatrix = GaussPivotOnMatrix(A, b);
elapsedTime = toc();
fprintf('����� ������ � ������� �������� �������� �� �������: %f�\n', elapsedTime);

tic();
matlab = A^(-1) * b;
elapsedTime = toc();
fprintf('�����, ������������� � Matlab: %f�\n', elapsedTime);

disp([gauss gaussPivotOnColumn gaussPivotOnMatrix matlab]);