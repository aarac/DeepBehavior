function [mouseA, mouseB] = assign_mini2_mice(body_centers,body_mini_centers)

%% This function assigns the detected mouse coordinates to individual mice
% for tracking each mouse. This will do it assuming there are two mice
% in the field of view.

% Important variable: kk is the frame number to start with.
% Please make sure that the first frame has body positions detected for both
% mice.



kk= 1;

body_centers_new = body_centers(kk:end,:);
body_mini_centers_new = body_mini_centers(kk:end,:);

body_centers_new(find(isnan(body_centers_new)))=0;
body_mini_centers_new(find(isnan(body_mini_centers_new)))=0;

% assign mice
mouseA(1,:)=body_centers_new(1,1:2);
mouseB(1,:)=body_mini_centers_new(1,1:2);



for i=2:length(body_centers_new)
    if body_centers_new(i,1) ~= 0 && body_mini_centers_new(i,1)~=0 && ...
            body_centers_new(i,3) ==0 && body_mini_centers_new(i,3)==0
        mouse1 = [body_centers_new(i,1), body_centers_new(i,2)];
        mouse2 = [body_mini_centers_new(i,1), body_mini_centers_new(i,2)];
        mouseA = [mouseA; mouse1];
        mouseB = [mouseB; mouse2];
    end
    
    
    if body_centers_new(i,1) ~= 0 && body_mini_centers_new(i,1)==0 && ...
            body_centers_new(i,3) ~=0
        mouse1 = [body_centers_new(i,1), body_centers_new(i,2)];
        mouse2 = [body_centers_new(i,3), body_centers_new(i,4)];
        [mouseA, mouseB] = assign4_mice(mouseA,mouseB,mouse1,mouse2);
    end
    
    
    if body_centers_new(i,1) == 0 && body_mini_centers_new(i,1)~=0 && ...
            body_mini_centers_new(i,3) ~=0
        mouse1 = [body_mini_centers_new(i,1), body_mini_centers_new(i,2)];
        mouse2 = [body_mini_centers_new(i,3), body_mini_centers_new(i,4)];        
        [mouseA, mouseB] = assign4_mice(mouseA,mouseB,mouse1,mouse2);
    end
    
    
    if body_centers_new(i,1) == 0 && body_mini_centers_new(i,1)~=0 && ...
            body_mini_centers_new(i,3) ==0
        mouse1 = [body_mini_centers_new(i,1), body_mini_centers_new(i,2)];        

        if mouseA(i-1,1)~=0 && mouseB(i-1,1)~=0
            dist1A = pdist([mouseA(i-1,:);mouse1],'euclidean');
            dist1B = pdist([mouseB(i-1,:);mouse1],'euclidean');
            if dist1A>dist1B
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; mouse1];
            elseif dist1B>dist1A 
                mouseA = [mouseA; mouse1];
                mouseB = [mouseB; 0 0];
            end
        end

        if mouseA(i-1,1)~=0 && mouseB(i-1,1)==0
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; 0 0];
        end

        if mouseA(i-1,1)==0 && mouseB(i-1,1)~=0
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; 0 0];
        end

        if mouseA(i-1,1)==0 && mouseB(i-1,1)==0
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; 0 0];
        end          
    end      
    
    
    if body_centers_new(i,1) ~= 0 && body_centers_new(i,3)==0 && ...
            body_mini_centers_new(i,1) ==0
        mouse1 = [body_centers_new(i,1), body_centers_new(i,2)];        
        
        if mouseA(i-1,1)~=0 && mouseB(i-1,1)~=0
            dist1A = pdist([mouseA(i-1,:);mouse1],'euclidean');
            dist1B = pdist([mouseB(i-1,:);mouse1],'euclidean');
            if dist1A>dist1B
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; mouse1];
            elseif dist1B>dist1A 
                mouseA = [mouseA; mouse1];
                mouseB = [mouseB; 0 0];
            end
        end

        if mouseA(i-1,1)~=0 && mouseB(i-1,1)==0
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; 0 0];
        end

        if mouseA(i-1,1)==0 && mouseB(i-1,1)~=0
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; 0 0];
        end

        if mouseA(i-1,1)==0 && mouseB(i-1,1)==0
                mouseA = [mouseA; 0 0];
                mouseB = [mouseB; 0 0];
        end          
    end
    
    
    if body_centers_new(i,1) == 0 && body_mini_centers_new(i,1) == 0
        mouseA = [mouseA; 0 0];
        mouseB = [mouseB; 0 0];
    end
    
    if length(mouseA)~=i
        mouseA = [mouseA; 0 0];
        mouseB = [mouseB; 0 0];
    end        
        
end

%% interpolate the missing values for each column of each mouse
% 
mouseA(mouseA==0)=NaN;
mouseB(mouseB==0)=NaN;

mouseA(:,1)=fillmissing(mouseA(:,1),'linear', 1);
mouseA(:,2)=fillmissing(mouseA(:,2),'linear', 1);

mouseB(:,1)=fillmissing(mouseB(:,1),'linear', 1);
mouseB(:,2)=fillmissing(mouseB(:,2),'linear', 1);


%fix the inappropriate assignment by comparing the differential of the distance graph
[mouseA, mouseB] = fix_misslabels(mouseA, mouseB);



end