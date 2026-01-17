clear,clc;
m = 1; %Pendulum mass
M = 5; %Cart mass
L = 2; %Length to pendulum mass
g = 9.81; %m/s^2
b = 0; %dampening

A = [0 1 0 0;...
    0 -b/M m*g/M 0;...
    0 0 0 1;...
    0 -b/(M*L) (m+M)*g/(M*L) 0];
B = [0; 1/M; 0; 1/(M*L)];
Bt = B';

Q = [1,0,0,0;...
    0,1,0,0;...
    0,0,1,0;...
    0,0,0,1];
R = 1;
R_1 = inv(R);
[K,S,P] = lqr(A,B,Q,R); %K = R_1*Bt*S

if size(A,1) ~= size(S,1) || size(A,2) ~= size(S,2)
    disp('S and A should have the same size!!!');
end