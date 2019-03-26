function [body,nose,head,tail,body_mini,nose_mini,head_mini,tail_mini]=coor_extract2(filename)

% This function extracts the body, nose, head and tail coordinates of
% bounding boxes for these body positions from the text file that is
% obtained from the YOLO network.

% INPUT: text file name
% OUTPUT: coordinates that are detected 

% Created by: Ahmet Arac, UCLA, Los Angeles, CA 
% September 09, 2018

[BoundingBox,Left,Top,Right,Bottom] = import_txt(filename);

frameindex = find(ismember(BoundingBox,'Objects'));

% check if there are any bodies detected 
body_coordinates = zeros(length(frameindex),8);
nose_coordinates = zeros(length(frameindex),8);
head_coordinates = zeros(length(frameindex),8);
tail_coordinates = zeros(length(frameindex),8);

body_mini_coordinates = zeros(length(frameindex),8);
nose_mini_coordinates = zeros(length(frameindex),8);
head_mini_coordinates = zeros(length(frameindex),8);
tail_mini_coordinates = zeros(length(frameindex),8);


%% find body coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        body_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'body'));
    else
        body_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'body'));
    end
    
    if length(body_index)~=0
        body_coordinates(i,1)=Left(body_index(1));
        body_coordinates(i,2)=Top(body_index(1));
        body_coordinates(i,3)=Right(body_index(1));
        body_coordinates(i,4)=Bottom(body_index(1));
    end
    
    if length(body_index)>1
        body_coordinates(i,5)=Left(body_index(2));
        body_coordinates(i,6)=Top(body_index(2));
        body_coordinates(i,7)=Right(body_index(2));
        body_coordinates(i,8)=Bottom(body_index(2));
    end
  
end

%% find body_mini coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        body_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'body_mini'));
    else
        body_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'body_mini'));
    end
    
    if length(body_index)~=0
        body_mini_coordinates(i,1)=Left(body_index(1));
        body_mini_coordinates(i,2)=Top(body_index(1));
        body_mini_coordinates(i,3)=Right(body_index(1));
        body_mini_coordinates(i,4)=Bottom(body_index(1));
    end
    
    if length(body_index)>1
        body_mini_coordinates(i,5)=Left(body_index(2));
        body_mini_coordinates(i,6)=Top(body_index(2));
        body_mini_coordinates(i,7)=Right(body_index(2));
        body_mini_coordinates(i,8)=Bottom(body_index(2));
    end
  
end
%% find nose coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        nose_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'nose'));
    else
        nose_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'nose'));
    end
    
    if length(nose_index)~=0
        nose_coordinates(i,1)=Left(nose_index(1));
        nose_coordinates(i,2)=Top(nose_index(1));
        nose_coordinates(i,3)=Right(nose_index(1));
        nose_coordinates(i,4)=Bottom(nose_index(1));
    end
    
    if length(nose_index)>1
        nose_coordinates(i,5)=Left(nose_index(2));
        nose_coordinates(i,6)=Top(nose_index(2));
        nose_coordinates(i,7)=Right(nose_index(2));
        nose_coordinates(i,8)=Bottom(nose_index(2));
    end
  
end

%% find nose_mini coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        nose_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'nose_mini'));
    else
        nose_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'nose_mini'));
    end
    
    if length(nose_index)~=0
        nose_mini_coordinates(i,1)=Left(nose_index(1));
        nose_mini_coordinates(i,2)=Top(nose_index(1));
        nose_mini_coordinates(i,3)=Right(nose_index(1));
        nose_mini_coordinates(i,4)=Bottom(nose_index(1));
    end
    
    if length(nose_index)>1
        nose_mini_coordinates(i,5)=Left(nose_index(2));
        nose_mini_coordinates(i,6)=Top(nose_index(2));
        nose_mini_coordinates(i,7)=Right(nose_index(2));
        nose_mini_coordinates(i,8)=Bottom(nose_index(2));
    end
  
end

%% find head coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        head_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'head'));
    else
        head_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'head'));
    end
    
    if length(head_index)~=0
        head_coordinates(i,1)=Left(head_index(1));
        head_coordinates(i,2)=Top(head_index(1));
        head_coordinates(i,3)=Right(head_index(1));
        head_coordinates(i,4)=Bottom(head_index(1));
    end
    
    if length(head_index)>1
        head_coordinates(i,5)=Left(head_index(2));
        head_coordinates(i,6)=Top(head_index(2));
        head_coordinates(i,7)=Right(head_index(2));
        head_coordinates(i,8)=Bottom(head_index(2));
    end
  
end

%% find head_mini coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        head_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'head_mini'));
    else
        head_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'head_mini'));
    end
    
    if length(head_index)~=0
        head_mini_coordinates(i,1)=Left(head_index(1));
        head_mini_coordinates(i,2)=Top(head_index(1));
        head_mini_coordinates(i,3)=Right(head_index(1));
        head_mini_coordinates(i,4)=Bottom(head_index(1));
    end
    
    if length(head_index)>1
        head_mini_coordinates(i,5)=Left(head_index(2));
        head_mini_coordinates(i,6)=Top(head_index(2));
        head_mini_coordinates(i,7)=Right(head_index(2));
        head_mini_coordinates(i,8)=Bottom(head_index(2));
    end
  
end

%% find tail coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        tail_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'tail'));
    else
        tail_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'tail'));
    end
    
    if length(tail_index)~=0
        tail_coordinates(i,1)=Left(tail_index(1));
        tail_coordinates(i,2)=Top(tail_index(1));
        tail_coordinates(i,3)=Right(tail_index(1));
        tail_coordinates(i,4)=Bottom(tail_index(1));
    end
    
    if length(tail_index)>1
        tail_coordinates(i,5)=Left(tail_index(2));
        tail_coordinates(i,6)=Top(tail_index(2));
        tail_coordinates(i,7)=Right(tail_index(2));
        tail_coordinates(i,8)=Bottom(tail_index(2));
    end
  
end

%% find tail_mini coordinates

for i = 1:length(frameindex)
    
    if i<length(frameindex)
        tail_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):frameindex(i+1)),'tail_mini'));
    else
        tail_index = frameindex(i) + find(ismember(BoundingBox(frameindex(i):end),'tail_mini'));
    end
    
    if length(tail_index)~=0
        tail_mini_coordinates(i,1)=Left(tail_index(1));
        tail_mini_coordinates(i,2)=Top(tail_index(1));
        tail_mini_coordinates(i,3)=Right(tail_index(1));
        tail_mini_coordinates(i,4)=Bottom(tail_index(1));
    end
    
    if length(tail_index)>1
        tail_mini_coordinates(i,5)=Left(tail_index(2));
        tail_mini_coordinates(i,6)=Top(tail_index(2));
        tail_mini_coordinates(i,7)=Right(tail_index(2));
        tail_mini_coordinates(i,8)=Bottom(tail_index(2));
    end
  
end

%%

tail= tail_coordinates;
head= head_coordinates;
body= body_coordinates;
nose= nose_coordinates;

tail_mini= tail_mini_coordinates;
head_mini= head_mini_coordinates;
body_mini= body_mini_coordinates;
nose_mini= nose_mini_coordinates;
