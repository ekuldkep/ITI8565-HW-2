% clear everything
clc
clear

rng(3);

load("data.mat")

finalMatrixsorted = finalMatrixsorted(1:4000,:);

% SAMPLE THE DATA
proportion = .2;      % proportion of rows to select for training
numberOfRows = size(finalMatrixsorted,1);  % total number of rows 
mask = false(numberOfRows, 1);   % create logical index vector
mask(1:round(proportion*numberOfRows)) = true;
mask = mask(randperm(numberOfRows));% randomise order

fullSet = finalMatrixsorted;
dataFull = fullSet(:,1:2);
labelFull = fullSet(:,3);
test = mask
trainingSet = finalMatrixsorted(~mask,:);
testingSet = finalMatrixsorted(mask,:);

dataTraining = trainingSet(:,1:2);
labelTraining = trainingSet(:,3);

dataTesting = testingSet(:,1:2);
labelTesting = testingSet(:,3);

idx = knn(10, dataTraining, dataTesting, labelTraining, @Chebyshev);
correct = idx == labelTesting
corr = sum(correct)

% PLOT THE DATA
fh(1) = figure(1);
clf(fh(1));

pointSize = 20;

subplot(1,3,1);
scatter(dataFull(: , 1), dataFull(: , 2), pointSize, fullSet(:,3), 'o');

subplot(1,3,2);

scatter(dataFull(correct, 1), dataTesting(correct, 2), pointSize, idx(correct),'o');

hold on

scatter(dataFull(~correct, 1), dataTesting(~correct, 2), pointSize * 2, idx(~correct), 'x');

subplot(1,3,3);

scatter(dataFull(~correct, 1), dataTesting(~correct, 2), pointSize * 2, idx(~correct), 'x');
