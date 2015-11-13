% clean workspace
clear all; close all; clc 

for i=1:240
    for j = 1:240
        pTemp(j,i) = volCT1(i,j,50);
        sum = sum + volCT1(i,j,1); 
    end
end

mean = sum / (240^2)
sumDiff = 0;

for i=1:240
    for j = 1:240
        sumDiff = sumDiff + (pTemp(i,j) - mean)^2;
    end
end

var = sumDiff / (240)^2
std = sqrt(var)
p = zeros(240,240);
for i=1:240
    for j = 1:240
        p(i,j) = (pTemp(i,j)-mean) / std;
    end
end

result = zeros(1,240^2);

for i=1:240
    for j= 1:240
        result((i-1)*240+j) = p(i,j);
    end
end
