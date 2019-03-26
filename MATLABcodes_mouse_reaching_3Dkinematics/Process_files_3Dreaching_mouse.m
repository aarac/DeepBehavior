%% This script takes json files (of the coordinates), and outputs the 3D coordinates of the 
% paw locations. During this procedure, it also creates and saves tables
% showing the bbox coordinates and scores, and bbox center points.

% author: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA
% created on: 11/04/2017


%%
clear;clc;

%% Load coordinate matrices obtained from each camera recording, but first 
% extract coordinates from the json files.

%Enter the full .json file name here
Front_cam_filename = 'FRONTCAMJSONFILE.json';
Side_cam_filename = 'SIDECAMJSONFILE.json';

scor_thresh = 0.99; % This is the threshold for bbox score to fix.

[~,frontname] = fileparts(Front_cam_filename);
[~,sidename] = fileparts(Side_cam_filename);
currentFolder = cd;

%% Convert json files to bbox and score tables for each camera view and 
% save them:

filename = sprintf('%s_table.mat', frontname);
if exist(fullfile(currentFolder, filename), 'file') == 0
    Front_table = json2table(Front_cam_filename);
    save(sprintf('%s_table.mat', frontname), 'Front_table');
else
    Front_table = cell2table(struct2cell(load(filename)));
    Front_table = Front_table.Var1{1,1};
end

filename = sprintf('%s_table.mat', sidename);
if exist(fullfile(currentFolder,filename), 'file') == 0
    Side_table = json2table(Side_cam_filename);
    save(sprintf('%s_table.mat', sidename), 'Side_table');
else
    Side_table = cell2table(struct2cell(load(filename)));
    Side_table = Side_table.Var1{1,1};
end

%% Convert the Front bbox tables to matrices showing bbox centers and save them:

filename = sprintf('%s_cent.mat', frontname);
if exist(fullfile(currentFolder, filename), 'file') == 0
    Front_cent = coorcenters(Front_table);
    save(sprintf('%s_cent.mat', frontname), 'Front_cent');
else
    Front_cent = cell2mat(struct2cell(load(filename)));
end

%% Convert the Side bbox tables to matrices showing bbox centers and save them:
filename = sprintf('%s_cent.mat', sidename);
if exist(fullfile(currentFolder, filename), 'file') == 0
    Side_cent = coorcenters(Side_table);
    save(sprintf('%s_cent.mat', sidename), 'Side_cent');
else
    Side_cent = cell2mat(struct2cell(load(filename)));
end

%% Check if the lengths of the cent_tables are the same.

if length(Front_cent) ~= length(Side_cent)
    error('Error. Front_cent and Side_cent matrices must be of equal size')
end

%% Get 3D coordinates

coor3D = coor_3D(Front_cent, Side_cent, calibresults); % calibresults is 'Calib_Results_stereo.mat'
save(sprintf('%s_3D.mat', sidename), coor3D);


%% Plot the 3D coordinates files for visualization:
figure
plot3(coor3D(1,:),coor3D(2,:),coor3D(3,:))

