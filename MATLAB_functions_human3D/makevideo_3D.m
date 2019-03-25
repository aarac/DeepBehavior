function [] = makevideo_3D(poses_3D, videofilename, track, min_az, max_az, el)

%% This function makes video of 3D skeleton of human performing motor tasks.

% Inputs:
%     videofilename: video file name
%     poses_3D: pose positions in a cell
%     track: the joint to be tracked.
%     min_az, max_az: minimum and maxium rotation angles
%     el: tilt angle
%     
% Outputs:
%    makes a video
%     
% Written by: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA

v_out = VideoWriter(videofilename);
open(v_out);
startframe = 1;
stopframe = length(poses_3D.head);
direction = [1 0 0];

trajectory = getfield(poses_3D,track);

for i = startframe:stopframe
    
    % plot the body and hand joint positions
    bodyplot3D(i, poses_3D);grid on;hold on;
    handplot3D('RH', i, poses_3D);grid on;hold on;
    handplot3D('LH', i, poses_3D);grid on; hold on;

    % plot the trajectory of the Rwrist
%     plot3(trajectory(startframe:i,1),trajectory(startframe:i,2),...
%         trajectory(startframe:i,3), 'LineWidth', 3); grid on
%     hold on;
    
    % set background color
    set(gca,'color',[0 0 0])
    ax=gca;
    ax.GridColor=[1 1 1];
    
    % axis limits
%     ylim([1000 2500]);
%     xlim([-800 400]);
%     zlim([-600 400]);
    ylim([800 2000]);
    xlim([-400 500]);
    zlim([-600 400]);
    
% view angle settings
    az = (((max_az-min_az)/2)*sin(i/45) + max_az-((max_az-min_az)/2));
    view(az, el);
    
    % legends
    title('3D Human Pose');
    xlabel('Distance (mm)');
    ylabel('Distance (mm)');
    zlabel('Distance (mm)');
     
    hold off
    frame = getframe(gcf); hold on;
%     insertText(frame,[500 500],'test text');
    writeVideo(v_out,frame);
    pause(0.0000000001)
    clf
end

close (v_out);




end