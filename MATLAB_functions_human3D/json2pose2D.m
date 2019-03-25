function [head, Reye, Rear, Leye, Lear, chest, Rshoulder, Relbow, Rwrist, Lshoulder, Lelbow, Lwrist,...
    midhip, Rhip, Lhip, Rknee, Lknee, RH_wrist, RH_thumb1, RH_thumb2, RH_thumb3,...
    RH_index1, RH_index2, RH_index3, RH_index4, RH_mid1, RH_mid2, RH_mid3, RH_mid4,...
    RH_ring1, RH_ring2, RH_ring3, RH_ring4, RH_pinky1, RH_pinky2, RH_pinky3,...
    RH_pinky4, LH_wrist, LH_thumb1, LH_thumb2, LH_thumb3, LH_index1, LH_index2, LH_index3,...
    LH_index4, LH_mid1, LH_mid2, LH_mid3, LH_mid4, LH_ring1, LH_ring2, LH_ring3,...
    LH_ring4, LH_pinky1, LH_pinky2, LH_pinky3, LH_pinky4] = json2pose2D(filename)


% This function takes json file (from Openpose) and outputs the joint
% positions of the above joints.

% author: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA
% created on: 06/14/2018
%
% input: json file after detecting the coordinates and the scores of the predicted pose coordinates. 
%
% output: coordinates for different body parts 
% 
% Requirements: JSONLAB toolbox from matlab, assignpose2D function.

keypoints = loadjson(filename);

poses= keypoints.people{1,1}.pose_keypoints_2d;
hand_left=keypoints.people{1,1}.hand_left_keypoints_2d;
hand_right=keypoints.people{1,1}.hand_right_keypoints_2d;

head = assignpose2D(0,poses);
Reye = assignpose2D(15,poses);
Rear = assignpose2D(17,poses);
Leye = assignpose2D(16,poses);
Lear = assignpose2D(18,poses);

chest = assignpose2D(1,poses);
Rshoulder = assignpose2D(2,poses);
Relbow = assignpose2D(3,poses);
Rwrist = assignpose2D(4,poses);
Lshoulder = assignpose2D(5,poses);
Lelbow = assignpose2D(6,poses);
Lwrist = assignpose2D(7,poses);
midhip = assignpose2D(8,poses);
Rhip = assignpose2D(9,poses);
Lhip = assignpose2D(12,poses);
Rknee = assignpose2D(10,poses);
Lknee = assignpose2D(13,poses);

RH_wrist = assignpose2D(0,hand_right);
RH_thumb1 = assignpose2D(2,hand_right);
RH_thumb2 = assignpose2D(3,hand_right);
RH_thumb3 = assignpose2D(4,hand_right);
RH_index1 = assignpose2D(5,hand_right);
RH_index2 = assignpose2D(6,hand_right);
RH_index3 = assignpose2D(7,hand_right);
RH_index4 = assignpose2D(8,hand_right);
RH_mid1 = assignpose2D(9,hand_right);
RH_mid2 = assignpose2D(10,hand_right);
RH_mid3 = assignpose2D(11,hand_right);
RH_mid4 = assignpose2D(12,hand_right);
RH_ring1 = assignpose2D(13,hand_right);
RH_ring2 = assignpose2D(14,hand_right);
RH_ring3 = assignpose2D(15,hand_right);
RH_ring4 = assignpose2D(16,hand_right);
RH_pinky1 = assignpose2D(17,hand_right);
RH_pinky2 = assignpose2D(18,hand_right);
RH_pinky3 = assignpose2D(19,hand_right);
RH_pinky4 = assignpose2D(20,hand_right);

LH_wrist = assignpose2D(0,hand_left);
LH_thumb1 = assignpose2D(2,hand_left);
LH_thumb2 = assignpose2D(3,hand_left);
LH_thumb3 = assignpose2D(4,hand_left);
LH_index1 = assignpose2D(5,hand_left);
LH_index2 = assignpose2D(6,hand_left);
LH_index3 = assignpose2D(7,hand_left);
LH_index4 = assignpose2D(8,hand_left);
LH_mid1 = assignpose2D(9,hand_left);
LH_mid2 = assignpose2D(10,hand_left);
LH_mid3 = assignpose2D(11,hand_left);
LH_mid4 = assignpose2D(12,hand_left);
LH_ring1 = assignpose2D(13,hand_left);
LH_ring2 = assignpose2D(14,hand_left);
LH_ring3 = assignpose2D(15,hand_left);
LH_ring4 = assignpose2D(16,hand_left);
LH_pinky1 = assignpose2D(17,hand_left);
LH_pinky2 = assignpose2D(18,hand_left);
LH_pinky3 = assignpose2D(19,hand_left);
LH_pinky4 = assignpose2D(20,hand_left);
end