function [X, I] = Bisection(poly, L, tolerance)
NMAX = 1000;
    function [x, i] = iterate(l)
        left  = l(1, 1);
        right = l(1, 2);
        for i = 1:NMAX
            center = (right + left)/2;
            y = sign(polyval(poly, [left center right]));
            if y(2) == 0 || (right - left) < tolerance
                %n = log10(tolerance);
                %X = roundn(center, n);
                x = center;
                return;
            elseif y(1) == y(2)
                left  = center;
            elseif y(2) == y(3)
                right = center;
            end
        end
        warning('Max number of sttolerance (%d/%d) exceeded.', i, NMAX);
    end

X = zeros(size(L, 1), 1);
I = zeros(size(L, 1), 1);
for i = 1:size(L, 1)
    [X(i), I(i)] = iterate(L(i, :));
end
end