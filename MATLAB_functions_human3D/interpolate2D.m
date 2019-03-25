function filename_new = interpolate2D(filename)
%% This function interpolates the gaps in the positions based on the values
% before and after the the gap.

% Input: 
%        filename = coordinates of nose/head/tail positions for a mouse, 

% Output:
%        filename_new = the new matrix of coordinates of positions in the 
%                       filename matrix.

% Created by Ahmet Arac, UCLA, Los Angeles, CA


%%
filename(filename(:,1:3)==0)=NaN; % tag the zero values as NaN

threshold = mean(filename(:,3),'omitnan') - 3*std(filename(:,3),'omitnan'); % calculate the threshold
% as "not appropriately" detected confidence score threshold (mean -  3*SD).

filename_false = find(filename(:,3)<threshold);  % find the indices of the frames with confidence 
% scores less than threshold.

% assign NaN to the values of those detected less than threshold
for i=1:length(filename_false)
    filename(filename_false(i),1:2)=NaN;
end

% interpolate all the missing values
filename_new = fillmissing(filename,'linear',1);

filename_new = filename_new(:,1:2);

end