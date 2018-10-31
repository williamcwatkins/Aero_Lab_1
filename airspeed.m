function [speed,speed_av]= airspeed(Data)
    APressure= Data(:,1)/1000;
    %Convert to kilo pascal
    R=.287; %kg/kJ*k
    Temp=Data(:,2);
    rho=APressure./(R*Temp);
    gage_pressure=Data(:,3);
    %Keep in pascals
    speed=sqrt(2.*gage_pressure)./(rho);
    speed_av=mean(speed);
end