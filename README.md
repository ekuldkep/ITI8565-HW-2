**Exercise 1. K-NN**

I implemented k-nn algorithm in Matlab. I tested it with different metric functions and
different neighbour count. Table shows how many points got wrong label out of 800.
Dataset was quite difficult, many overlappings etc but all Functions with all neighbours
count, performed quite well - all were over 90%.

**Exercise 2. Decision tree**

I implemented binary decision tree algorithm in Matlab. It runs Gini index on every
feature and finds which feature is most discriminating.

**Exercise 3. Regression model building**

I programmed regression model building in R. I used quite greedy method. I always tried
to add the variable that gave the smallest error in regression. My step was always one - I
only tried to add variables to existing model one by one. After that I did F- test and
measured if new model with new amount of variables performed better. If it did not I
returned returned existing variables. I also tested so that, I tried every possible
combinations of variables and still my greedy method performed better. In table below,
entries are error squares.

Result - Model was built with feature 2 and 3.

**Exercise 4. Gradient descend**

I programmed Gradient descend algorithm for formula 4x2 + 2x + 2. It s derivative is 8x +2. 
I played with different learning rates to see how quickly it finds the minimum.
Minimum for this function is -0.25. Y is loss and X is iteration count.

Learning rate 0.20. 18 iterations.              Learning rate 0.10. 6 iterations.