function [vspeed,vspeed_av]= airspeedventuri(VData_V)
%% Intialize constants
    R=.287; %kj/(kg*k)
    %% Gather Temperature, Density, Pressure using data
    APressure= VData_V(:,1)/1000;
    %Convert to kilo pascal
    Temp=VData_V(:,2);
    rho=APressure./(R*Temp);
    gage_pressure=VData_V(:,3);
    %Keep in pascals
    %% Use the venturitube equations to find speed
    vspeed=sqrt(2.*(gage_pressure)*(R).*(Temp))./(rho*(1-(1/9.5)^2))/10;
    vspeed_av=mean(vspeed);
    %in m/s
end