function ComputeSurface(uResults,zMax,uMax,steps)


%%%%Coloring the plots%%%%
% Make colors be red above zMax and uMax, and cyan below.
zRedChannel = not(uResults(:,:,3)<=zMax);
zGreenChannel = uResults(:,:,3)<=zMax;
zBlueChannel = zeros(steps,steps);%zGreenChannel;
% Make the RGB image.
zColors = double(cat(3, zRedChannel, zGreenChannel, zBlueChannel));
%%%%%
uRedChannel = not(uResults(:,:,2)<=uMax);
uGreenChannel = uResults(:,:,2)<=uMax;
uBlueChannel = zeros(steps,steps);%uGreenChannel;
% Make the RGB image.
uColors = double(cat(3, uRedChannel, uGreenChannel, uBlueChannel));
%%%%%
uzGreenChannel = and(uGreenChannel,zGreenChannel);
uzRedChannel = not(uzGreenChannel);
uzBlueChannel = zeros(steps,steps);%uzGreenChannel;
% Make the RGB image.
uzColors = double(cat(3, uzRedChannel, uzGreenChannel, uzBlueChannel));
%%%%%


subplot(1,3,1)
surf(uResults(:,:,2),uColors)

xlabel("\fontsize{15}{0}\selectfont $\dot s_z$",'interpreter','latex')
ylabel("\fontsize{15}{0}\selectfont $s_z$",'interpreter','latex')
zlabel("\fontsize{15}{0}\selectfont $\max|u|$ [units of g]",'interpreter','latex')
title('\fontsize{19}{0}\selectfont Max control imparted (green is reachable)','interpreter','latex')

subplot(1,3,2)
surf(uResults(:,:,3),zColors)

xlabel("\fontsize{15}{0}\selectfont $\dot s_z$",'interpreter','latex')
ylabel("\fontsize{15}{0}\selectfont $s_z$",'interpreter','latex')
zlabel("\fontsize{15}{0}\selectfont $z(t_f)$ [m]",'interpreter','latex')
title("\fontsize{19}{0}\selectfont Final distance from the target  (green is admissible)",'interpreter','latex')

subplot(1,3,3)
surf(uResults(:,:,1),uzColors)

xlabel("\fontsize{15}{0}\selectfont $\dot s_z$",'interpreter','latex')
ylabel("\fontsize{15}{0}\selectfont $s_z$",'interpreter','latex')
zlabel("\fontsize{15}{0}\selectfont $\int_0^{tf} |u|dt$",'interpreter','latex')
title("\fontsize{19}{0}\selectfont Integral of the control (green is admissible)",'interpreter','latex')


%%%Plots the control integral by itself
figure(9)
surf(uResults(:,:,1),uzColors)

xlabel("\fontsize{15}{0}\selectfont $\dot s_z$",'interpreter','latex')
ylabel("\fontsize{15}{0}\selectfont $s_z$",'interpreter','latex')
zlabel("\fontsize{15}{0}\selectfont $\int_0^{tf} |u|dt$",'interpreter','latex')
title("\fontsize{19}{0}\selectfont Integral of the control (green is admissible)",'interpreter','latex')
end