% main stript

Data = csvread('VelocityVoltage_S013_G03.csv',2,1);

APressure = Data(:,1);

AvPressure = sum(APressure)/2499


