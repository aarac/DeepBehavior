function [nAnB, nAtB, nBtA] = distance_calc(mouseA, mouseB, noseA, noseB, ...
    tailA, tailB)

nAnB= zeros(length(mouseA),1); % noseA to noseB
nAtB= zeros(length(mouseA),1); % noseA to tailB
nBtA= zeros(length(mouseA),1); % noseB to tailA
bars= zeros(length(mouseA),1);

for i =1:length(mouseA)
    if distAB(i)<210
        if noseA(i)~=0 && noseB(i)~=0
            nAnB(i) = pdist([noseA(i,:);noseB(i,:)],'euclidean');
        end
        if noseA(i)~=0 && tailB(i)~=0
            nAtB(i) = pdist([noseA(i,:);tailB(i,:)],'euclidean');
        end
        if noseB(i)~=0 && tailA(i)~=0
            nBtA(i) = pdist([noseB(i,:);tailA(i,:)],'euclidean');
        end
        bars(i)=1200; % height of the bar
    else
        bars(i)=NaN;
    end
end
        
nAnB(nAnB==0)=NaN;
nAtB(nAtB==0)=NaN;
nBtA(nBtA==0)=NaN;

end