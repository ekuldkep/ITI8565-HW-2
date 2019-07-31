data("USArrests")

data = USArrests

regression = function(x_extra_row, y){
  
  return(solve(t(x_extra_row) %*% x_extra_row) %*% (t(x_extra_row) %*% y))
}

sse = function(x,y){
  rE = error(x, y)
  return(sum(rE ^ 2))
}

error = function(x, y){
  rX = cbind(1, x)
  rB = regression(rX, y)
  #predicted y values
  ry = rX %*% rB 
  return(y - ry) 
}

fscore = function(sse_less, sse_more, m, n, p){
  upper = (sse_less - sse_more) / m
  lower = sse_more / (n - p - 1)
  return(upper/lower)
}

pearson = function(data){
  dim_count = ncol(data)
  empty_mat = matrix(0, dim_count, dim_count)
  for(feature_a in 1:dim_count){
    for (feature_b in 1:dim_count) {
      if(feature_a == feature_b){
        next
      }
      
      feature_a_data = data[,feature_a]
      feature_b_data = data[,feature_b]
      covariance = cov(feature_a_data, feature_b_data)
      deviation_a = sd(feature_a_data)
      deviation_b = sd(feature_b_data)
      empty_mat[feature_a, feature_b] = covariance / (deviation_a * deviation_b)
    }
  }
  return(empty_mat)
}

model_building = function(x, y, previous_sse, previous_dim){
  dimensions = ncol(x)
  
  if(is.null(dimensions)){
    return(previous_dim)
  }
  best_index = 0
  best_sse = Inf
  
  #iterates through every variable still left chooses best one to add to preious and if f score is wore then declines
  
  for(variable in 1:dimensions){
    #add together prevoius successful dims and try new dim
    curent_dim = x[,variable]
    cols = cbind(curent_dim, previous_dim)
    print(cols)
    #check if you have too similar dimensions 
    if(length(cols) > 1){
      pearson_matrix = pearson(cols)
      highest = max(abs(pearson_matrix))
      if(highest > 0.7){
        print("I m here")
        next
      }
    }
    sse = sse(cols, y)
    print(sse)
    if(sse < best_sse){
      best_sse = sse
      best_index = variable
    }
  }
  if(best_index == 0){
    return(previous_dim)
  }
  else{
    new_dim_count = ncol(previous_dim) + 1
    m = 1
    n = nrow(x)
    p = new_dim_count
    fScore = fscore(previous_sse, best_sse, m, n, p)
    testF = qf(.95, df1 = m, df2 = n - p - 1)
    
    if(fScore > testF){
      current_columns = cbind(x[,best_index], previous_dim)
      #remove added column from original
      x = x[, -best_index, drop=FALSE]
      model_building(x, y, best_sse, current_columns)
    }
    else{
      return(previous_dim)
    }
  }
}

get_suitable_variables_indexes = function(answer, original){
  answ_count_dim = ncol(answer)
  row_count = nrow(original)
  or_indexes = list()
  original_count_dim = ncol(original)
  for (anw in 1:answ_count_dim) {
    for (or in 1:original_count_dim) {
      answ_col = answer[, anw]
      or_col = original[, or]
      
      is_same_count = sum(answ_col == or_col)
      
      if(is_same_count == row_count){
        or_indexes = c(or_indexes, or) 
      }
    }
  }
  return(or_indexes)
}

murder = data[, 1]
assault = data[, 2]
urban = data[, 3] 
row_count = nrow(data)
y = data[, 4]
x = cbind(murder, assault, urban)
empty_mat = matrix(0, row_count, 0)
ans = model_building(x, y, Inf, empty_mat)
print(ans)
i = get_suitable_variables_indexes(ans, x)
print(i)

