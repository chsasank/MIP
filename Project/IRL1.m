%%%%%%%%%%%%%%%%%% IRL-1 algorithm   %%%%%%%%%%%%%%%%%%%%%%%%%

prevObj=Inf; % objective function

while(eps>10^(-8))
    weights=(abs(u)+eps).^(p - 1);
    
    for i=1:N
        Q=diag(weights(:,i).^(-1));
        u(:,i)=Q*phi'*((phi*Q*phi')\b(:,i));
    end
    
    currObj=sum(sum(weights.*abs(u)));
    
    if abs(currObj-prevObj)/currObj < sqrt(eps)/100
        eps=eps/10;
    end
    prevObj=currObj;
end