%% This script goes through the analysis worflow for two socially
% interacting mice.

% It extracts the coordinates of body, head, nose and tail positions for
% two mice and then assigns them to each mice. It calculates and plots
% their velocities. It then calculates the interactions between two mice, 
% plots the interaction epochs, then finally creates a video of the whole
% interaction.

clear; clc;

%% extract the bounding box and center coordinates of the body parts.

filename = 'FILENAME.txt'; % This will be the output .txt file from YOLO.

% extract bounding box coordinates for the body parts
[body,nose,head,tail,body_mini,nose_mini,head_mini,tail_mini]=coor_extract2(filename);

% find the center positions of the bounding boxes for different body parts
[body_centers,nose_centers, head_centers, tail_centers, ...
    body_mini_centers,nose_mini_centers, head_mini_centers, tail_mini_centers]=...
    center_finder2(body, head, nose, tail,body_mini, head_mini, nose_mini, tail_mini);

[body_centers, body_mini_centers] = removebigBB(body_centers,...
    body_mini_centers, body, body_mini);

%% assign each mouse the body coordinates
[mouseA, mouseB] = assign_mini2_mice(body_centers, body_mini_centers);

% Plot each mouse's path trajectories.
figure; 
plot(mouseA(:,1),mouseA(:,2),'Color',[0 0.9 0.3],'LineWidth',1);hold on;...
    plot(mouseB(:,1),mouseB(:,2),'Color',[0.9 0 0.3],'LineWidth',1)

%% calculate the velocities of mouse A and mouse B throughout the session.

[velA, velB] = velocitycalc(mouseA, mouseB);

% plot the velocty curves for each mouse.
figure
subplot(2,1,1); plot(velA,'Color',[0 0.9 0.3]); ylim([0 1400]);hold on
subplot(2,1,2); plot(velB,'Color',[0.9 0 0.3]);ylim([0 1400])


%% Assign tails, heads and noses

[tailA, tailB, headA, headB, noseA, noseB] = ...
    parts_assign(tail_centers, tail_mini_centers, head_centers, ...
    head_mini_centers, nose_centers, nose_mini_centers);

%% Calculate nose to nose and nose to tail distances

[nAnB, nAtB, nBtA] = distance_calc(mouseA, mouseB, noseA, noseB, ...
    tailA, tailB);

a= ; %assign a number where you would like to plot the interaction start frame #
b= ; %assign a number where you would like to plot the interaction stop frame #
figure; plot(nAnB(a:b,:),'LineWidth',3); hold on; plot(nAtB(a:b,:),'LineWidth',3);...
    hold on;plot(nBtA(a:b,:),'LineWidth',3);
ylim([ ]) % put appropriate values
xlim([ ]) %put appropriate values
legend('a','b','c')


%% plot the distance between two mice with interactions in orange

plot_interactions(mouseA, mouseB);


%% Loop through the image sequence, load each image, and then write it to the video.
output_video_name='OUTPUTVIDEONAME.avi';

workingDirside = 'IMAGEFOLDERDIRECTORY';

make_video_social(output_video_name,workingDirside,mouseA, mouseB,...
    headA, headB, noseA, noseB, tailA, tailB)



