% main stript

Data = csvread('VelocityVoltage_S013_G03.csv',1);

APressure = Data(:,1);

DPressure = Data(:,3);
AVDPressure = mean(DPressure);

ATemp = Data(:,2);
AvTemp = mean(ATemp);

Voltage = Data(:,7);

AvPressure = mean(APressure);

%Manometer Diff heights
manometer = [0; .4; 1.4; 2.8; 4.9];
uncmano = .05;
%{
Airspeed = AirSpeed();

AirspeedModel = ASvsV();

Uncertainty = ASUncertainty();

Boundarylayer = BoundaryLayer();
%}