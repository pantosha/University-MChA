function [X, I] = Bisection(poly, L, tolerance)
NMAX = 1000;
    function [x, i] = iterate(l)
        a  = l(1, 1);
        b = l(1, 2);
        for i = 1:NMAX
            c = (b + a)/2;
            y = sign(polyval(poly, [a c b]));
            if y(2) == 0 || (b - a)/2 < tolerance
                %n = log10(tolerance);
                %X = roundn(c, n);
                x = c;
                return;
            elseif y(1) == y(2)
                a = c;
            elseif y(2) == y(3)
                b = c;
            end
        end
        warning('Max number of tolerance (%d/%d) exceeded.', i, NMAX);
    end

X = zeros(size(L, 1), 1);
I = zeros(size(L, 1), 1);
for i = 1:size(L, 1)
    [X(i), I(i)] = iterate(L(i, :));
end
end