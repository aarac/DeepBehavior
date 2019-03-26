function [tailA, tailB, headA, headB, noseA, noseB] = ...
    parts_assign(tail_centers, tail_mini_centers, head_centers, ...
    head_mini_centers, nose_centers, nose_mini_centers)

[tailA, tailB] = assign_mini2_mice(tail_centers, tail_mini_centers);
[headA, headB] = assign_mini2_mice(head_centers, head_mini_centers);
[noseA, noseB] = assign_mini2_mice(nose_centers, nose_mini_centers);

for i=1:length(noseA)
    if distAB(i)<200
        if noseA(i,1)==0
            noseA(i,:)=NaN;
        end
        if noseB(i,1)==0
            noseB(i,:)=NaN;
        end
        if tailA(i,1)==0
            tailA(i,:)=NaN;
        end
        if tailB(i,1)==0
            tailB(i,:)=NaN;
        end
    end
end


noseA(:,1)=fillmissing(noseA(:,1),'linear', 1);
noseA(:,2)=fillmissing(noseA(:,2),'linear', 1);
noseB(:,1)=fillmissing(noseB(:,1),'linear', 1);
noseB(:,2)=fillmissing(noseB(:,2),'linear', 1);

tailA(:,1)=fillmissing(tailA(:,1),'linear', 1);
tailA(:,2)=fillmissing(tailA(:,2),'linear', 1);
tailB(:,1)=fillmissing(tailB(:,1),'linear', 1);
tailB(:,2)=fillmissing(tailB(:,2),'linear', 1);

end