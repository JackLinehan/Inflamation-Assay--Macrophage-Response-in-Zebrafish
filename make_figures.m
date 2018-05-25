
% for j = 1:abs(length(speed))
%     figure(j); 
%         
%         hold on 
%         histogram(cell2mat(speed{j})); 
%         xlabel('Absolute Value of Displacement'); 
%         ylabel('Counts');
%         name = ['Histogram of absolute value of Displacement: Fish' num2str(j)]; 
%         title(name);  
%         saveas(gcf,name,'tiff'); 
% end
% 
% for j = 1:abs(length(angle_d))
%     
%     figure(j); 
%     polarhistogram(cell2mat(angle_d{j}))
%     name = ['Polar Histogram of orientation angles in degrees: Fish' num2str(j)]; 
%     title(name); 
%     saveas(gcf,name,'tiff'); 
% end 
%     
%     
% % Turn Angles theta_1 - theta_0 
% turn_angles = {1,abs(length(angle_d))}; 
% for j = 1:abs(length(angle_d))
%     
%     angles = angle_d{j}; 
%     angles_nested_cell = {1,abs(length(angles))}; 
%     for k = 1:abs(length(angles))
%         
%         my_angles = angles{k}; 
%         my_turn = zeros(1,abs(length(my_angles))-1); 
%         for m = 2:abs(length(my_angles))
%             
%             my_turn(1,m-1) = my_angles(m) - my_angles(m-1); 
%         
%         end 
%     
%         angles_nested_cell{1,k} = my_turn;
%     end 
%     
%     turn_angles{1,j} = angles_nested_cell; 
%     
% end 
% 
% for j = 1:abs(length(turn_angles))
%     
%     figure(j); 
%     polarhistogram(cell2mat(turn_angles{j}))
%     name = ['Polar Histogram of turn angles in degrees: Fish' num2str(j)]; 
%     title(name); 
%     saveas(gcf,name,'tiff'); 
%     
% end 

%% Auto-correlation Analysis 
count = 1; 
for j = 1:abs(length(directional_autocorrelation_function))
    
    my_r = directional_autocorrelation_function{j}; 
   
    for k = 1:abs(length(my_r))
        
       figure(count); 
       plot((1:abs(length(my_r{k}))),my_r{k}); 
       axis([1 15 min(directional_autocorrelation_function{2}{1}) max(directional_autocorrelation_function{2}{1})]);xticks(1:15);
       xlabel('Time Lag');
       ylabel('AutoCorrelation Coefficient Value'); 
       name = [ 'Angular AutoCorrelation Function: Fish' num2str(j) 'Cell' num2str(k)]; 
       title(name); 
       count = count +1; 
    end 
end 





