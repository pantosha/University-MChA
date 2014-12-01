% Лабораторная работа 6
% Вариант 5

% http://ikt.muctr.ru/html2/
% http://ikt.muctr.ru/html2/7/lek7_1.html

% du/dt = a*d^2u/dx^2 + a*d^2u/dy^2, a > 0
% u(0, y, t) = sinh(y)*exp(-3*a*t)
% u(pi/2, y, t) = -sinh(y)*exp(-3*a*t)
% u(x, 0, t) = cos(2x)*exp(-3*a*t)
% u(x, ln(2), t) = 3/4 * cos(2*x)*exp(-3*a*t),
% u(x, y, 0) = cos(2*x)*sinh(y)

% Аналитическое решение
%   U(x, y, t) = cos(2*x)*sinh(y)*exp(-3*a*t)

% Схема переменных направлений


