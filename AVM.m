function [] = AVM (VData_P,VData_V,speed,vspeed,PUnc,VUnc)

%% pitot tube plot
Voltage = [VData_P(:,7), ones(45000,1)];

A = Voltage;
B = speed;

X = A \ B;

m = X(1);
b = X(2);

V = linspace(0,10,11);

bestfit = m.*VData_P(:,7) + b;



%% Veturi tube plot

Voltage_2 = [VData_V(:,7), ones(39000,1)];

A2 = Voltage_2;
B2 = vspeed;

X2 = A2 \ B2;

m2 = X2(1);
b2 = X2(2);

bestfit2 = m2.*VData_V(:,7) + b2;



subplot(1,2,1)

hold on;
errorbar(VData_V(:,7),B2,VUnc,'LineStyle','none')
plot(VData_V(:,7),bestfit2)
title('Airspeed Vs. Voltage for Venturi Tube')
xlabel('Voltage (V)')
ylabel('Velocity (m/s)')
hold off;

subplot(1,2,2)

hold on;
errorbar(VData_P(:,7),B,PUnc,'LineStyle','none')
plot(VData_P(:,7),bestfit)
title('Airspeed Vs. Voltage for Pitot Tube')
xlabel('Voltage (V)')
ylabel('Velocity (m/s)')
hold off;

end
