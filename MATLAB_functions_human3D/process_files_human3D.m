%% This script extracts the 3D coordinates of the joints from json files,
% plots test images, and makes video of the motor test.
%     
% Written by: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA

clear;clc;


%% extract the 3D positions of all joints

poses_3D = poses_final('cam1_folder', 'cam2_folder', 'Calib_Results_stereo.mat');


%% test any frame to adjust the min_az, max_az and el settings.
i= 1;

figure
bodyplot3D(i, poses_3D);grid on;hold on;
handplot3D('RH', i, poses_3D);grid on;hold on;
handplot3D('LH', i, poses_3D);grid on

set(gca,'color',[0 0 0])
ax=gca;
ax.GridColor=[0.5 0.5 0.5];


%% make video body parts

videofilename = 'testvideo'; % the name of the new video file
track = 'Rwrist'; % a trajectory for this joint will be plotted

% view angle settings based on the above test image
min_az = ;
max_az =  ;
el = ;

makevideo_3D(poses_3D, videofilename, track, min_az, max_az, el)
