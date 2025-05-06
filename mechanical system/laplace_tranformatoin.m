% this simply laplace tranformation
% we will take the f(x)= cos(3t)

% frist we need to define the units , like time(t) and frenquenes (s)
% like this the symbolic math
clc; clear all; close all;

syms t s
f= sin(2*t);
F=laplace(f,t,s);



t_vals=0:0.01:10;
y=sin(2*t_vals);


plot(t_vals,y,"LineWidth",2);

title(['Laplace transform: ', latex(F)], 'Interpreter', 'latex');


xlabel("Time(t)")
ylabel("Ampliude")

grid on ;

