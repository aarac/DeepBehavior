function coor3D = coor_3D(Front_cent, Side_cent, calibresults)

%% Load stereo calib settings.
% The stereo calibration file should have been prepared for these camera
% settings and named as 'Calib_Results_stereo.mat'.

load(calibresults);

% left cam is the side cam
% right cam is the front cam

%% Pre-assign zeros to the final 3D coordinates matrices and reshape the
% 2D coordinates matrices. The stereo_triangulation function accepts 2xN 
% matrices as input and gives out 3xN matrices as output.
x_R = Front_cent';
x_L = Side_cent';

XR = zeros(3,length(Front_cent));
XL = zeros(3,length(Side_cent));

%% Run the stereo_triangulation function to obtain the 3D coordinates and 
% save the 3D coordinate files:

for i=1:length(Front_cent)
    [XL(:,i),XR(:,i)] = stereo_triangulation(x_L(:,i),x_R(:,i),om,T,fc_left,cc_left,kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);
end

coor3D=XL;

end