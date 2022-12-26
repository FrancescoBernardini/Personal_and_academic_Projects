function [ControlIntegral,MaxControl,zFinal,zFlag,uFlag,xzplot] = ComputeControl(A, B,q1,q2,R,zTreshold,uMax,z0,vz0, T, Vt, Vp,x0)
%This function performs a full optimal control calculation to determine
%the performance index that grants target collision precision of at least
%1%, and the minimum fuel consumption
%It gives back: 
%1) the integral of the control (ideally proportional to the
%fuel consumed)
%2) the maximum control imparted (to see if it complies with the specs of
%the missile)
%3) the final distance of the missile from the target

%%%%Performance index

Qf=[q1,0;0,q2];

R=1;




[Tgo,Sinv] = ode45(@(Tgo,Sinv) Lyapunov(Tgo,Sinv,A,B,R), [0 T],[1/Qf(1,1) 0 1/Qf(2,2)]); %Integrate the Riccati equation forward to get Sb

N=length(Tgo);

S=zeros(2,2,N);

for k=1:N
    S(:,:,k)=inv([[Sinv(N-k+1,1) Sinv(N-k+1,2)];
                [Sinv(N-k+1,2) Sinv(N-k+1,3)]]); %Calculate the S(t)=Sb(T-t)
    t(k)=T-Tgo(N-k+1);
end

s0=[z0;vz0];

[tplant,zf] = ode45(@(tplant,z) Dynamics(tplant,z,A,B,R,[S(1,1,:) S(1,2,:) S(2,2,:)],t),t,s0); 

Nplant = length(tplant);

zplant = zeros(2,1,Nplant);
Sinterp = zeros(2,2,Nplant);
Kinterp = zeros(1,2,Nplant);

%Creation of a multidimensional state vector
zplant(1,1,:)=zf(:,1);
zplant(2,1,:)=zf(:,2);


%%%Interpolation of S(1,1)
S1interp = S(1,1,:);
S1interp = S1interp(1,:);
Sinterp(1,1,:) = interp1(t,S1interp,tplant);

%%%Interpolation of S(1,2)=S(2,1)
S2interp = S(1,2,:);
S2interp = S2interp(1,:);
Sinterp(1,2,:) = interp1(t,S2interp,tplant);
Sinterp(2,1,:) = Sinterp(1,2,:);

%%%Interpolation of S(2,2)
S3interp = S(2,2,:);
S3interp = S3interp(1,:);
Sinterp(2,2,:) = interp1(t,S3interp,tplant);


Kinterp = R^(-1)*pagemtimes(B',Sinterp);
u = -pagemtimes(Kinterp , zplant);




%%%%Exports the relevant results of computation
ControlIntegral = sum(abs(u))/9.8;

MaxControl = max(abs(u))/9.8;
zFinal = abs(zplant(1,1,end));

zFlag = (zFinal<zTreshold);
uFlag = (MaxControl<uMax);


%%%Create the xzplot result to return
xfp = tplant*Vp;
xft = x0-tplant*Vt;
zt = 0*tplant;
xzplot=[xfp zf(:,1) xft zt tplant];
%%%


end