function [speed,angle_d, normalized_speed] = displacement_generator(input)
%% Calculates displcament from previous position - absolute value of displacement 

N = abs(length(input)); 
speed = {1,N};  
angle_d = {1,N}; 
xdiff_cell = {1,N}; 
ydiff_cell = {1,N}; 
for j = 1:N 
    
    my_x = input{j}(:,2); 
    my_y = input{j}(:,3); 
    
    n = abs(length(my_x));
    
    xdiff = zeros(1,n-1); 
    ydiff = zeros(1,n-1); 
     
    my_displacement = zeros(1,n-1); 
    my_angle = zeros(1,n-1); 
     
    
    for k = 2:n
        
        xdiff(1,k-1) = my_x(k) - my_x(k-1); 
        ydiff(1,k-1) = my_y(k) - my_y(k-1); 
        
        my_displacement(1,k-1) = sqrt(xdiff(1,k-1)^2 + ydiff(1,k-1)^2); 
        
        my_angle(1,k-1) = atan2d(ydiff(1,k-1),xdiff(1,k-1));  
        
    end 
    
    speed{1,j} = my_displacement;  
    angle_d{1,j} = my_angle; 
    xdiff_cell{1,j} = xdiff; 
    ydiff_cell{1,j} = ydiff; 
     
end 

%% Normalize each speed in respect to the largest speed ( speed is synonymous with displacement) 


normalized_speed = {1,N}; 

for j = 1:N 
    
        my_speed = speed{j}; 
        
        [~, col] = find(ismember(my_speed, max(my_speed))); 
        
        normalized_speed_catcha = zeros(1,abs(length(my_speed))); 
        
        for m = 1:abs(length(my_speed))
            
            divisor = speed{j}(1,col); 
            
            normalized_speed_catcha(1,m) = sqrt((xdiff_cell{j}(1,m)/ divisor)^2 + ((ydiff_cell{j}(1,m))/divisor)^2); 
              
        end 
        
        normalized_speed{1,j} = normalized_speed_catcha;
end 



end 


