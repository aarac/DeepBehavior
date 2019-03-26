function [body_centers,nose_centers, head_centers, tail_centers, ...
    body_mini_centers,nose_mini_centers, head_mini_centers, tail_mini_centers]=...
    center_finder2(body, head, nose, tail,body_mini, head_mini, nose_mini, tail_mini)

% This function finds the center coordinate of the body positions from the
% bounding box coordinates.

% INPUT: body, head, nose and tail coordinates obtained from the
% coor_extract function.

% OUTPUT: center coordinates of the positions of different body parts.

% Created by: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA 
% September 09, 2018


body_coordinates = body;
nose_coordinates = nose;
head_coordinates = head;
tail_coordinates = tail;

body_mini_coordinates = body_mini;
nose_mini_coordinates = nose_mini;
head_mini_coordinates = head_mini;
tail_mini_coordinates = tail_mini;


for i=1:length(body)
    body_centers(i,1) = (body_coordinates(i,1)+body_coordinates(i,3))/2;
    body_centers(i,2) = (body_coordinates(i,2)+body_coordinates(i,4))/2;
    body_centers(i,3) = (body_coordinates(i,5)+body_coordinates(i,7))/2;
    body_centers(i,4) = (body_coordinates(i,6)+body_coordinates(i,8))/2;
    
    nose_centers(i,1) = (nose_coordinates(i,1)+nose_coordinates(i,3))/2;
    nose_centers(i,2) = (nose_coordinates(i,2)+nose_coordinates(i,4))/2;
    nose_centers(i,3) = (nose_coordinates(i,5)+nose_coordinates(i,7))/2;
    nose_centers(i,4) = (nose_coordinates(i,6)+nose_coordinates(i,8))/2;
    
    head_centers(i,1) = (head_coordinates(i,1)+head_coordinates(i,3))/2;
    head_centers(i,2) = (head_coordinates(i,2)+head_coordinates(i,4))/2;
    head_centers(i,3) = (head_coordinates(i,5)+head_coordinates(i,7))/2;
    head_centers(i,4) = (head_coordinates(i,6)+head_coordinates(i,8))/2;
    
    tail_centers(i,1) = (tail_coordinates(i,1)+tail_coordinates(i,3))/2;
    tail_centers(i,2) = (tail_coordinates(i,2)+tail_coordinates(i,4))/2;
    tail_centers(i,3) = (tail_coordinates(i,5)+tail_coordinates(i,7))/2;
    tail_centers(i,4) = (tail_coordinates(i,6)+tail_coordinates(i,8))/2;
    

    body_mini_centers(i,1) = (body_mini_coordinates(i,1)+body_mini_coordinates(i,3))/2;
    body_mini_centers(i,2) = (body_mini_coordinates(i,2)+body_mini_coordinates(i,4))/2;
    body_mini_centers(i,3) = (body_mini_coordinates(i,5)+body_mini_coordinates(i,7))/2;
    body_mini_centers(i,4) = (body_mini_coordinates(i,6)+body_mini_coordinates(i,8))/2;
    
    nose_mini_centers(i,1) = (nose_mini_coordinates(i,1)+nose_mini_coordinates(i,3))/2;
    nose_mini_centers(i,2) = (nose_mini_coordinates(i,2)+nose_mini_coordinates(i,4))/2;
    nose_mini_centers(i,3) = (nose_mini_coordinates(i,5)+nose_mini_coordinates(i,7))/2;
    nose_mini_centers(i,4) = (nose_mini_coordinates(i,6)+nose_mini_coordinates(i,8))/2;
    
    head_mini_centers(i,1) = (head_mini_coordinates(i,1)+head_mini_coordinates(i,3))/2;
    head_mini_centers(i,2) = (head_mini_coordinates(i,2)+head_mini_coordinates(i,4))/2;
    head_mini_centers(i,3) = (head_mini_coordinates(i,5)+head_mini_coordinates(i,7))/2;
    head_mini_centers(i,4) = (head_mini_coordinates(i,6)+head_mini_coordinates(i,8))/2;
    
    tail_mini_centers(i,1) = (tail_mini_coordinates(i,1)+tail_mini_coordinates(i,3))/2;
    tail_mini_centers(i,2) = (tail_mini_coordinates(i,2)+tail_mini_coordinates(i,4))/2;
    tail_mini_centers(i,3) = (tail_mini_coordinates(i,5)+tail_mini_coordinates(i,7))/2;
    tail_mini_centers(i,4) = (tail_mini_coordinates(i,6)+tail_mini_coordinates(i,8))/2;    
    
    
end