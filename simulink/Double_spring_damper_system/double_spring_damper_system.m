% this will be the double spring damper system , its like the normal spring
% damper system 

clc; clear all; close all;

% Parameters
m1 = 1;      % mass 1 (kg)
m2 = 1.5;    % mass 2 (kg)
k1 = 10;     % spring constant 1 (N/m)
k2 = 12;     % spring constant 2 (N/m)
d1 = 0.5;    % damping coefficient 1 (N·s/m)
d2 = 0.7;    % damping coefficient 2 (N·s/m)

% State-space matrices
A = [0 1 0 0;
    -(k1 + k2)/m1 -(d1 + d2)/m1 -k2/m1 d2/m1;
    0 0 0 1;
    k2/m2 -k2/m2 -d2/m2 -d2/m2];

B = [0; 1/m1; 0; 0];

C = [1 0 0 0];    % output is displacement of mass 1 (x1)
D = 0;

% Create state-space system
sys = ss(A, B, C, D);

% Simulation settings
t = 0:0.01:10;             % time vector
F = ones(size(t));        % constant input force (1 N)
x0 = [0.2; 0; 0; 0];       % initial conditions: x1 = 0.2 rad, others = 0

% Simulate system response
[y, t_out, x] = lsim(sys, F, t, x0);

% Plot displacement of mass 1 (x1) over time
plot(t_out, x(:,1), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Displacement of Mass 1 (m)');
title('Double Spring-Damper System Response');
grid on;
