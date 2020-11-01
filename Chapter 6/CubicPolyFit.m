function [a, Er] = CubicPolyFit(x, y)
    n = length(x);
    
    for r = 1:n
        for c = 1:4
            X(r, c) = x(r)^(4-c);
        end
    end
    
    Xt = X.';
    A = Xt*X;
    b = Xt*y.';
    mat = [A, b];
    [row, col] = size(mat);
    
    % Gaussian Elimination: X^T * X * a = X^T * y 를 푼다.
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
    
    a = mat(1:row, col);
    
    % Error를 계산한다.
    % ||y-Xa||^{2}_{2}
    Er = 0;
    for i = 1:n
        Er = Er + (y(i) - (a(1)*x(i)^3 + a(2)*x(i)^2 + a(3)*x(i) + a(4)))^2;
    end
end