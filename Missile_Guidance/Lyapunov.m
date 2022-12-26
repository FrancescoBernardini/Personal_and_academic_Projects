function dSb = Riccati1(tgo,Sb,A,B,R)
%This functions solves the Riccati equation for a 2d system


dSb=zeros(3,1);


q1=100;
q2=10;
Q=[q1,0;0,q2];
R=1;
S=[Sb(1),Sb(2);Sb(2),Sb(3)];

dS=-A*S-S*A'+B*R^-1*B';
dSb(1) = dS(1,1);
dSb(2) = dS(1,2);
dSb(3) = dS(2,2);

end