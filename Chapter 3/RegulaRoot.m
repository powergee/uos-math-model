function Xs = RegulaRoot(Fun, a, b, ErrMax)
    % a에서의 함수값과 b에서의 함수값의 부호가 같다면 해를 찾을 수 없다.
    if Fun(a)*Fun(b) > 0
        disp('Error: The function has the same sign at points a and b.');
        Xs = ('Unable to find a solution');

    else
        left = a;
        right = b;
        prevXs = NaN;

        for i = 1:100
            Xs = (left*Fun(right) - right*Fun(left)) / (Fun(right) - Fun(left));
            toler = Fun(Xs);

            % tolerance와 left에서의 함수값의 부호가 같다면,
            % 실제 해는 Xs의 오른쪽에 있다.
            if (toler * Fun(left) > 0)
                left = Xs;
            % tolerance와 right에서의 함수값의 부호가 같다면,
            % 실제 해는 Xs의 왼쪽에 있다.
            elseif (toler * Fun(right) > 0)
                right = Xs;
            end

            % 정확한 해를 찾은 경우 반복을 중단한다.
            if toler == 0
                break;
            end

            if ~isnan(prevXs)
                % Estimated Relative Error를 계산하고, Xs를 이번에 구한 Xs로 갱신한다.
                estRelErr = abs((Xs - prevXs) / prevXs);

                % estRelErr가 ErrMax 범위 내라면 반복을 중단한다.
                if estRelErr <= ErrMax
                    break;
                end
            end

            prevXs = Xs;
        end
    end

    if i == 100
        disp('Error: Solution was not obtained in 100 iterations.')
        Xs = ('Unable to find a solution');
    end
end