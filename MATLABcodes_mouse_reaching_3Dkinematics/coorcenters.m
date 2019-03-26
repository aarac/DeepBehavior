function centers = coorcenters(variable)
% centers = coorcenters(filename)
% This function calculates the center points of the bounding boxes. It
% outputs a matrix with x and y coordinates of the centers of the boxes.

% author: Ahmet Arac (aarac <at> mednet.ucla.edu)
% created on: 11/03/2017
%
% input: table created by json2table function.
%
% output: a table with row names as frame names, and the columns of
% coordiantes and scores.
% 
% Requirements: JSONLAB toolbox from matlab.

A = variable; % This will be the table from the json2table function.

X = zeros(height(A),2);

% If there is no bbox detection, assign the coordinates for that frame 
% as the average of the coordinates of the two neighbors (one before,
% one after).
for i = drange(1, height(A))
    if A{i,{'score'}} == 0 
        A{i,{'x1'}} = (A{i+1,{'x1'}} + A{i-1,{'x1'}})/2;
        A{i,{'y1'}} = (A{i+1,{'y1'}} + A{i-1,{'y1'}})/2;
        A{i,{'x2'}} = (A{i+1,{'x2'}} + A{i-1,{'x2'}})/2;
        A{i,{'y2'}} = (A{i+1,{'y2'}} + A{i-1,{'y2'}})/2;
    end

    X(i,1) = (A{i,{'x2'}} + A{i,{'x1'}})/2;
    X(i,2) = (A{i,{'y2'}} + A{i,{'y1'}})/2;
end

A_cent = X;

A_false = find(A{:,{'score'}}<scor_thresh); 

A_cent(A_false,:)=NaN;

A_cent(:,1)=fillmissing(A_cent(:,1),'linear', 1);
A_cent(:,2)=fillmissing(A_cent(:,2),'linear', 1);

centers = A_cent;

end