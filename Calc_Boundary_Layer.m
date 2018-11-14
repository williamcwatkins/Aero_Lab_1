
function [height] =  Calc_Boundary_Layer(BData)
%% Calulate Boundary Layer

%Port Number 3
%height recorded 0, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5, and 
%Center

%Need to find at what height the velocity of the air reaches .95 of the
%velocity of the air at free stream height.

%Atmospheric Pressure [Pa] Atmospheric Temperature [K]	Airspeed Differential Pressure [Pa]	Aux Differential Pressure [Pa]	ELD Probe X axis [mm]	ELD Probe Y axis [mm]	Voltage [V]
    for i = 1:24
        group_data = BData{i};

    %Probe is actually .4mm off the ground
            %INTIALIZE LOOP ITERATORS
            y_val = 0;
            k = 1;
            k_stop = 500:500:length(group_data);
        for loop1 = 1:length(k_stop)
            %Loop through the data to get the level data of the current y_val
            %height
            %Preallocating for speed
            level_data = zeros(500,7);
            j = 1;
            while k <= k_stop(loop1)
                level_data(j,:)= group_data(k,:);
                k = k+1;
                j = j+1;
            end
            %Now use the data to calculate the air velocity at this height and save
            %it in matrix called wind speed pressure diff over the density times 2
            [~,ASpeedAv]= Airspeed(level_data,1);
            %Hieght of ELD with +4mm to account for size of ELD.
            y_val=mean(level_data(:,6)) + 0.4;
           file_data(loop1,:) = [y_val,ASpeedAv];
        end
        %Seperating variables
        free_stream_v = file_data(end,2);
        boundary_v = free_stream_v * 0.95;
        ELD_height = file_data(1:end - 1,1);
        ELD_v = file_data(1:end - 1,2);
        ActualBoundaryV = min(ELD_v(find(ELD_v > boundary_v)));
        ActualBoundaryH = min(ELD_height(find(ELD_v > boundary_v)));
        % Calculating line of best fit and plotting the 

        p=polyfit(ELD_height,ELD_v,2);

        p(3)= p(3) - boundary_v;
        boundary_ELD = abs(sort(roots(p)));
        
        height(i,1) = boundary_ELD(1);
        height(i,2) = ActualBoundaryH;
    end
end