clear all
close all

%%%First section: definition of the system in the 2D case

%%%%Dynamics
b=-1;
B=[0 -1]';

A=[[0 1];
   [0 0]];

R=1;


%%%Initial conditions
z0=-1000; %difference in quote in m
vz0=0;  %initial difference between vertical velocities m/s
Vt=500; %in m/s
Vp=500;
x0=20000; %initial horizontal difference in position (in m)
T=x0/(Vt+Vp);
%%%



%%%%Tresholds for the maximum control applicable and the maximum allowed
%%%%distance from target
g=9.8; %%acceleration of gravity, m/s^2
uMax = 1.5; %%in units of g
zMax=0.5;
%%%%%%%%%%%%%%%%

%%%Number of steps to run the simulation: this creates a grid of size
%%%step x step where both position and velocity parameters sweeps between 1
%%%and step
steps = 10;


%%%Run the simulation sweeping all parameters in the range of interest
[uResults xzplots] = ComputeAllControls(steps,A,B,R,zMax,uMax,z0,vz0,T,Vt,Vp,x0);


%%%Plots the level surfaces
figure(2)
ComputeSurface(uResults)

%Plots the level surfaces versus the constraints
figure(3)
ComputeSurfaceTresholds(uResults,zMax,uMax,steps)

% 
% %%%%%Plots the trajectories%%%%%
figure(4)
PlotAllTrajectories(xzplots)

%%%Plots the animation
CreateAnimatedGif(xzplots(:,:,1,1))
