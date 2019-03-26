function [mouseA, mouseB] = fix_misslabels(mouseA, mouseB)

% fix the inappropriate assignment by comparing the differential of the
% distance graph.
% Please evaluate whether to use this or not case by case.


[dist_diffA, dist_diffB] = dist_diff(mouseA,mouseB);


distAB=zeros(length(mouseB),1);
for i=1:length(mouseA)
    distAB(i)= pdist([mouseA(i,:);mouseB(i,:)],'euclidean');
end

i=1;
while i<length(distAB)
    k=i+1;
    if distAB(i)<23
        while dist_diffB(k)<50
            k=k+1;
        end
        mouseA(i-3:k+1,:) = 0;
        mouseB(i-3:k+1,:) = 0;
    end
    i=k;
end

mouseA(mouseA==0)=NaN;
mouseB(mouseB==0)=NaN;

mouseA(:,1)=fillmissing(mouseA(:,1),'linear', 1);
mouseA(:,2)=fillmissing(mouseA(:,2),'linear', 1);

mouseB(:,1)=fillmissing(mouseB(:,1),'linear', 1);
mouseB(:,2)=fillmissing(mouseB(:,2),'linear', 1);


[dist_diffA, dist_diffB] = dist_diff(mouseA,mouseB);


idxA=find(dist_diffA>50);
len_idxA=length(idxA)/2;

for i=1:len_idxA
    mouseA_rep=mouseA((idxA(2*(i-1)+1)+2):(idxA(2*(i-1)+2)+1),:);
    mouseB_rep=mouseB((idxA(2*(i-1)+1)+2):(idxA(2*(i-1)+2)+1),:);
    mouseA((idxA(2*(i-1)+1)+2):(idxA(2*(i-1)+2)+1),:) = mouseB_rep;
    mouseB((idxA(2*(i-1)+1)+2):(idxA(2*(i-1)+2)+1),:) = mouseA_rep;
end



[dist_diffA, dist_diffB] = dist_diff(mouseA,mouseB);

idxA=find(dist_diffA>50);
idxB=find(dist_diffB>50);

for i=1:length(idxA)
    mouseA(idxA(i)+2,:)=0;
end

for i=1:length(idxB)
    mouseB(idxB(i)+2,:)=0;
end
    
mouseA(mouseA==0)=NaN;
mouseB(mouseB==0)=NaN;
mouseA(:,1)=fillmissing(mouseA(:,1),'linear', 1);
mouseA(:,2)=fillmissing(mouseA(:,2),'linear', 1);
mouseB(:,1)=fillmissing(mouseB(:,1),'linear', 1);
mouseB(:,2)=fillmissing(mouseB(:,2),'linear', 1);



end
       