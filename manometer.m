function speed=manometer(data)
%% Initialize constants
rho_water=997; %kg/m^3
R=.287; %kj/(kg*k)
g=9.81; %m/s 
%% Gather Temperature, Density, Pressure using data
APressure= mean(data(:,1))/1000; %kilopascals
Temp=mean(data(:,2)); % kelvin
rho_air=mean(APressure./(R*Temp));
manometer_height=[0;.4;1.4;2.8;4.9]; %Value is in inches of water
manometer_height=manometer_height*.0254; %convert from inches to meters
%% Find P_diff and use the pitot tube equation to find speed base off of manometer
P_diff=(rho_water-rho_air)*g.*manometer_height;
speed=sqrt((2.*P_diff)./(rho_air));
%% Find uncertainty in manometer calculation
ds = (1./sqrt(2 .* P_diff .* rho_air)) .* 0.5;
ds(1) = 0;
end