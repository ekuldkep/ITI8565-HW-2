clc
clear

learning_rate = 0.01;
current_x = 8;
final_x = -0.25;
printing = ones(0, 2);
for i = 1:1000
    gradient = (8 * current_x) + 2;
    update = learning_rate * gradient;
    current_x = current_x - update;
    
    loss = power(current_x - final_x, 2);
    
    printing(i, :) = [i, loss]
    disp(["iteration:", i, "loss:", loss, "X:", current_x]);
    
    if sqrt(loss) < 0.001
        break
    end
end

line(printing(:, 1), printing(:, 2));