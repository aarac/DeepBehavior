 function [mouseA, mouseB] = assign4_mice(mouseA,mouseB,mouse1,mouse2)

 %% This function assigns the new detected mouse positions comparing them 
 % to the previous frame.
 
 
 
i=length(mouseA)+1;

if mouseA(i-1,1)~=0 && mouseB(i-1,1)~=0
    dist1A = pdist([mouseA(i-1,:);mouse1],'euclidean');
    dist1B = pdist([mouseB(i-1,:);mouse1],'euclidean');
    dist2A = pdist([mouseA(i-1,:);mouse2],'euclidean');
    dist2B = pdist([mouseB(i-1,:);mouse2],'euclidean');

    if dist1A>dist1B && dist2B>dist2A
        mouseA = [mouseA; mouse2];
        mouseB = [mouseB; mouse1];

    elseif dist1A<dist1B && dist2B<dist2A
        mouseA = [mouseA; mouse1];
        mouseB = [mouseB; mouse2];
    end
end

if mouseA(i-1,1)~=0 && mouseB(i-1,1)==0
    dist1A = pdist([mouseA(i-1,:);mouse1],'euclidean');
    dist2A = pdist([mouseA(i-1,:);mouse2],'euclidean');

    if dist1A>dist2A
        mouseA = [mouseA; mouse2];
        mouseB = [mouseB; mouse1];
    elseif dist1A<dist2A 
        mouseA = [mouseA; mouse1];
        mouseB = [mouseB; mouse2];
    end
end

if mouseA(i-1,1)==0 && mouseB(i-1,1)~=0
    dist1B = pdist([mouseB(i-1,:);mouse1],'euclidean');
    dist2B = pdist([mouseB(i-1,:);mouse2],'euclidean');

    if dist1B>dist2B
        mouseA = [mouseA; mouse1];
        mouseB = [mouseB; mouse2];
    elseif dist1B<dist2B 
        mouseA = [mouseA; mouse2];
        mouseB = [mouseB; mouse1];
    end
end

if mouseA(i-1,1)==0 && mouseB(i-1,1)==0
    mouseA_new=mouseA;
    idx= mouseA_new<0.1;
    mouseA_new(idx)=NaN;
    mouseA_new = reshape(mouseA_new, [], 2);

    mouseB_new=mouseB;
    idx= mouseB_new<0.1;
    mouseB_new(idx)=NaN;
    mouseB_new = reshape(mouseB_new, [], 2);            

    A = ~isnan(mouseA_new(:,1));
    IndicesA = arrayfun(@(x) find(A(:, x), 1, 'last'), 1:size(mouseA_new(:,1), 2));

    B = ~isnan(mouseB_new(:,1));
    IndicesB = arrayfun(@(x) find(B(:, x), 1, 'last'), 1:size(mouseB_new(:,1), 2));

    if IndicesA==IndicesB
        dist1A = pdist([mouseA(IndicesA,:);mouse1],'euclidean');
        dist1B = pdist([mouseB(IndicesB,:);mouse1],'euclidean');
        dist2A = pdist([mouseA(IndicesA,:);mouse2],'euclidean');
        dist2B = pdist([mouseB(IndicesB,:);mouse2],'euclidean');

        if dist1A>dist1B && dist2B>dist2A
            mouseA = [mouseA; mouse2];
            mouseB = [mouseB; mouse1];

        elseif dist1A<dist1B && dist2B<dist2A
            mouseA = [mouseA; mouse1];
            mouseB = [mouseB; mouse2];
        end

    elseif IndicesA>IndicesB
        dist1A = pdist([mouseA(IndicesA,:);mouse1],'euclidean');
        dist2A = pdist([mouseA(IndicesA,:);mouse2],'euclidean');

        if dist1A>dist2A
            mouseA = [mouseA; mouse2];
            mouseB = [mouseB; mouse1];
        elseif dist1A<dist2A 
            mouseA = [mouseA; mouse1];
            mouseB = [mouseB; mouse2];
        end

    elseif IndicesB>IndicesA
        dist1B = pdist([mouseB(IndicesB,:);mouse1],'euclidean');
        dist2B = pdist([mouseB(IndicesB,:);mouse2],'euclidean');

        if dist1B>dist2B
            mouseA = [mouseA; mouse1];
            mouseB = [mouseB; mouse2];
        elseif dist1B<dist2B 
            mouseA = [mouseA; mouse2];
            mouseB = [mouseB; mouse1];
        end
    end

end
end
