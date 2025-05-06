clc, clear all , close all ;

% parameters
m=1;  % for the mass
b=2; %damping cofficient
k=20; % spring constant

% now state space matrices
A=[0 1; -k/m -b/m];  % this state matrices
B=[0;1/m];
C=[1 0];
D= [0 ];

% create a state spaces system 
sys=ss(A,B,C,D);

% simulation settings
t=0:0.01:10;
u=ones(size(t));  % this input force f(t)=1
x0=[0;0]; % initial state :position , and velocity=0

% simulate the respone
[y, t_out, x]=lsim(sys,u , t, x0);  % this linear system simulation 


plot(t_out,x(:,1),"LineWidth",2);
xlabel("Time (s)");
ylabel("Position (m)");
title("Mass_spring_Damper system Respones");
grid on;






