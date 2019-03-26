function [velA, velB] = velocitycalc(mouseA, mouseB)

velA=zeros(length(mouseA)-1,1);
velB=zeros(length(mouseB)-1,1);

for i=1:(length(mouseA)-1)
    velA(i) = pdist([mouseA(i,:);mouseA(i+1,:)],'euclidean')/(1/30);
    velB(i) = pdist([mouseB(i,:);mouseB(i+1,:)],'euclidean')/(1/30);
end

end

