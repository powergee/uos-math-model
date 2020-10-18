function c = CondNumb_Inf(A)
    c = InfinityNorm(A) * InfinityNorm(Inverse(A));
end