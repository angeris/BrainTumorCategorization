% Main File

% clean workspace
clear all; close all; clc 

% Add all directories and subdirectories to the current path.
addpath(genpath('.'));

%%
p_doctor = readMHA('data/brats_2013_pat0001_1/VSD.Brain_3more.XX.O.OT.54517');
[p_hat, dims] = read_data('data/brats_2013_pat0001_1/');

disp('Done with convolution');

s = 50:100;

clas = process_data(p_hat, dims);

disp('Done with kmeans');

imtool3D([clas, p_doctor(s,s,:)]);