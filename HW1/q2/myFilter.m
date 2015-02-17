function [ R1 ] = myFilter( R,fraction,type )
%myFilter Uses one of the Ram-Lak filter, Shepp-Logan filter, 
% and the Cosine filter to filter f
%   Detailed explanation goes here

FR = fft(R);
N = size(R,1);

w = 2*pi/N*(0:N-1);
w = w-w(round(N/2));
w = w';

L = pi*fraction;

if strcmp(type, 'Ram-Lak')
    H = abs(w);
    H(abs(w)> L) = 0;
    
elseif strcmp(type, 'Shepp-Logan')
    H = abs(w).*sin(0.5*pi*w/L)./(0.5*pi*w/L);
    H(w == 0) = 0;
    H(abs(w)> L) = 0;
     
elseif strcmp(type, 'Cosine')
    H = abs(w).*cos(0.5*pi*w/L);
    H(abs(w)> L) = 0;       
end

H = ifftshift(H);
H = repmat(H,1,size(R,2));
FR1 = FR.*H;
R1 = ifft(FR1);
R1 = real(R1);
    
end

