function [ I ] = backproj( R,theta)
%backprop computes backpropogation of R using given data

I = 0.5*iradon(R,theta,'linear','none',1,256);

end

