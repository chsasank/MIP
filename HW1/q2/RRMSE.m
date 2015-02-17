function [ e ] = RRMSE( A,B )
%RRMSE Computes relative root-mean-squared errors 
%   Computes relative root-mean-squared errors  between A & B with A as
%   reference

% A = A-mean(A(:));
% B = B-mean(B(:));
% A = A/sqrt(sum(A(:).^2));
% B = B/sqrt(sum(B(:).^2));

e = sum((A(:)-B(:)).^2)/sum((A(:)).^2);
e = sqrt(e);
end

