<<<<<<< HEAD
function [R1] = myRadonTransform(inputIm,deltaS)
t=-90:1:90;
theta=0:5:175;
m=length(t);
n=length(theta);
R1=zeros(m,n);
h = waitbar(0,'please wait..');
for i=1:m
    for j=1:n
        R1(i,j)=myIntegration(t(i),theta(j),inputIm,deltaS);
    end
    waitbar(i/m);
end
close(h);
end

=======
function [R1] = myRadonTransform(inputIm,deltaS)
t=-90:1:90;
theta=0:5:175;
m=length(t);
n=length(theta);
R1=zeros(m,n);
h = waitbar(0,'please wait..');
for i=1:m
    for j=1:n
        R1(i,j)=myIntegration(t(i),theta(j),inputIm,deltaS);
    end
    waitbar(i/m);
end
close(h);
end

>>>>>>> FETCH_HEAD
