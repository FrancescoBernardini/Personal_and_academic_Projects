function ComputeSurface(uResults)
subplot(1,3,1)
surf(uResults(:,:,2))

xlabel("$\dot s_z$",'interpreter','latex')
ylabel("$s_z$",'interpreter','latex')
zlabel("$\max|u|$ [units of g]",'interpreter','latex')
title("Max control imparted (lower is better)",'interpreter','latex')
colorbar

subplot(1,3,2)
surf(uResults(:,:,3))

xlabel("$\dot s_z$",'interpreter','latex')
ylabel("$s_z$",'interpreter','latex')
zlabel("$z(t_f)$ [m]",'interpreter','latex')
title("Final distance from the target  (lower is better)",'interpreter','latex')
colorbar

subplot(1,3,3)
surf(uResults(:,:,1))

xlabel("$\dot s_z$",'interpreter','latex')
ylabel("$s_z$",'interpreter','latex')
zlabel("$\int_0^{tf} |u|dt$",'interpreter','latex')
title("Integral of the control (lower is better)",'interpreter','latex')
colorbar


end