
filenameB = {'BoundaryLayer_S013_G01.csv','BoundaryLayer_S013_G03.csv'};
k = 1;
for i = 1:2
    BData{k} = csvread(filenameB{i},1);
    k = k+1;
end


filenameV = {'VelocityVoltage_S013_G03.csv'};
k = 1;
for i = 1:2
    vData{k} = csvread(filenameV{i},1);
    k = k+1;
end