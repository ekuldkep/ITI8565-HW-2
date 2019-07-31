function value = Mahalanobis(point_1, point_2, dataset)
    
    diff = point_1 - point_2;
    
    data_cov = cov(dataset)
    data_cov_inv = inv(data_cov)
        
    value = sqrt(diff * data_cov_inv * transpose(diff));
end

