function N = OneNorm(A)
    cols = size(A, 2);
    N = GetAbsSumOfColumn(A, 1);
    for i = 2:cols
        N = max(N, GetAbsSumOfColumn(A, i));
    end
end

function sum = GetAbsSumOfColumn(A, col)
    rows = size(A, 1);
    sum = 0;
    for i = 1:rows
        sum = sum + abs(A(i, col));
    end
end