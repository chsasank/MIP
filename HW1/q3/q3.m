clc; clear;
S = [0.5045 - 1i*0.0217, 0.6874 + 1i*0.0171, 0.3632 + 1i*0.1789, 0.3483 + 1i*0.1385, 0.2606 - 1i*0.0675, 0.2407 + 1i*0.1517];
S = abs(S);
G = [[1;0],[0.866;0.5],[0.5;0.866],[0;1],[-0.5;0.866],[-0.866;0.5]];


x0 = rand(3,1);
A = -eye(3); A(1,1) = 0;
b = zeros(3,1);
options = optimset('GradObj','on');
[x,lval] = fmincon(@(l) costFunction(l, S, G) ,x0,A,b,options);