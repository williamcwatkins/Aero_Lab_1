function [] = AVM (Data,speed)

Voltage = [Data(:,7), ones(2500,1)];

A = Voltage;
B = speed;

X = A \ B;

m = X(1);
b = X(2);

V = linspace(1,9,9);

bestfit = m*V + b;


hold on;
scatter(Data(:,7),B)
plot(bestfit)
title('Airspeed Vs. Voltage')
xlabel('Voltage')
ylabel('Velocity')
end