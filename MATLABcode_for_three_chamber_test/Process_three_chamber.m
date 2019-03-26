%% This script takes json files (of the coordinates) from the Tensorbox output,
% and outputs the coordinates of the mouse locations in 2D in three chmaber test.
% During this procedure, it also creates and saves tables showing the bbox 
% coordinates and scores, bbox center points.

% author: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA
% created on: 11/04/2017


%%
clear;clc;

%% Extract the coordinates from the json file.

%Enter the full .json file name here
cam_filename = 'JSONFILENAME.json';

[~,basicname] = fileparts(cam_filename);

currentFolder = cd;

%% Convert json files to bbox and score tables for each camera view and 
% save them:

filename = sprintf('%s_table.mat', basicname);
if exist(fullfile(currentFolder, filename), 'file') == 0
    basic_table = json2table(cam_filename);
    save(sprintf('%s_table.mat', basicname), 'Front_table');
else
    basic_table = cell2table(struct2cell(load(filename)));
    basic_table = basic_table.Var1{1,1};
end


%% Convert the bbox tables to matrices showing bbox centers and save them:

filename = sprintf('%s_cent.mat', basicname);
if exist(fullfile(currentFolder, filename), 'file') == 0
    basic_cent = coorcenters(basic_table);
    save(sprintf('%s_cent.mat', basicname), 'Front_cent');
else
    basic_cent = cell2mat(struct2cell(load(filename)));
end


%% Plot the 2D walking trajectory of the mouse.

figure; 
plot(basic_cent(:,1),basic_cent(:,2));

