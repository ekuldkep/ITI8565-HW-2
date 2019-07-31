function result = Canberra(a, b)
    result = 0;
    for index = 1: length(a)
        result = result + (abs(a(index) - b(index))/ (abs(a(index)) + abs(b(index))));
    end
end