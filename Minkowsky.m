function value = Minkowsky(point_1, point_2, p)

    if p == Inf
        value = max(abs(point_1 - point_2))   ;

    else
        value = power(sum(power(abs(point_1-point_2), p)), 1/p);
    
    end
    
end