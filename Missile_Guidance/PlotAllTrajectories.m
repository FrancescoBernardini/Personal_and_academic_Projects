function PlotAllTrajectories(xzplots)

for j = 1:size(xzplots,3)
    for k = 1:size(xzplots,3)
plot(xzplots(:,1,j,k),xzplots(:,2,j,k))
hold on
plot(xzplots(:,3,j,k),xzplots(:,4,j,k))
xlabel("Horizontal distance [m]",'interpreter','latex')
ylabel("Vertical distance [m]",'interpreter','latex')
title("Collision trajectory of the missile and the pursuer",'interpreter','latex')

    end
end
hold off



end
