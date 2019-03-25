function [head, Reye, Rear, Leye, Lear, chest, Rshoulder, Relbow, Rwrist, Lshoulder, Lelbow, Lwrist,...
    midhip, Rhip, Lhip, Rknee, Lknee, RH_wrist, RH_thumb1, RH_thumb2, RH_thumb3,...
    RH_index1, RH_index2, RH_index3, RH_index4, RH_mid1, RH_mid2, RH_mid3, RH_mid4,...
    RH_ring1, RH_ring2, RH_ring3, RH_ring4, RH_pinky1, RH_pinky2, RH_pinky3,...
    RH_pinky4, LH_wrist, LH_thumb1, LH_thumb2, LH_thumb3, LH_index1, LH_index2, LH_index3,...
    LH_index4, LH_mid1, LH_mid2, LH_mid3, LH_mid4, LH_ring1, LH_ring2, LH_ring3,...
    LH_ring4, LH_pinky1, LH_pinky2, LH_pinky3, LH_pinky4] = pose2D(workfolder)

%% This function obtains 2D joint positions over multiple time points for different joints.

% Inputs:
%     workfolder: folder that contains the json files
%     
% Outputs:
%    2D positions of the above joints.
%     
% Written by: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA

%% Get the coordinates of the shoulder, elbow and wrist positions
filepattern = fullfile(workfolder, '*.json');
filelist = dir(filepattern);

%% assign zeros to the coordinates

head = zeros(length(filelist),3);
Reye = zeros(length(filelist),3);
Rear = zeros(length(filelist),3);
Leye = zeros(length(filelist),3);
Lear = zeros(length(filelist),3);

chest = zeros(length(filelist),3);
Rshoulder = zeros(length(filelist),3);
Relbow = zeros(length(filelist),3);
Rwrist = zeros(length(filelist),3);
Lshoulder = zeros(length(filelist),3);
Lelbow = zeros(length(filelist),3);
Lwrist = zeros(length(filelist),3);
midhip = zeros(length(filelist),3);
Rhip = zeros(length(filelist),3);
Lhip = zeros(length(filelist),3);
Rknee = zeros(length(filelist),3);
Lknee = zeros(length(filelist),3);

RH_wrist = zeros(length(filelist),3);
RH_thumb1 = zeros(length(filelist),3);
RH_thumb2 = zeros(length(filelist),3);
RH_thumb3 = zeros(length(filelist),3);
RH_index1 = zeros(length(filelist),3);
RH_index2 = zeros(length(filelist),3);
RH_index3 = zeros(length(filelist),3);
RH_index4 = zeros(length(filelist),3);
RH_mid1 = zeros(length(filelist),3);
RH_mid2 = zeros(length(filelist),3);
RH_mid3 = zeros(length(filelist),3);
RH_mid4 = zeros(length(filelist),3);
RH_ring1 = zeros(length(filelist),3);
RH_ring2 = zeros(length(filelist),3);
RH_ring3 = zeros(length(filelist),3);
RH_ring4 = zeros(length(filelist),3);
RH_pinky1 = zeros(length(filelist),3);
RH_pinky2 = zeros(length(filelist),3);
RH_pinky3 = zeros(length(filelist),3);
RH_pinky4 = zeros(length(filelist),3);

LH_wrist = zeros(length(filelist),3);
LH_thumb1 = zeros(length(filelist),3);
LH_thumb2 = zeros(length(filelist),3);
LH_thumb3 = zeros(length(filelist),3);
LH_index1 = zeros(length(filelist),3);
LH_index2 = zeros(length(filelist),3);
LH_index3 = zeros(length(filelist),3);
LH_index4 = zeros(length(filelist),3);
LH_mid1 = zeros(length(filelist),3);
LH_mid2 = zeros(length(filelist),3);
LH_mid3 = zeros(length(filelist),3);
LH_mid4 = zeros(length(filelist),3);
LH_ring1 = zeros(length(filelist),3);
LH_ring2 = zeros(length(filelist),3);
LH_ring3 = zeros(length(filelist),3);
LH_ring4 = zeros(length(filelist),3);
LH_pinky1 = zeros(length(filelist),3);
LH_pinky2 = zeros(length(filelist),3);
LH_pinky3 = zeros(length(filelist),3);
LH_pinky4 = zeros(length(filelist),3);


%% Get the coordinates of the joints

for i=1:length(filelist)
    
    fullFileName = fullfile(workfolder, filelist(i).name);
    
    [head_, Reye_, Rear_, Leye_, Lear_, chest_, Rshoulder_, Relbow_, Rwrist_, Lshoulder_, Lelbow_, Lwrist_,...
    midhip_, Rhip_, Lhip_, Rknee_, Lknee_, RH_wrist_, RH_thumb1_, RH_thumb2_, RH_thumb3_,...
    RH_index1_, RH_index2_, RH_index3_, RH_index4_, RH_mid1_, RH_mid2_, RH_mid3_, RH_mid4_,...
    RH_ring1_, RH_ring2_, RH_ring3_, RH_ring4_, RH_pinky1_, RH_pinky2_, RH_pinky3_,...
    RH_pinky4_, LH_wrist_, LH_thumb1_, LH_thumb2_, LH_thumb3_, LH_index1_, LH_index2_, LH_index3_,...
    LH_index4_, LH_mid1_, LH_mid2_, LH_mid3_, LH_mid4_, LH_ring1_, LH_ring2_, LH_ring3_,...
    LH_ring4_, LH_pinky1_, LH_pinky2_, LH_pinky3_, LH_pinky4_] = json2pose2D(fullFileName);
    

    head(i, :) = head_;
    Reye(i, :) = Reye_;
    Rear(i, :) = Rear_;
    Leye(i, :) = Leye_;
    Lear(i, :) = Lear_;
    
    chest(i, :) = chest_;
    Rshoulder(i, :) = Rshoulder_;
    Relbow(i, :) = Relbow_;
    Rwrist(i, :) = Rwrist_;
    Lshoulder(i, :) = Lshoulder_;
    Lelbow(i, :) = Lelbow_;
    Lwrist(i, :) = Lwrist_;
    midhip(i, :) = midhip_;
    Rhip(i, :) = Rhip_;
    Lhip(i, :) = Lhip_;
    Rknee(i, :) = Rknee_;
    Lknee(i, :) = Lknee_;
    
    RH_wrist(i, :) = RH_wrist_;
    RH_thumb1(i, :) = RH_thumb1_;
    RH_thumb2(i, :) = RH_thumb2_;
    RH_thumb3(i, :) = RH_thumb3_;
    RH_index1(i, :) = RH_index1_;
    RH_index2(i, :) = RH_index2_;
    RH_index3(i, :) = RH_index3_;
    RH_index4(i, :) = RH_index4_;
    RH_mid1(i, :) = RH_mid1_;
    RH_mid2(i, :) =	RH_mid2_;
    RH_mid3(i, :) =	RH_mid3_;
    RH_mid4(i, :) =	RH_mid4_;
    RH_ring1(i, :) = RH_ring1_;
    RH_ring2(i, :) = RH_ring2_;
    RH_ring3(i, :) = RH_ring3_;
    RH_ring4(i, :) = RH_ring4_;
    RH_pinky1(i, :) = RH_pinky1_;
    RH_pinky2(i, :) = RH_pinky2_;
    RH_pinky3(i, :) = RH_pinky3_;
    RH_pinky4(i, :) = RH_pinky4_;
    
    LH_wrist(i, :) = LH_wrist_;
    LH_thumb1(i, :) = LH_thumb1_;
    LH_thumb2(i, :) = LH_thumb2_;
    LH_thumb3(i, :) = LH_thumb3_;
    LH_index1(i, :) = LH_index1_;
    LH_index2(i, :) = LH_index2_;
    LH_index3(i, :) = LH_index3_;
    LH_index4(i, :) = LH_index4_;
    LH_mid1(i, :) =	LH_mid1_;
    LH_mid2(i, :) =	LH_mid2_;
    LH_mid3(i, :) =	LH_mid3_;
    LH_mid4(i, :) =	LH_mid4_;
    LH_ring1(i, :) = LH_ring1_;
    LH_ring2(i, :) = LH_ring2_;
    LH_ring3(i, :) = LH_ring3_;
    LH_ring4(i, :) = LH_ring4_;
    LH_pinky1(i, :) = LH_pinky1_;
    LH_pinky2(i, :) = LH_pinky2_;
    LH_pinky3(i, :) = LH_pinky3_;
    LH_pinky4(i, :) = LH_pinky4_;
    
end


%% Interpolate the missing values and values below the threshold confidence score

head = interpolate2D(head);
Reye = interpolate2D(Reye);
Rear = interpolate2D(Rear);
Leye = interpolate2D(Leye);
Lear = interpolate2D(Lear);

chest = interpolate2D(chest);
Rshoulder = interpolate2D(Rshoulder);
Relbow = interpolate2D(Relbow);
Rwrist = interpolate2D(Rwrist);
Lshoulder = interpolate2D(Lshoulder);
Lelbow = interpolate2D(Lelbow);
Lwrist = interpolate2D(Lwrist);
midhip = interpolate2D(midhip);
Rhip = interpolate2D(Rhip);
Lhip = interpolate2D(Lhip);
Rknee = interpolate2D(Rknee);
Lknee = interpolate2D(Lknee);

RH_wrist = interpolate2D(RH_wrist);
RH_thumb1 = interpolate2D(RH_thumb1);
RH_thumb2 = interpolate2D(RH_thumb2);
RH_thumb3 = interpolate2D(RH_thumb3);
RH_index1 = interpolate2D(RH_index1);
RH_index2 = interpolate2D(RH_index2);
RH_index3 = interpolate2D(RH_index3);
RH_index4 = interpolate2D(RH_index4);
RH_mid1 = interpolate2D(RH_mid1);
RH_mid2 = interpolate2D(RH_mid2);
RH_mid3 = interpolate2D(RH_mid3);
RH_mid4 = interpolate2D(RH_mid4);
RH_ring1 = interpolate2D(RH_ring1);
RH_ring2 = interpolate2D(RH_ring2);
RH_ring3 = interpolate2D(RH_ring3);
RH_ring4 = interpolate2D(RH_ring4);
RH_pinky1 = interpolate2D(RH_pinky1);
RH_pinky2 = interpolate2D(RH_pinky2);
RH_pinky3 = interpolate2D(RH_pinky3);
RH_pinky4 = interpolate2D(RH_pinky4);

LH_wrist = interpolate2D(LH_wrist);
LH_thumb1 = interpolate2D(LH_thumb1);
LH_thumb2 = interpolate2D(LH_thumb2);
LH_thumb3 = interpolate2D(LH_thumb3);
LH_index1 = interpolate2D(LH_index1);
LH_index2 = interpolate2D(LH_index2);
LH_index3 = interpolate2D(LH_index3);
LH_index4 = interpolate2D(LH_index4);
LH_mid1 = interpolate2D(LH_mid1);
LH_mid2 = interpolate2D(LH_mid2);
LH_mid3 = interpolate2D(LH_mid3);
LH_mid4 = interpolate2D(LH_mid4);
LH_ring1 = interpolate2D(LH_ring1);
LH_ring2 = interpolate2D(LH_ring2);
LH_ring3 = interpolate2D(LH_ring3);
LH_ring4 = interpolate2D(LH_ring4);
LH_pinky1 = interpolate2D(LH_pinky1);
LH_pinky2 = interpolate2D(LH_pinky2);
LH_pinky3 = interpolate2D(LH_pinky3);
LH_pinky4 = interpolate2D(LH_pinky4);


end