%Code for double pendulum
%AUTHOR : HARESH KARNAN
%DATE : 4/19/2017
clear all 
clc
syms q1(t) q2(t) m l t g
%% Rotation matrix
C = [cos(q2) -sin(q2) 0
     sin(q2) cos(q2)  0
     0          0     1];
C_inv = inv(C)
%% Kinetic energy
KE_1 = 0.5 * m * l^2 * diff(q1,t)^2 /4 
KE_2 = 0.5 *m * l^2 * ((diff(q1,t)+diff(q2,t))^2)*(1+1/4)
KE = KE_1 + KE_2;

%% Potential energy
PE_1 = -m*g*sin(q1)*l/2;
PE_2 = -m*g*(l*sin(q1)+0.5*l*sin(q2));
PE = PE_1 + PE_2;

%% Lagrangian 
L = KE - PE
Lag1 = diff(diffdot(L,diff(q1,t)),t) - diffdot(L,q1)
Lag2 = diff(diffdot(L,diff(q2,t)),t) - diffdot(L,q2)

%% ode45
t = [0 10];

[t,y] = ode45(,t,0)
