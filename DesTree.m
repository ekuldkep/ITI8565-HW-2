function answ = DesTree(data, labels, new_point)
    feature_count = size(data, 2);
    if feature_count == 1
        % matlab is bad, can't do anything with string valued arrays :(
        answ = string(mode(categorical(labels)));
        return
    end
    
    best_feature_index = best_feature(data, labels);
    best_feature_column = data(:, best_feature_index);
    best_feature_value = new_point(best_feature_index);
    
    disp(["ANSW" best_feature_index best_feature_value]);
    mask = strcmpi(best_feature_column, best_feature_value);
    
    filtered_data = data(mask, :);
    
    filtered_data(:, best_feature_index) = [];
    filtered_labels = labels(mask, :); 
    new_point(best_feature_index) = [];
    
    disp("Filtered data");
    disp([filtered_data, filtered_labels]);
    disp("Filtered point");
    disp(new_point);
    
    answ = DesTree(filtered_data, filtered_labels, new_point);
    
    % answ = best_feature_value;
end

function best_feature_index = best_feature(data, labels)
    feature_count = size(data, 2);
    best_feature_gini = Inf;
    best_feature_index = 0;
    for i = 1:feature_count
        feature_column = data(:, i);
        feature_gini = Gini(feature_column, labels);
        disp(["Feature Gini" i feature_gini]);
        if feature_gini < best_feature_gini
            best_feature_gini = feature_gini;
            best_feature_index = i;
        end
    end    
end