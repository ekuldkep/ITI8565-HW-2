function gini = Gini(data_col, label_col)
    row_count = length(data_col);
    
    col_data_unique_values = unique(data_col);
    
    unique_values_count = length(col_data_unique_values);
    
    col_label_unique_values = unique(label_col);
    unique_label_values_count = length(col_label_unique_values);
    
    gini = 0;
    for i = 1:unique_values_count
        unique_value_data = col_data_unique_values(i);
        index_with_current_value = strcmpi(data_col,unique_value_data);
        partial_gini = 1;
        for j = 1:unique_label_values_count
            unique_value_label = col_label_unique_values(j);
            index_with_current_label = strcmpi(label_col, unique_value_label);
            
            value_in_class = index_with_current_value & index_with_current_label;
            class_values_count = sum(value_in_class);
            fraction = power(class_values_count/row_count, 2);
            partial_gini = partial_gini - fraction;
        end
        % disp([partial_gini unique_value_data]);
        unique_value_gini = (sum(index_with_current_value) * partial_gini)/row_count;
        gini = gini + unique_value_gini;
    end
end