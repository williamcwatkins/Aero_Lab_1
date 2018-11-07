%% Calulate Boundry Layer
clear;clc
%Port Number 3
%height recorded 0, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5, and 
%Center

%Need to find at what height the velcity of the air reaches .95 of the
%velocity of the air at free stream height.

%'BoundaryLayer_2016Sample.csv'
%'BoundaryLayer_S013_G03.csv'

%Atmospheric Pressure [Pa] Atmospheric Temperature [K]	Airspeed Differential Pressure [Pa]	Aux Differential Pressure [Pa]	ELD Probe X axis [mm]	ELD Probe Y axis [mm]	Voltage [V]
input = 'Aero_Lab_1-master\BoundaryLayer_S013_G03.csv';
data  = load(input);

%Probe is actually .4mm off the ground
if length(data) == 6000
    %loop through the 12 data points
    y_val = 0;
for loop1 = 1:13
    %Loop through the data to get the 
    for loop2 = 1:length(data)
        level_data = zeros(500,7);
        if (data(loop2,6) > -0.1+y_val) && (data(loop2,6) < 0.1+y_val)
            level_data(loop2,:)= data(loop2,:);
        else
            break;
        end
    end
    
    %Now use the data to calculate the air velocity at this height and save
    %it in matrix called wind speed pressure diff over the density times 2
end

else 
end
            error('Data in %f mm range not found for file %s',y_val,input)

