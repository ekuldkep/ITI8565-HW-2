function result = Cosine(a,b)
    product = sum(a.*b);
    lengths = sum(power(a, 2)) * sum(power(b, 2));
    result = 1 - (product / lengths);
end