function [ASpeed,ASpeedAv]= AirSpeed_Boundary(Data)
    %AirSpeed calculates the airspeed from the velocity voltage data
    APressure = Data(:,1)/1000;
    %Convert atmospheric pressure to kilo pascal
    R = 0.287; %kg/kJ*k
    Temp = Data(:,2);
    rho = APressure./(R*Temp);
    gage_pressure = Data(:,4);
    %Keep the differential pressure in pascals
    ASpeed = sqrt(2.*gage_pressure)./(rho);
    ASpeedAv = mean(ASpeed);
end
