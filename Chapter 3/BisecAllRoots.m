function R = BisecAllRoots(Fun, a, b, TolMax)
    divCount = 10;
    R = [];
    
    while true
        h = (b-a) / divCount;
        found = 0;

        for i = 1:divCount
            left = a+h*(i-1);
            right = a+h*i;

            if Fun(left)*Fun(right) < 0 && ~AlreadyFound(R, left, right)
                sol = BisectionRoot(Fun, left, right, TolMax);
                R = [R, sol];
                found = found + 1;
            end
        end

        if found == 0
            break;
        else
            divCount = divCount*10;
        end
    end
end

function Result = AlreadyFound(Solutions, left, right)
    Result = false;
    for i = 1:numel(Solutions)
        if (left <= Solutions(i)) && (Solutions(i) <= right)
            Result = true;
            break;
        end
    end
end

function Xs = BisectionRoot(Fun, a, b, TolMax)
    % a에서의 함수값과 b에서의 함수값의 부호가 같다면 해를 찾을 수 없다.
    if Fun(a)*Fun(b) > 0
        disp('Error: The function has the same sign at points a and b.');
        Xs = ('Unable to find a solution');
    else
        left = a;
        right = b;

        for i = 1:100
            Xs = (left+right)/2;
            toler = (right-left)/2;
            FunXs = Fun(Xs);

            % tolerance와 left에서의 함수값의 부호가 같다면,
            % 실제 해는 Xs의 오른쪽에 있다.
            if (FunXs * Fun(left) > 0)
                left = Xs;
            % tolerance와 right에서의 함수값의 부호가 같다면,
            % 실제 해는 Xs의 왼쪽에 있다.
            elseif (FunXs * Fun(right) > 0)
                right = Xs;
            end

            % 정확한 해를 찾았거나, tolerance가 TolMax 보다 작다면 반복을 중단한다.
            if FunXs == 0 | toler < TolMax
                break;
            end
        end
    end

    if i == 100
        disp('Error: Solution was not obtained in 100 iterations.')
        Xs = ('Unable to find a solution');
    end
end