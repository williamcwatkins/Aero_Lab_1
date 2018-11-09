
filenameB = {'BoundaryLayer_S013_G01.csv','BoundaryLayer_S013_G03.csv'};
k = 1;
for i = 1:length(filenameB)
    BData{k} = csvread(filenameB{i},1);
    k = k+1;
end


filenameV = {'VelocityVoltage_S013_G03.csv'};
k = 1;
for i = 1:length(filenameV)
    vData{k} = csvread(filenameV{i},1);
    k = k+1;
end

% if length(filenameB)==1
%     all_airspeeds=airspeed(vData{1,1});
% else
%     for j=1:length(filenameB)
%         all_boundarylayer=airspeed(vData{1,j});
%     end
% end

all_airspeeds= [0,0];
%Initialize the all_airspeed in order to concatante it
if length(filenameV)==1
    all_airspeeds=[all_airspeeds;airspeed(vData{1,1}),vData{1,1}(:,7)];
    %concatenate the airspeed in the first column and the corresponding
    %voltage in the next column
else
    for i=1:length(filenameV)
        find_airspeeds=airspeed(vData{1,i});
        all_airspeeds=[all_airspeeds;find_airspeeds,vData{1,i}(:,7)];
        %if more than one dataset is given repeat the process
        
    end
end
all_airspeeds(1,:)=[];
%delete the orginally 0,0 in airpspeed

airspeed_av=calc_voltspeed(all_airspeeds);