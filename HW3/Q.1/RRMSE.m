function [ rrmse ] = RRMSE( A,B )

a=abs(A);
b=abs(B);
rrmse=sqrt(sum(sum((a-b).^2)))/sqrt(sum(sum(a.^2)));

end

