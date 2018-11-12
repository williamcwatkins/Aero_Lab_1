function [speed,speed_av]= airspeedventuri(Data)
%% Intialize constants
    R=.287; %kj/(kg*k)
    %% Gather Temperature, Density, Pressure using data
    APressure= Data(:,1)/1000;
    %Convert to kilo pascal
    Temp=Data(:,2);
    rho=APressure./(R*Temp);
    gage_pressure=Data(:,3);
    %Keep in pascals
    %% Use the venturitube equations to find speed
    speed=sqrt(2.*(gage_pressure)*(R).*(Temp))./(rho*(1-(1/9.5)^2))/10;
    speed_av=mean(speed);
    %in m/s
end