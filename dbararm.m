% TENSEGRITY D BAR ARM SIMULATION
% AUTHOR : HARESH KARNAN
% DATE : 4/19/2017
clear all
clc
%% definitions and Rotation matrices
syms t l th1(t) th2(t) th3(t) th4(t) m g
C_b_a = [cos(th2) -sin(th2) 0;
     sin(th2)  cos(th2) 0;
     0         0        1];

C_c_d = [];
%% Position and velocity vectors of the D bar arm links. 
p1 = [l/2;0;0];
w1 = [0;0;diff(th1,t)];
v1 = cross(w1,p1);

p2 = [l/2;0;0];
w2 = [0;0;diff(th2,t)];
v2 = cross(w2,p2);

p3 = [l/2;0;0];
w3 = [0;0;diff(th3,t)];
v3 = cross(w3,p3);

p4 = [l/2;0;0];
w4 = [0;0;diff(th4,t)];
v4 = cross(w4,p4);

%% Kinetic energy of the 4 links
KE1 = 0.5*m*v1.'*v1;
KE2 = 0.5*m*v2.'*v2;
KE3 = 0.5*m*v3.'*v3;
KE4 = 0.5*m*v4.'*v4;
KE = KE1 + KE2 + KE3 + KE4;

%% Potential energy of the 4 links
PE1 = m*g*0.5*l*sin(th1);
PE2 = m*g*(l*sin(th1) + 0.5*l*sin(th1+th2));
PE3 = m*g*0.5*l*sin(th3);
PE4 = m*g*(l*sin(th3) + 0.5*l*sin(th3+th4));
PE = PE1 + PE2 + PE3 + PE4;

%% Lagrange Dynamics Equations
L = KE - PE ;
Lag1 = diff(diffdot(L,diff(th1,t))) - diffdot(L,th1);
Lag2 = diff(diffdot(L,diff(th2,t))) - diffdot(L,th2);
Lag3 = diff(diffdot(L,diff(th3,t))) - diffdot(L,th3);
Lag4 = diff(diffdot(L,diff(th4,t))) - diffdot(L,th4);
syms ddq1 ddq2 ddq3 ddq4 q1 q2 q3 q4
LL1 = subs(Lag1,[diff(th1,t,t) diff(th2,t,t) diff(th3,t,t) diff(th4,t,t) th1 th2 th3 th4],[ddq1 ddq2 ddq3 ddq4 q1 q2 q3 q4]);
LL2 = subs(Lag2,[diff(th1,t,t) diff(th2,t,t) diff(th3,t,t) diff(th4,t,t) th1 th2 th3 th4],[ddq1 ddq2 ddq3 ddq4 q1 q2 q3 q4]);
LL3 = subs(Lag3,[diff(th1,t,t) diff(th2,t,t) diff(th3,t,t) diff(th4,t,t) th1 th2 th3 th4],[ddq1 ddq2 ddq3 ddq4 q1 q2 q3 q4]);
LL4 = subs(Lag4,[diff(th1,t,t) diff(th2,t,t) diff(th3,t,t) diff(th4,t,t) th1 th2 th3 th4],[ddq1 ddq2 ddq3 ddq4 q1 q2 q3 q4]);
s1 = ones(3,1)
s2=s1;s3=s1;s4=s1;
Q1 = dot((s1+s2+s4),diffdot(v1,diff(th1,t)));
Q2 = dot((s1+s2+s4),diffdot(v2,diff(th2,t)));
Q3 = dot((s1+s2+s3),diffdot(v3,diff(th3,t)));
Q4 = dot((s1+s2+s3),diffdot(v4,diff(th4,t)));

ddq1 = solve(LL1-Q1(2),ddq1)
ddq2 = solve(LL2-Q2(2),ddq2)
ddq3 = solve(LL3-Q3(2),ddq3)
ddq4 = solve(LL4-Q4(2),ddq4)