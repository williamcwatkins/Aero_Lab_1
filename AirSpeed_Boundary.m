function [ASpeed,ASpeedAv]= AirSpeed_Boundary(BData,a)
    %AirSpeed calculates the airspeed from the velocity voltage data
    APressure = BData(:,1)/1000;
    %Convert atmospheric pressure to kilo pascal
    R = 0.287; %kg/kJ*k
    Temp = BData(:,2);
    rho = APressure./(R*Temp);
    gage_pressure = BData(:,3+a);
    %Keep the differential pressure in pascals
    ASpeed = sqrt(2.*gage_pressure)./(rho);
    ASpeedAv = mean(ASpeed);
end