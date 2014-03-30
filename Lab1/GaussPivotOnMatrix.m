function [X] = GaussPivotOnMatrix(a, b)
A = [a b];
[rows,cols] = size(A);
swap = zeros(1, cols - 1);
tolerance = eps * max(rows, cols) * norm(A, inf);

r = 1;
for c = 1:cols
    % Find the pivot row
    B = abs(A(r:rows, c:cols-1));
    [pivotRow, pivotColumn] = find(B == max(B(:)), 1, 'first');
    m = B(pivotRow, pivotColumn);
    pivotRow = r + pivotRow - 1;
    pivotColumn = c + pivotColumn - 1;
    
    if (m <= tolerance)
        error('Low accuracy.');
    else
        % Swap current row and pivot row
        A ([pivotRow, r], c:cols) = A ([r, pivotRow], c:cols);
        A (1:rows, [pivotColumn, c]) = A (1:rows, [c, pivotColumn]);
        swap(c) = pivotColumn;
        
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
    X(r, 1) = A(r, cols) - A(r, r+1:cols-1) * X(r+1:rows, 1);
end

for i = size(X, 1):-1:1
    revertPosition = swap(i);
    if (i ~= revertPosition)
        X([revertPosition, i], :) = X([i, revertPosition], :);
    end
end
end