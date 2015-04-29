function [alignedPtSet] = align(reference,argument )
centroidRef=mean(reference,2);
centroidArg=mean(argument,2);

T=centroidRef-centroidArg; % translation 

P2=reference-repmat(centroidRef,1,size(reference,2));
P1=argument-repmat(centroidArg,1,size(argument,2));

[U,~,V] = svd(P1*P2'); 

% finding Rotation matrix
if det(V*U')==-1 % if reflection, we'll make rotation
    J=eye(size(reference,1));
    J(end,end)=-1;
    R=V*J*U';
else
    R=V*U';
end

P1=R*P1;
s=trace(P1'*P2)/trace(P1'*P1); % scaling factor

alignedPtSet=s*R*argument+repmat(T,1,size(reference,2));

end

