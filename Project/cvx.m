inputIm=imresize(data33(:,:,6),1/2);

u=dct2(inputIm);

N=size(u,1);
eps=1;
p=1;

M=floor(N/2);

phi=rand(M,N); % symmetric bernouli
phi=((phi >= .5)-(phi < .5))/sqrt(M);

b=phi*u;


cvx_begin
variable x(N,N)
minimize( norm( x, 1 ) )
subject to
phi *  x == b;
cvx_end


reconstructedImage=idct2(x);

rmsd=rms(rms(idct2(x)-inputIm))
imshow(uint8(idct2(x)))
