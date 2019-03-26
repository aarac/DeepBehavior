function make_video_social(output_video_name,workingDirside,mouseA, mouseB,...
    headA, headB, noseA, noseB, tailA, tailB)


currentFolder = cd;
outputVideo = VideoWriter(fullfile(currentFolder, output_video_name));
outputVideo.FrameRate = 20;
open(outputVideo)

imageNamesside = dir(fullfile(workingDirside,'*.png'));
imageNamesside = {imageNamesside.name}';

distAB=zeros(length(mouseB),1);
for i=1:length(mouseA)
    distAB(i)= pdist([mouseA(i,:);mouseB(i,:)],'euclidean');
end

for i = start:stop
    [rgbImageside StoredColorMapside]  = imread(fullfile(workingDirside,imageNamesside{i}));
    
    % define the coordinates by pulling them from the coordinates tables.
    body1 = [mouseA(i,1) (mouseA(i,2)) 10]; 
    head1 = [headA(i, 1) (headA(i, 2)) 5]; 
    nose1 = [noseA(i,1) (noseA(i,2)) 2]; 
    tail1 = [tailA(i, 1) (tailA(i,2)) 3]; 
   
    body2 = [mouseB(i,1) (mouseB(i,2)) 10]; 
    head2 = [headB(i, 1) (headB(i, 2)) 5]; 
    nose2 = [noseB(i,1) (noseB(i,2)) 2]; 
    tail2 = [tailB(i, 1) (tailB(i,2)) 3]; 
    
    % insert the circles on the corresponding video frames.
    Img = insertShape(rgbImageside,'Circle',body1,'LineWidth',5, 'Color','green');
    Img = insertShape(Img, 'Circle', body2, 'LineWidth',5, 'Color','red');

    if distAB(i)<200
       % Img = insertShape(SidedetectedImg, 'Circle', head1, 'LineWidth',5, 'Color','green');
        Img = insertShape(Img, 'Circle', nose1, 'LineWidth',5, 'Color','green');
        Img = insertShape(Img, 'Circle', tail1, 'LineWidth',5, 'Color','green');    

        % Img = insertShape(SidedetectedImg, 'Circle', head2, 'LineWidth',5, 'Color','red');
        Img = insertShape(Img, 'Circle', nose2, 'LineWidth',5, 'Color','red');
        Img = insertShape(Img, 'Circle', tail2, 'LineWidth',5, 'Color','red');   
    end

    writeVideo(outputVideo,Img)
end


close(outputVideo);