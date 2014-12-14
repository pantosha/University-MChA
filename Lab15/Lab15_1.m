% Схема дробных шагов
s = 1;
f = @(x, y, t)0;
gx_l = @(y, t)sinh(y).*exp(-3.*s.*t);
gx_r = @(y, t)-sinh(y).*exp(-3.*s.*t);
gy_l = @(x, t)0;
gy_r = @(x, t)0.75.*cos(2.*x).*exp(-3.*s.*t);

hx = 0.05;
hy = 0.01;
tao = 0.01;

x = 0 : hx : pi/2;
y = 0 : hy : log(2);
t = 0 : tao : 2;

% Начальные и граничные условия
u = zeros(length(x), length(y), 2*length(t));
for j = 1:length(x)
    u(j, :, 1) = cos(2*x(j)).*sinh(y);
end
for n = 1:length(t)
    u(1, :, n) = gx_l(y, n);
    u(end, :, n) = gx_r(y, n);
    u(:, 1, n) = gy_l(x, n);
    u(:, end, n) = gy_r(x, n);
end

for n = 1:2:length(t)-2
    alpha = zeros(length(x));
    beta = zeros(length(x));
    for k = 2:length(y)-1
        alpha(1) = 0;
        beta(1) = gx_l(y(k-1), t(n+1));
        a = -s*tao/hx^2;
        b = 1 + 2*s*tao/hx^2;% + k.*tao;
        c = -s*tao/hx^2;
        % Прямой ход
        for j = 2:length(x)-1
            gamma = u(j, k, n) + tao*f(x(j), y(k), t(n));
            alpha(j) = -a/(b + c*alpha(j-1));
            beta(j) = (gamma - c*beta(j-1))/(b + c*alpha(j-1));
        end
        u(end, k, n+1) = gx_r(y(k), t(n+1));
        % Обратный ход
        for j = length(x)-1:-1:1
            u(j, k, n+1) = alpha(j).*u(j+1, k, n+1) + beta(j);
        end
    end
    alpha = zeros(length(y));
    beta = zeros(length(y));
    for j = 2:length(x)-1
        alpha(1) = 0;
        beta(1) = gy_l(x(j-1), t(n+2));
        a = -s*tao/hy^2;
        b = 1 + 2*s*tao/hy^2;
        c = -s*tao/hy^2;
        % Прямой ход
        for k = 2:length(y)-1
            gamma = u(j, k, n+1);
            alpha(k) = -a./(b + c.*alpha(k-1));
            beta(k) = (gamma - c.*beta(k-1))./(b + c.*alpha(k-1));
        end
        u(j, end, n+2) = gy_r(x(j), t(n+2));
        % Обратный ход
        for k = length(y)-1:-1:1
            u(j, k, n+2) = alpha(k).*u(j, k+1, n+2) + beta(k);
        end
    end
end

%% Анимация
% su = surf(y, x, u(:,:,5));
% set(su, 'LineStyle', 'none');
while 1
    for i = 1:2:length(t);
        j = surf(y, x(2:end-1), u(2:end-1, :, i));
        set(j, 'LineStyle', 'none');
        zlim([-0.5 0.5]);
        f = getframe;
    end;
end;
