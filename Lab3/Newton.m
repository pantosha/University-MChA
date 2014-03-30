function [X, I] = Newton(poly, L, tolerance)
% x_(n+1) = x_n - f(x_n)/f'(x_n)
%
NMAX = 1000;
EPS = 10^(-14);
    function [x, i] = iterate(l)
        diff = polyder(poly);
        x = sum(l)/2;
        for i = 1:NMAX
            y  = polyval(poly, x);
            dy = polyval(diff, x);
            if abs(dy) < EPS
                warning('Denominator is too small.');
                break;
            end
            x_n = x - y/dy;
            if abs(x_n - x) < tolerance
                x = x_n;
                break;
            end
            x = x_n;
        end
    end
X = zeros(size(L, 1), 1);
I = zeros(size(L, 1), 1);
for i = 1:size(L, 1)
    [X(i), I(i)] = iterate(L(i, :));
end
end