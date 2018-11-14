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

VData = [VData{1,1};VData{1,2};VData{1,1};VData{1,3};VData{1,4};VData{1,5};VData{1,6};VData{1,7};VData{1,8};VData{1,9};VData{1,10};VData{1,11};VData{1,12};VData{1,13};VData{1,14};VData{1,15};VData{1,16};VData{1,17};VData{1,18};VData{1,19};VData{1,1};VData{1,20};VData{1,21};VData{1,1};VData{1,22};VData{1,23};VData{1,24};VData{1,25};VData{1,26};VData{1,27};VData{1,28};VData{1,29};VData{1,30};VData{1,31};VData{1,32}];
BData = [BData{1,1};BData{1,2};BData{1,3};BData{1,4};BData{1,5};BData{1,7};BData{1,8};BData{1,9};BData{1,10};BData{1,11};BData{1,13};BData{1,14};BData{1,16};BData{1,17};BData{1,18};BData{1,19};BData{1,20};BData{1,23};BData{1,24};BData{1,25};BData{1,26};BData{1,29};BData{1,31};BData{1,32}];



