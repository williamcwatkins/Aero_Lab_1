function [] = AVM(VData_P,VData_V,speed,vspeed,PUnc,VUnc)
%{
k = 1;
for i = 1:500:length(vspeed)-500
    VenturiAv(k) = mean(vspeed(i:i+500));
    k = k + 1;
end

k = 1;
for i = 1:500:length(speed)-500
    PitotAv(k) = mean(speed(i:i+500));
    k = k + 1;
end

k = 1;
for i = 1:500:length(VData_V(:,7))-500
    VenturiV(k) = mean(VData_V(i:i+500,7));
    k = k + 1;
end

k = 1;
for i = 1:500:length(VData_P(:,7))-500
    PitotV(k) = mean(VData_P(i:i+500,7));
    k = k + 1;
end

k = 1;
for i = 1:500:length(VUnc(:))-500
    VU(k) = mean(VUnc(i:i+500));
    k = k + 1;
end

k = 1;
for i = 1:500:length(PUnc(:))-500
    PU(k) = mean(PUnc(i:i+500));
    k = k + 1;
end
%}
%% pitot tube plot
Voltage = [VData_P', ones(length(VData_P),1)];

A = Voltage;
B = speed;

X = A \ B;

m = X(1);
b = X(2);

V = linspace(0,10,11);

bestfit = m.*V + b;



%% Veturi tube plot

Voltage_2 = [VData_V', ones(length(VData_V),1)];

A2 = Voltage_2;
B2 = vspeed;

X2 = A2 \ B2;

m2 = X2(1);
b2 = X2(2);

bestfit2 = m2.*V + b2;

VData_V
size(vspeed)

subplot(1,2,1)

hold on;
plot(VData_V,vspeed)
errorbar(VData_V,vspeed',VUnc,'LineStyle','none')
%plot(VData_V(:,7),bestfit2)
title('Airspeed Vs. Voltage for Venturi Tube')
xlabel('Voltage (V)')
ylabel('Velocity (m/s)')
hold off;

subplot(1,2,2)

hold on;
errorbar(VData_P,speed',PUnc,'LineStyle','none')
%plot(VData_P(:,7),bestfit)
title('Airspeed Vs. Voltage for Pitot Tube')
xlabel('Voltage (V)')
ylabel('Velocity (m/s)')
hold off;

end
