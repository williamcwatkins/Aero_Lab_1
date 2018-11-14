clear; clc;

% main stript

Data = csvread('VelocityVoltage_S013_G03.csv',1);

APressure = Data(:,1);

AvPressure = sum(APressure)/2499;

R = 0.2870; %KJ/Kg * K

filenameB = {'BoundaryLayer_S013_G01.csv','BoundaryLayer_S013_G03.csv'};
k = 1;
for i = 1:length(filenameB)
    BData{k} = csvread(filenameB{i},1);
    k = k+1;
end


filenameV = {'VelocityVoltage_S013_G03.csv'};
k = 1;
for i = 1:length(filenameV)
    vData{k} = csvread(filenameV{i},1);
    k = k+1;
end

[speed,speed_av]= airspeed(Data);

AVM (Data,speed);
%% airspeed vs voltage

% Voltage = [Data(:,7), ones(2500,1)];
% 
% A = Voltage;
% B = speed;
% 
% X = A \ B;
% 
% m = X(1);
% b = X(2);
% 
% V = linspace(1,9,9);
% 
% bestfit = m*V + b;
% 
% 
% hold on;
% scatter(Data(:,7),B)
% plot(bestfit)
% title('Airspeed Vs. Voltage')
% xlabel('Voltage')
% ylabel('Velocity')


