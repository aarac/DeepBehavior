function [body_centers, body_mini_centers] = removebigBB(body_centers,...
    body_mini_centers, body, body_mini)

%% This function removes very large bounding boxes. These usually happens
% when two mice are very close to each other and the algorithm may detect
% them as one with one bounding box.
% Depending on the application, this function may need to be modified,
% especially the variable S (Bounding box area).

% Author: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA

for i=1:length(body)
    S = BB_area(i, body, 1);
    if S>30000
        body_centers(i,1:2)=[0 0];
    end
    
    S = BB_area(i, body, 2);
    if S>30000
        body_centers(i,3:4)=[0 0];
    end
    
    S = BB_area(i, body_mini, 1);
    if S>30000
        body_mini_centers(i,1:2)=[0 0];
    end
    
    S = BB_area(i, body_mini, 2);
    if S>30000
        body_mini_centers(i,3:4)=[0 0];
    end
end


for i=1:length(body)
    if body_centers(i,1)==0 && body_centers(i,3)~=0
        body_centers(i,1:2)=body_centers(i,3:4);
        body_centers(i,3:4)=[0 0];
    end
    
    if body_mini_centers(i,1)==0 && body_mini_centers(i,3)~=0
        body_mini_centers(i,1:2)=body_mini_centers(i,3:4);
        body_mini_centers(i,3:4)=[0 0];
    end
end

end
