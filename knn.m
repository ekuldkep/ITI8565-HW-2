function returnLabels = knn(k, trainingPoints, testPoints, labels, distanceFunction)
    count = size(testPoints, 1);
    disp(count);
    returnLabels = -ones(count, 1);
    
    for index=1:count
        returnLabels(index) = knnForSingle(k, testPoints(index,:), trainingPoints, labels, distanceFunction);
    end
end

function returnLabel = knnForSingle(k, point, points, labels, distanceFunction)
    %row count
    count = size(labels, 1);
    % [distance, label] mapping
    neighbors = zeros(count, 2);
    for index=1:count
        distance = distanceFunction(point, points(index,:));
        currentLabel = labels(index);
        neighbors(index,:) = [distance, currentLabel];
    end
    
    neighbors = sortrows(neighbors);
    neighbors = neighbors(1:k,2);  % select first k labels
    returnLabel = mode(neighbors);  % most freq label   
end
