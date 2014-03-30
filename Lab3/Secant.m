function [X, I] = Secant(poly, L, tolerance)
NMAX = 1000;
    function [x, i] = iterate(l)
        a = l(1, 1);
        b = l(1, 2);
        for i = 1:NMAX
            a = b - (b - a) * polyval(poly, b)/(polyval(poly, b) - polyval(poly, a));
            b = a - (a - b) * polyval(poly, a)/(polyval(poly, a) - polyval(poly, b));
            if abs(b - a) < tolerance
                x = b;
                return
            end
        end
        x = b;
        warning('Max number of tolerance (%d/%d) exceeded.', i, NMAX);
    end

X = zeros(size(L, 1), 1);
I = zeros(size(L, 1), 1);
for i = 1:size(L, 1)
    [X(i), I(i)] = iterate(L(i, :));
end
end

