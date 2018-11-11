% filenameB = {'BoundaryLayer_S013_G01.csv','BoundaryLayer_S013_G03.csv'};

Filenames = struct2cell( dir('2002_AeroLab1_WindTunnelData') );
BFiles = Filenames(1,3:34)';
VFiles = Filenames(1,35:end)';

k = 1;
for i = 1:length(VFiles)
    VData{k} = csvread(VFiles{i},1);
    k = k+1;
end

k = 1;
for i = 1:length(BFiles)
    BData{k} = csvread(BFiles{i},1);
    k = k+1;
end


all_airspeeds= [0,0];
%Initialize the all_airspeed in order to concatante it
if length(VFiles)==1
    all_airspeeds=[all_airspeeds;airspeed(VData{1,1}),VData{1,1}(:,7)];
    %concatenate the airspeed in the first column and the corresponding
    %voltage in the next column
else
    for i=1:length(VFiles)
        find_airspeeds=airspeed(VData{1,i});
        all_airspeeds=[all_airspeeds;find_airspeeds,VData{1,i}(:,7)];
        %if more than one dataset is given repeat the process
        
    end
end
all_airspeeds(1,:)=[];
%delete the orginally 0,0 in airpspeed

airspeed_av=calc_voltspeed(all_airspeeds);