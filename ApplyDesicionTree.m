clc
clear

data = readtable("decision_data.csv");
data = table2array(data);
data_length = size(data, 2);
data_labels = data(:, data_length);
data_without_labels = data(:, 1:(data_length - 1));

disp(data);

new_point = ["sunny" "warm" "high" "weak"];

predicted_label = DesTree(data_without_labels, data_labels, new_point);

disp(["result:" new_point " - - - >" predicted_label]);
