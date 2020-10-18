function c = CondNumb_One(A)
    c = OneNorm(A) * OneNorm(Inverse(A));
end