%% Calulate Boundry Layer
clear;clc;close all
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
    %INTIALIZE LOOP ITERATORS
    y_val = 0;
    k = 1;
    k_stop = 500:500:length(data);
for loop1 = 1:length(k_stop)
    %Loop through the data to get the level data of the current y_val
    %height
    %Preallocating for speed
    level_data = zeros(500,7);
    i = 1;
    while k <= k_stop(loop1)
        level_data(i,:)= data(k,:);
        k = k+1;
        i = i+1;
    end
    %Now use the data to calculate the air velocity at this height and save
    %it in matrix called wind speed pressure diff over the density times 2
    [ASpeed,ASpeedAv]= AirSpeed_Boundary(level_data);
    y_val=mean(level_data(:,6))+.4;
   file_data(loop1,:) = [y_val,ASpeedAv];
    
end
free_stream_v = file_data(end,2);
boundary_v = free_stream_v*.95;
ELD_height = file_data(1:end-1,1);
ELD_v = file_data(1:end-1,2);
hold on
plot(ELD_v,ELD_height)
p=polyfit(ELD_v,ELD_height,2);

line([boundary_v,boundary_v],[0,10])
x = 16:.1:28;
f = p(1).*x.^2+p(2).*x+p(3);
plot(x,f)

for h=1:length(f)-1
   if x(h) < boundary_v && x(h+1)> boundary_v
       height=h;
   end
end
height=f(height);

