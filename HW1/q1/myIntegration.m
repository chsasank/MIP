<<<<<<< HEAD
function [ R2 ] = myIntegration(t,theta,inputIm,deltaS)

if theta==0 
   sMin=-64;
   sMax=63;
elseif theta>0 && theta<90
   sMin=ceil(max((t*cosd(theta)-63)/sind(theta),(-64-t*sind(theta))/cosd(theta)));
   sMax=floor(min((t*cosd(theta)+64)/sind(theta),(63-t*sind(theta))/cosd(theta)));
elseif theta==90
   sMin=-63;
   sMax=64; 
else
   sMin=ceil(max((t*cosd(theta)-63)/sind(theta),(63-t*sind(theta))/cosd(theta)));
   sMax=floor(min((t*cosd(theta)+64)/sind(theta),(-64-t*sind(theta))/cosd(theta)));
end

S=sMin:deltaS:sMax;

Xq=t*cosd(theta)-S*sind(theta)+65;
Yq=t*sind(theta)+S*cosd(theta)+65;
%[X,Y]=meshgrid(1:128,1:128);

Vq = interp2(inputIm,Xq,Yq);

R2=deltaS*sum(Vq);


end

=======
function [ R2 ] = myIntegration(t,theta,inputIm,deltaS)

if theta==0 
   sMin=-64;
   sMax=63;
elseif theta>0 && theta<90
   sMin=ceil(max((t*cosd(theta)-63)/sind(theta),(-64-t*sind(theta))/cosd(theta)));
   sMax=floor(min((t*cosd(theta)+64)/sind(theta),(63-t*sind(theta))/cosd(theta)));
elseif theta==90
   sMin=-63;
   sMax=64; 
else
   sMin=ceil(max((t*cosd(theta)-63)/sind(theta),(63-t*sind(theta))/cosd(theta)));
   sMax=floor(min((t*cosd(theta)+64)/sind(theta),(-64-t*sind(theta))/cosd(theta)));
end

S=sMin:deltaS:sMax;

Xq=t*cosd(theta)-S*sind(theta)+65;
Yq=t*sind(theta)+S*cosd(theta)+65;
%[X,Y]=meshgrid(1:128,1:128);

Vq = interp2(inputIm,Xq,Yq);

R2=deltaS*sum(Vq);


end

>>>>>>> FETCH_HEAD
