%% Task 2
clc;
clear;
A = [0 1 0 0; 20.601 0 0 0; 0 0 0 1; -0.4905 0 0 0];
B = [0;-1;0;0.5];
C = [1 0 0 0];
D = 0;
P = [A B; -C 0];
rank(P);
J = [-1+j*sqrt(3)  -1-j*sqrt(3)  -5  -5];
K = acker(A,B,J);
K1 = K(1);
initial(ss(A-B*K,B,C,D),[0.1;0;0;0]);
%% Solving for the controller
clc
M = [0 zeros(1,3); zeros(3,1) eye(3)];
syms s;
g = inv(s*eye(4)-A);
controller = (K1/(1 + K*M*g*B));
[num den] = numden(simplify(controller));
Cnum_coeffs = sym2poly(num)/1.726e19;
Cden_coeffs = sym2poly(den)/1.726e19;
controllerTF = tf(Cnum_coeffs,Cden_coeffs);
%% CL System
[num den] = ss2tf(A-B*K,B*K1,C,D);
system = tf(num,den)
%% PZmap
pzmap(system);
