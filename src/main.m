% Main File

% clean workspace
clear all; close all; clc 

% Add all directories and subdirectories to the current path.
addpath(genpath('.'));

%%

[p_hat, dims] = read_data('data/brats_2013_pat0001_1/');



clas = process_data(p_hat, dims);