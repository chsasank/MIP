function [ I ] = backproj( R,theta)
%backprop computes backpropogation of R using given data

I = iradon(R,theta,'linear','none',1,128);

end

