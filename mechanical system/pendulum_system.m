% now we will go with pendulum system 
% modelling is same as the spring damper system , but the state space
% equation is different that's it 


clc; clear all; close all ; 

% paremeters
m=1;
L=1; %lenght in meters 
g=9.81;
c=0.5; % damping cofficient
I=m*L^2;  % this inertia

% state space matrices ( linearized mdoel)
A=[0 1 ; -g/L -c/I];

B=[0; 1/I];

C=[1 0];
D=[0];

% create the state space equation 
sys=ss(A,B,C,D);


% simulation settings 
t= 0: 0.01 : 10;
u=ones(size(t));
x0=[0.2;0];

% simulate the respone
[y, t_out, x]=lsim(sys,u,t,x0); 

plot(t_out,x(:,1),'LineWidth',2);
xlabel('Time(s)');
ylabel('Angular Positon(rad)');
title('Linearized pendulam Response');
grid on ;


