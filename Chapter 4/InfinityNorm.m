function N = InfinityNorm(A)
    rows = size(A, 1);
    N = GetAbsSumOfRow(A, 1);
    for i = 2:rows
        N = max(N, GetAbsSumOfRow(A, i));
    end
end

function sum = GetAbsSumOfRow(A, row)
    cols = size(A, 2);
    sum = 0;
    for i = 1:cols
        sum = sum + abs(A(row, i));
    end
end