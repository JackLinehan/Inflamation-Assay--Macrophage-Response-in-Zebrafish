%% Main Cell Tracking Program 
%% Step (1); Bring in the txy data and store it for access 
% I perform all the steps associated with the quantitiative analysis of
% cell tracking, and am the master file which keeps this all organized. 

prompt = input('How many tracking files do you wish to load?:');   
track_data = {1,prompt}; 
for j = 1:prompt
    
    file_name_1 = 'MAX_00'; 
    file_name_2 = num2str(j); 
    file_name_3 = '_Tracks.mat'; 
    
    variable_name = [file_name_1 file_name_2 file_name_3]; 
    x = struct2cell(load(variable_name)); 
    
    track_data{1,j} = x{1,1}; 
end 

clear vars variable_name j file_name_1 file_name_2 file_name_3 x

%% Step (2); Generating displacement and angle data 
% we call displacement_generator to give us angles and displacements 

speed = {1,prompt};  
angle_d = {1,prompt};  
my_normalized_speed = {1,prompt}; 
for j = 1:prompt 
    
    [speed{1,j},angle_d{1,j}, my_normalized_speed{1,j}] = displacement_generator( track_data{j} ); 
    
    % this for loop looks for any NaN's that might have been generated in
    % displacement_generator
    for k = 1:abs(length(speed{1,j}))
        
        [row,col] = find(isnan(speed{1,j}{k})); 
        
        if (size(row,2) ~=0 || size(col,2) ~= 0)
            
            disp('Located NaN at position'); 
            display(row); 
            display(col); 
            disp(j);
            disp(k);  
            break
        end 
        
        [row,col] = find(isnan(angle_d{1,j}{k})); 
        
        if (size(row,2) ~=0 || size(col,2) ~= 0)
            disp('Located NaN at position'); 
            display(row); 
            display(col); 
            disp(j);
            disp(k); 
            break
        end 
        
        
    end 
end 

clear vars j k col row 

%% Step(3): Establishing the distribution of values generated from the last step 

% First step will be to look at the distribution of angles generated from
% our analysis> so we need to generate a single array of turn angles from
% our cell array of angles orgainzed by fish. 

my_angles_row_per_fish = {1,abs(length(angle_d))}; 
my_speed_row_per_fish = {1,abs(length(speed))}; 

for j = 1:abs(length(angle_d)) 
    
    my_angles_row_per_fish{1,j} = cell2mat(angle_d{j}); 
    my_speed_row_per_fish{1,j} = cell2mat(speed{j}); 
end 

column_all_angles = cell2mat(my_angles_row_per_fish); 
column_speed = cell2mat(my_speed_row_per_fish); 

% Now we generate a figure to display the distirbution of angles as a polar
% histogram, and gives us the properties of the polar histogram

% figure(1); 
% subplot(1,2,1); 
% h = polarhistogram(column_angles);
% title('Polar histogram of angles in radians, computed as angle = asin(y_disp/disp)'); 
% subplot(1,2,2); 
% histogram(column_disp); 
% xlabel('displacement length'); 
% ylabel('count');
% title('Count of each displacement'); 
clear vars j 
%% Step(4):Generating Turn Angles 

% Turn Angles theta_1 - theta_0 
turn_angles = {1,abs(length(angle_d))}; 
for j = 1:abs(length(angle_d))
    
    angles = angle_d{j}; 
    angles_nested_cell = {1,abs(length(angles))}; 
    for k = 1:abs(length(angles))
        
        my_angles = angles{k}; 
        my_turn = zeros(1,abs(length(my_angles))-1); 
        for m = 2:abs(length(my_angles))
            
            my_turn(1,m-1) = my_angles(m) - my_angles(m-1); 
        
        end 
    
        angles_nested_cell{1,k} = my_turn;
    end 
    
    turn_angles{1,j} = angles_nested_cell; 
    
end 

clear vars j k m my_turn angles angles_nested_cell my_angles

%% Directional AutoCorrelation Function 

directional_autocorrelation_function = {1,prompt}; 

for j = 1: prompt 
    
    [directional_autocorrelation_function{1,j}] = remove_trend_data(turn_angles{j},0,1);
end 
        
clear vars prompt   j
   









