function dzb = sys2(t,z,A,B,R,Sf,t1)

% initialize the solution output
dzb = zeros(2,1);  % Chosen 2 because we need z1,z2

Sf1=Sf(:,1,:);
Sf1=Sf1(1,:);
Sf2=Sf(:,2,:);
Sf2=Sf2(1,:);
Sf3=Sf(:,3,:);
Sf3=Sf3(1,:);

s1 = interp1(t1,Sf1,t);
s2 = interp1(t1,Sf2,t);
s3 = interp1(t1,Sf3,t);

                     
% Define the S matrix
S = [s1 s2;
      s2 s3];
 
% The states
z = [z(1);
     z(2)];
 
% The feedback gain
K = inv(R)*B'*S;

% The control
u = -K*z;

% The plant
dz = A*z + B*u;

dzb(1) = dz(1);
dzb(2) = dz(2);


end