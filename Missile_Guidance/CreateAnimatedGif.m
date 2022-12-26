function CreateAnimatedGif(xzplot)
%Creating Data to Animate
%Time array
t = xzplot(:,5);
%Missile coordinates
x1 = xzplot(:,1)/1000;
y1 = zeros(size(x1,1),1)/1000;
z1 = xzplot(:,2)/1000;
%Target coordinates
x2 = xzplot(:,3)/1000;
y2 = zeros(size(x2,1),1)/1000;
z2 = xzplot(:,4)/1000;


% Setting up the Plot
figure; hold on
title(sprintf('Trajectory\nTime: %0.2f sec', t(1)), 'Interpreter', 'Latex');
xlabel('Horizontal distance x [km]', 'Interpreter', 'Latex')
ylabel('Horizontal distance y [km]', 'Interpreter', 'Latex')
zlabel('Vertical distance z [km]', 'Interpreter', 'Latex')

xlim([0 20]);
ylim([-1 1]);
zlim([-2 1]);

grid minor  % Adding grid lines
axis equal  % Equal axis aspect ratio
view(-17.5,10);  % Setting viewing angle


% Create file name variable
filename = 'animation.gif';
% Plotting with no color to set axis limits
plot3(x1,y1,z1,'Color','none');
% Plotting the first iteration
p1 = plot3(x1(1),y1(1),z1(1),'b');
m1 = scatter3(x1(1),y1(1),z1(1),'filled','b');
hold on
p2 = plot3(x2(1),y2(1),z2(1),'r');
m2 = scatter3(x2(1),y2(1),z2(1),'filled','r');
legend('','Missile','','Target')

% Iterating through the length of the time array
for k = 1:length(t)
    % Updating the line
    p1.XData = x1(1:k);
    p1.YData = y1(1:k);
    p1.ZData = z1(1:k);

    p2.XData = x2(1:k);
    p2.YData = y2(1:k);
    p2.ZData = z2(1:k);
    % Updating the point
    m1.XData = x1(k); 
    m1.YData = y1(k);
    m1.ZData = z1(k);
    
    m2.XData = x2(k); 
    m2.YData = y2(k);
    m2.ZData = z2(k);
    % Updating the title
    title(sprintf('Trajectory\nTime: %0.2f sec', t(k)),...
    'Interpreter','Latex');
    % Delay
    pause(0.01)
    % Saving the figure
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,...
        'DelayTime',0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append',...
        'DelayTime',0.1);
    end
end

end
