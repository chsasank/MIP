function [J, grad] = costFunction(l, S, G)
%COSTFUNCTION Compute cost and gradient for Diffusion MRI optimization

L = [l(1) 0; l(3) l(2)];
a = l(1);
b = l(2);
c = l(3);

J = 0;
for i = 1:size(G,2)
    g = G(:,i);
    J = J + (S(i) - exp(-0.1*g'*(L*L')*g))^2;
end

grad = 0;
for i = 1:size(G,2)
    g = G(:,i);
    d = [2*a*g(1)^2 + 2*c*g(1)*g(2),2*b*g(2)^2,2*c*g(2)^2+ 2*a*g(2)*g(1) ];
    grad = grad + (S(i) - exp(-0.1*g'*(L*L')*g))*(exp(-0.1*g'*(L*L')*g))*(0.1*g'*(L*L')*g)*d;
end


end