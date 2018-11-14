function [speed,speed_av]= Airspeed(Data,a)
    APressure= Data(:,1)/1000;
    %Convert to kilo pascal
    R=.287; %kg/kJ*k
    Temp=Data(:,2);
    rho=APressure./(R*Temp);
    gage_pressure=abs(Data(:,3+a));
    %Keep in pascals
    speed=sqrt(2*gage_pressure)./(rho);
    speed_av=mean(speed);
end