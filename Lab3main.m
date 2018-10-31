% main stript

Data = csvread('VelocityVoltage_S013_G03.csv',2,1);

APressure = Data(:,1);

AvPressure = sum(APressure)/2499

Airspeed = AirSpeed();

AirspeedModel = ASvsV();

Uncertainty = ASUncertainty();

Boundarylayer = BoundaryLayer();
