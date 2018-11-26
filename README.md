# Inflamation-Assay--Macrophage-Response-in-Zebrafish
Matlab Codes to analyze single cell movement of the innate immune system (macrophages) in vivo with GFP labes. 

                                          Single Cell Tracking – Main 
This program takes the tracking data stored as .mat files and computes angle of orientation, turn angle, speed, and an autocorrelation analysis of speed. To run this program you need to move all the tracks files and programs into one folder. So that the folder contains the following: 
	Main.m
	remove_trend_data.m
	displacement_generator.m
	All tracking files saved as .mat files. 
Generate a name for each tracks file using the following format: MAX_00N_Tracks.mat. Where N is an integer number. If you have 5 tracking files name them MAX_001_Tracks.mat, MAX_002_Tracks.mat, …, MAX_005_Tracks.mat. 
To run the analysis you will need to access this folder. Click on the folder icon with the green arrow and navigate to the folder. Next type Main into the command window:" >> Main ". 
The program will ask you how many files you want to load: Enter in the number of files you have in the folder. In this example we will stick to N = 5. 
">> Main"
 How many tracking files do you wish to load?:  (enter the number here)
The program will now return to you the following: 

	angle_d – angle of orientation defined by tan^(-1)⁡〖y/x〗 stored by nested cell array
	
	column_all_angles – all angles in one column vector: includes all tracks files 
	
	column_speed – all instantaneous speeds in one column vector includes all tracks files
	
	directional_autocorrelation_function: nested cell array
	
	my_angles_row_per_fish: all the orientation angles for each fish in their own vectors. 
	
	my_normalized_speed: The ratio of each speed to the largest speed in the tracks file. 
	
	my_speed_row_per_fish: All speeds in vector for each fish. 
	
	Speed: nested cell array so that each macrophages speed is recorded separately in each fish in every tracks files. 
	
	track_data: (t,x,y) data collected from tracks files. 
	
	turn_angles: Change in the angle of orientation of a macrophage between two points in time. Nested cell array. 
