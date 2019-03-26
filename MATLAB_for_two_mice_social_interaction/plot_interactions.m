function plot_interactions(mouseA, mouseB)

distAB=zeros(length(mouseB),1);
for i=1:length(mouseA)
    distAB(i)= pdist([mouseA(i,:);mouseB(i,:)],'euclidean');
end

lev=200;
x=1:1:length(distAB);
aboveline=(distAB>lev);

topline=distAB;
belowline=distAB;
topline(aboveline)=NaN;
belowline(~aboveline)=NaN;

distA=zeros(length(mouseA)-1,1);
distB=zeros(length(mouseB)-1,1);

figure;
plot(x,belowline,'LineWidth',3);hold on;
plot(x,topline,'LineWidth',3);hold on;
figure
a=area(bars,3);a.FaceAlpha = 0.35;a.EdgeColor='none';a.FaceColor=[0.9 0.4 0];

for i=1:(length(mouseA)-1)
    distA(i) = pdist([mouseA(i,:);mouseA(i+1,:)],'euclidean');
    distB(i) = pdist([mouseB(i,:);mouseB(i+1,:)],'euclidean');
end



figure;
subplot(3,1,1); plot(x,topline,'r',x,belowline,'b');hold on;
subplot(3,1,2); plot(distA); hold on;
subplot(3,1,3); plot(distB); hold on;

end