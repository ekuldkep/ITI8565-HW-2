% clear everything
clc
clear

% https://towardsdatascience.com/implement-gradient-descent-in-python-9b93ed7108d1
% y = (x + 5) ^ 2
% y d/dx = 2 (x + 5)

learning_rate = 0.01;
momentum_rate = 0.8;

current_x = 4;
prev_update = 0;

for i = 1:1000
    gradient = 2 * (current_x + 5);
    update = learning_rate * gradient + momentum_rate * prev_update;
    current_x = current_x - update;
    prev_update = update;
    
    loss = power(current_x + 5, 2);
    
    disp(["iteration:", i, "loss:", loss, "X:", current_x]);
    
    if sqrt(loss) < 0.00001
        break
    end
end