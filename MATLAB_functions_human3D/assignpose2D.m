function coor_conf = assignpose2D(a, A)
%% This function takes inputs of joint positions as in Openpose and outputs
% the coorinates and confidence scores for that joint.

% Inputs:
%     a: the joint number in Openpose
%     A: the class (poses, hand_right, hand_left)
%     
% Outputs:
%     A 1x3 vector with 2D joint positions and confidence score.
%     
% Written by: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA

coor_conf = [A(3*a+1) A(3*a+2) A(3*a+3)];
end