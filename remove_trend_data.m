function [r_cutoff] = remove_trend_data(input_1, x_avg, input)
%% Trend Removed, normalized auto-correlation r value (for displacement) 
% taking the form: 
%
%       r_tau = sum( (x_t - x_avg)*(y_t - y_avg)) / sum((x_t - x_avg)^2); 
% 
% where t_0 = 1 
%% Trend remove, norm r value - cut off at some time 
N = abs(length(input_1)); 
r_cutoff = {1,N}; 
use_cos = 0; 
if (input == 1)
    
    use_cos = 1; 
end 

for j= 1:N 
    
    
    my_x = input_1{1,j}; 
    
    n = abs(length(my_x)); 
    Y = zeros(1,15); 
    
    Y(1,1) = sum(( my_x - x_avg).*(my_x - x_avg)) / sum((my_x - x_avg).^2); 
    
    for k = 1:14 % if you change me change the preallocation on Y 
        
        
        no_lag_array = my_x(1,1:n-k) - x_avg; 
        lagged_array = my_x(k+1:1:end) - x_avg; 
        
        if (use_cos == 1)
            no_lag_array = cos(no_lag_array); 
            lagged_array = cos(lagged_array); 
        end 
        Y(1,k+1) = sum(no_lag_array.*lagged_array) / sum((no_lag_array).^2); 
        
    end 
    
    r_cutoff{1,j} = Y; 
end 



