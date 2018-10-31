% main stript

Data = csvread('VelocityVoltage_S013_G03.csv',1);

APressure = Data(:,1);

ATemp = Data(:,2);

Voltage = Data(:,7);

AvPressure = sum(APressure)/2500
%{
Airspeed = AirSpeed();

AirspeedModel = ASvsV();

Uncertainty = ASUncertainty();

Boundarylayer = BoundaryLayer();
%}