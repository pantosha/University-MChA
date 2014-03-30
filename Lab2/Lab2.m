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

disp('�������� ������:');
disp('������� A:');
disp(A);
disp('������ b:');
disp(b);

disp('������� ������� ������� �������� (������� 1):');
disp('������� ������� ������-������� (������� 2):');
disp('�������, ���������� �� ����������� Matlab (������� 3):');

[simpleIterationX, simpleIterationK] = SimpleIteration(A, b, eps);
simpleIterationResidual = b - A * simpleIterationX;

[gaussSeidelX, gaussSeidelK] = GaussSeidel(A, b, eps);
gaussSeidelResidual = b - A * gaussSeidelX;

matlabX = A^(-1) * b;
matlabResidual = b - A * matlabX;

disp('�������:')
disp([simpleIterationResidual gaussSeidelResidual matlabResidual]);

disp('��������:');
disp([simpleIterationK gaussSeidelK]);

disp('������ X:');
disp([simpleIterationX gaussSeidelX matlabX]);

count = 100;
tic();
for i = 1:count
    [simpleIteration, k] = SimpleIteration(A, b, eps);
end
elapsedTime = toc();
fprintf('����� ������� ��������: %f�\n', elapsedTime);

tic();
for i = 1:count
    [gaussSeidel, k] = GaussSeidel(A, b, eps);
end
elapsedTime = toc();
fprintf('����� ������-�������: %f�\n', elapsedTime);

tic();
for i = 1:count
    matlab = A^(-1) * b;
end
elapsedTime = toc();
fprintf('�����, ������������� � Matlab: %f�\n', elapsedTime);

disp([simpleIteration gaussSeidel matlab]);