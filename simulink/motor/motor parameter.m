clear all 
R_A= 8; % armature resistance
L_A=0.015; % armature inductance
K_G=0.015; % back emf
J= 9e-7;  % mass moment inertia
M_GR = 1.8e-3;          % gliding friction torque (Nm)

%characteristic map friction (Nm)
CM_FRIC = [
    0           33.3009     53.2814     91.2947     139.9894    199.9938    233.5460    252.8982    288.2097    297.0062
    0.003045	0.00195     0.001905	0.001845	0.0018      0.0018      0.0018      0.001875	0.00195     0.00201
    ];