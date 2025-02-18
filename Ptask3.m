%% Task 3
clear;
clc;
syms s;
D = 0;
A = [0 0 0 1; 0 0 20.601 0; 0 1 0 0; 0 0 -0.4905 0];
B = [0 -1 0 0.5]';
K = acker(A, B, [-1+1j*sqrt(3) -1-1j*sqrt(3) -5 -5]);
C = [1 0 0 0];
P = [A B; -C 0];
rank(P);  %controllable

Aaa = A(1,1);
Aab = A(1,2:4);
Aba = A(2:4, 1);
Abb = A(2:4, 2:4);
Ba = B(1);
Bb = B(2:4);
N_t = [Aab; Aab*Abb];
rank (N_t); %observable

Ke = acker(Abb',Aab',[-15 -15 -15])';
%% Solving for the controller
A_hat=Abb-Ke*Aab;
B_hat=A_hat*Ke + Aba - Ke*Aaa;
F_hat= Bb- Ke*Ba;
C_hat=[[0 0 0] ;eye(3)];
D_hat=[1;Ke];

Ka = K(1);
Kb = K(2:4);
Atilde = A_hat - F_hat*Kb;
Btilde = B_hat - F_hat*(Ka + Kb*Ke);
Ctilde = -Kb;
Dtilde = -(Ka + Kb*Ke);
[num,den] = ss2tf(Atilde, Btilde, -Ctilde, -Dtilde);
obsCont = tf(num,den);
figure('Name','controller PZmap');
pzmap(obsCont)
%% Solving for the CL system
[num, den] = ss2tf(A,B,C,D);
plantTF = tf(num,den);
sys1 = series(obsCont,plantTF);
system = feedback(sys1,1);
%% PZ map
clc;
figure('name','CL system pzmap');
pzmap(system)
