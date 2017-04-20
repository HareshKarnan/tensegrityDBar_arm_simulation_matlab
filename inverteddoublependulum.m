% DOUBLE PENDULUM SIMULATION
% AUTHOR : HARESH KARNAN
% DATE : 4/19/2017

syms l th2(t) th1(t) m g t
C = [cos(th2) -sin(th2) 0;
     sin(th2)  cos(th2) 0;
     0         0        1];

%% First link
p1 = [l;0;0];
w1 = [0;0;diff(th1,t)];
v1 = diff(p1,t) + cross(w1,p1);

%% Second link
p2 = [l;0;0];
w2 = [0;0;diff(th2,t)]
v2 = cross(w2,p2)

%% Kinetic Energy of the two bodies
KE1 = 0.5*m*v1.'*v1;
KE2 = 0.5*m*v2.'*v2;
KE = KE1 + KE2;

%% Potential Energy of the two bodies
PE1 = -m*g*l*cos(th1);
PE2 = -m*g*(l*cos(th1)+l*cos(th1+th2));
PE = PE1 + PE2;

%% Lagrangian
L = KE - PE;
Lag1 = diff(diffdot(L,diff(th1,t))) - diffdot(L,th1);
Lag2 = diff(diffdot(L,diff(th2,t))) - diffdot(L,th2);
syms ddq1 ddq2 q1 q2
LL1 = subs(Lag1,[diff(th1,t,t) diff(th2,t,t) th1 th2],[ddq1 ddq2 q1 q2]);
LL2 = subs(Lag2,[diff(th1,t,t) diff(th2,t,t) th1 th2],[ddq1 ddq2 q1 q2]);

%% Second order equations
ddq1 = solve(LL1,ddq1)
ddq2 = solve(LL2,ddq2)



