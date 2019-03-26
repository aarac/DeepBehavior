function sTable = json2table(filename)

% sTable = json2table(filename)
% 
% author: Ahmet Arac (aarac <at> mednet.ucla.edu)
% created on: 11/03/2017
%
% input: json file obtained from python code after detecting the coordinates and
% the scores of the predicted bounding boxes. The structure is cells of
% frame names as "pict%05d.png", and the coordinates of y2, x1, x2, y2, and
% score.
%
% output: a table with row names as frame names, and the columns of
% coordiantes and scores.
% 
% Requirements: JSONLAB toolbox from matlab.

A = loadjson(filename); % load the file
A= A.'; % transpose it so that frames are in the rows

C = cell2mat(A);

% Assign each cell structure appropriately to the 
X = zeros(length(C),length(struct2array(cell2mat(C(1).coordinates))));
for i = drange(1:length(C))
    X(i, :) = struct2array(cell2mat(C(i).coordinates));
end

rowNames = {C.frame_number}.';
colNames = {'y1','x2','x1', 'y2', 'score'};
sTable = array2table(X,'RowNames',rowNames,'VariableNames',colNames);

end