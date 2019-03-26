function [dist_diffA, dist_diffB] = dist_diff(mouseA,mouseB)




distA=zeros(length(mouseA)-1,1);
distB=zeros(length(mouseB)-1,1);

for i=1:(length(mouseA)-1)
    distA(i) = pdist([mouseA(i,:);mouseA(i+1,:)],'euclidean');
    distB(i) = pdist([mouseB(i,:);mouseB(i+1,:)],'euclidean');
end

dist_diffA=diff(distA);
dist_diffB=diff(distB);


end