
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