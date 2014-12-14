% Лабораторная работа 6
% Вариант 5

% http://ikt.muctr.ru/html2/
% http://ikt.muctr.ru/html2/7/lek7_1.html

% du/dt = a*d^2u/dx^2 + a*d^2u/dy^2, a > 0
% u(0, y, t) = sinh(y)*exp(-3*a*t)
% u(pi/2, y, t) = -sinh(y)*exp(-3*a*t)
% u(x, 0, t) = 0
% u(x, ln(2), t) = 3/4 * cos(2*x)*exp(-3*a*t),
% u(x, y, 0) = cos(2*x)*sinh(y)

% Аналитическое решение
%   U(x, y, t) = cos(2*x)*sinh(y)*exp(-3*a*t)

% Схема переменных направлений
uc = zeros(length(x), length(y), length(t));
for j = 1:length(x)
    for k = 1:length(y)
        uc(j, k, :) = cos(2.*x(j)).*sinh(y(k)).*exp(-3.*s.*t);
    end
end

% su = surf(y, x, uc(:,:,1));
% set(su, 'LineStyle', 'none');
% while 1
%     for i = 1:2:length(t);
%         su = surf(y, x, u(:,:,i));
%         set(su, 'LineStyle', 'none');
%         zlim([-0.5 0.5]);
%         f = getframe;
%     end;
% end;