function [volCT, x, y, z] = readMHA(pathMHA)
%READDICOM This program takes in a folder with .dcm and reads them all.
%
%   INPUT:
%   pathDICOM - String folder path name that holds .dcm's.
%
%   OUTPUT:
%   volCT   - A 3D matrix that has CT slices at every z value.
%   [x,y,z] - A 3D matrix of same size as volCT that has positions.
%
%Created by Darvin Yi (darvinyi[at]Stanford.EDU

%% Setting up Reading Files
celDirectory         = dir([pathMHA filesep '*.mha']);
[trash, volCT, info] = evalc('ReadData3D([pathMHA filesep celDirectory(1).name]);');

[m,n,s]              = size(volCT);


%% Finding [x,y,z].
[x,y,z] = meshgrid(1:m, 1:n, 1:s);


end

