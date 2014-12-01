% Схема дробных шагов

% u(x, y, t)
% f(x, y, t)

% n - номер точки по t
% j - номер точки по x
% k - номер точки по y

% Неявная разностная схема
j = 2:length(x)-1;
alpha = zeros(size(x));
beta = zeros(size(x));
gamma = zeros(size(x));
for i = 1:length(t)-1
    alpha(1) = 1;
    beta(1) = -h*g_1(t(i+1));
    gamma(j) = u(j, k, n) + tao.*f(x(j), y(k), t(i));
    
    a = -s*tao/hx^2;
    b = 1 + 2*s*tao/hx^2 + k*tao;
    c = -s*tao/hx^2;
    
    % Прямой ход
    for nj = j
        alpha(nj) = -a/(b + c*alpha(nj-1));
        beta(nj) = (gamma(nj) - c*beta(nj-1))/(b + c*alpha(nj-1));
    end
    
    u(i+1, end) = (h*g_2(t(i+1)) + beta(end-1))/(1-alpha(end-1));
    
    % Обратный ход
    for nj = length(x)-1:-1:1
        u(i+1, nj) = alpha(nj)*u(i+1, nj+1) + beta(nj);
    end
end