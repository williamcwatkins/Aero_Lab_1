function [] = PlotBoundaryLayer(height)
%PlotBoundaryLayer plots the theoretical and actual height of the boundary
%   layer
distance = [9.05 9.05 11.99 11.99 14.93 17.87 17.87 10.03 10.03 12.97 ...
    15.91 15.91 18.85 11.01 11.01 13.95 13.95 14.93 14.93 13.95 13.95 ...
    17.87 11.99 11.99];
distance = distance';
distance = 25.4 .* distance;
%        1    2     3     4     5     6     7     8     9     10    11
ports = [9.05 10.03 11.01 11.99 12.97 13.95 14.93 15.91 16.89 17.87 18.85];
ports = 25.4 .* ports;

Theoreticalp = polyfit(distance,height(:,1),2); %x2, x, b
Theoreticalf = Theoreticalp(1) .* (ports .^2) + Theoreticalp(2) .* ports + Theoreticalp(3);
Actualp = polyfit(distance,height(:,2),2); %x2, x, b
Actualf = Actualp(1) .* (ports .^2) + Actualp(2) .* ports + Actualp(3);

subplot(1,2,1)
hold on;
scatter(distance, height(:,1))
plot(ports, Theoreticalf);
title('Theoretical Boundary Height vs. Distance Downstream')
xlabel('Distance Downstream (mm)')
ylabel('Boundary Height (mm)')
hold off;

subplot(1,2,2)
hold on;
scatter(distance, height(:,2))
plot(ports, Actualf);
title('Actual Boundary Height vs. Distance Downstream')
xlabel('Distance Downstream (mm)')
ylabel('Boundary Height (mm)')
hold off;

end

