%% Task 1
clear;
clc;
A = [0 1 0 0; 20.601 0 0 0; 0 0 0 1; -0.4905 0 0 0];
B = [0;-1;0;0.5];
C = [0 0 1 0];
D = 0;
P = [A B; -C 0];
rank(P)
%%
Ahat = [A zeros(4,1); -C 0];
Bhat = [B;0];
J = [-1+j*sqrt(3)  -1-j*sqrt(3)  -5  -5  -5];
Khat = acker(Ahat,Bhat,J);
%%
clc;
K = Khat(1:4);
Ki = -Khat(5);
AA= [A- B*K  B*Ki;-C  0];
BB = [0;0;0;0;1];
CC = [C  0];
DD = [0];
%% Validation
t = 0:0.02:6;
[y,x,t] = step(AA,BB,CC,DD,1,t);
x1 = [1  0  0  0  0]*x';
x2 = [0  1  0  0  0]*x';
x3 = [0  0  1  0  0]*x';
x4 = [0  0  0  1  0]*x';
x5 = [0  0  0  0  1]*x';
subplot(3,2,1); plot(t,x1); grid
title('x1 versus t')
xlabel('t Sec'); ylabel('x1')
subplot(3,2,2); plot(t,x2); grid
title('x2 versus t')
xlabel('t Sec'); ylabel('x2')
subplot(3,2,3); plot(t,x3); grid
title('x3 versus t')
xlabel('t Sec'); ylabel('x3')
subplot(3,2,4); plot(t,x4); grid
title('x4 versus t')
xlabel('t Sec'); ylabel('x4')
subplot(3,2,5); plot(t,x5); grid
title('x5 versus t')
xlabel('t Sec'); ylabel('x5')