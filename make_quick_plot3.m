function [] = make_quick_plot3( movie, track,track_data,speed)


% Active - make figures dont save 


x = track_data{movie}{track}(1:end-1,2); 
y = track_data{movie}{track}(1:end-1,3); 

my_speed = speed{movie}{track}; 

plot3(x,y,my_speed);
grid on
xlabel('x - microns'); 
ylabel(' y - microns'); 
zlabel('displacement'); 
end 