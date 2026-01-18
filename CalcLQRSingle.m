clear,clc;
m = 0.3; %Pendulum mass
M = 2.1; %Cart mass
L = 0.5; %Length to pendulum mass
g = 9.81; %m/s^2
b = 0.1; %dampening

A = [0 1 0 0;...
    0 -b/M m*g/M 0;...
    0 0 0 1;...
    0 -b/(M*L) (m+M)*g/(M*L) 0];
B = [0; 1/M; 0; 1/(M*L)];
Bt = B';

Q = [1,0,0,0;...
    0,0,0,0;...
    0,0,1,0;...
    0,0,0,0];
R = 1;
R_1 = inv(R);
[K,S,P] = lqr(A,B,Q,R); %K = R^-1(B'S + Nt); N = 0

if size(A,1) ~= size(S,1) || size(A,2) ~= size(S,2)
    disp('S and A should have the same size!!!');
end

% (u[1]/m - g*sin(u[3])*cos(u[3]) + l*power(u[2],2)*sin(u[3]))/(Mcart/m + power(sin(u[3]),2))
% xDotDot = 
% (F/m + g*sin(theta)*cos(theta) - L*ThetaDot^2*sin(theta)) / (M/m +
% sin(theta)^2