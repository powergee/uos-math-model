function x = GaussJordan(a, b)
    mat = [a, b];
    [row, col] = size(mat);

    for i = 1:row
        % 절댓값이 가장 큰 pivot을 찾는다.
        maxPivot = abs(mat(i, i));
        maxRow = i;
        for r = i:row
            if (maxPivot < abs(mat(r, i)))
                maxPivot = abs(mat(r, i));
                maxRow = r;
            end
        end

        % 찾은 pivot row와 i행을 교환한다.
        for c = 1:col
            temp = mat(i, c);
            mat(i, c) = mat(maxRow, c);
            mat(maxRow, c) = temp;
        end

        % 현재 열의 다른 값들을 0으로 만든다.
        for r = 1:row
            if r ~= i
                mat(r, i:col) = mat(r, i:col) - mat(r, i) / mat(i, i) * mat(i, i:col);
            end
        end
        
        % pivot의 값을 1로 맞추기 위해 나눈다.
        mat(i, i:col) = mat(i, i:col) / mat(i, i);
    end
    
    x = mat(1:row, col);
end