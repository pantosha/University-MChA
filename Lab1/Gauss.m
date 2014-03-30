function [X] = Gauss(a, b)
A = [a b];
[rows, cols] = size(A);
tolerance = eps * max(rows, cols) * norm(A, inf);

r = 1;
for c = 1:cols
    pivot = abs(A(r, c));
    if (pivot < tolerance)
        
    else
        % Normalize pivot row
        A (r, c:cols) = A (r, c:cols) / A (r, c);
        
        % Eliminate the current column
        ridx = r+1:rows;
        A (ridx, c:cols) = A (ridx, c:cols) - A (ridx, c) * A(r, c:cols);
        
        % Check if done
        r = r + 1;
        if (r > rows)
            break;
        end
    end
end

X(rows, 1) = A(rows, cols);
for r = rows-1:-1:1
    X(r, 1) = A(r, cols) - A(r, r+1:cols-1)*X(r+1:rows, 1);
end
end