function dpdt = odefunartery(t,p)
%set constants
RA=0.900;
CA=1.0666;
RP=0.075;
CP=2.2666;
q0=425;
s=5/6;
h=1/3;

%Calculate Q
    if mod(t,s)<=h
        Q=q0*sin(pi*mod(t,s)/h);
    else
        Q=0;
    end

dpdt=zeros(2,1);    
dpdt(1)=Q/CP-p(1)/(RP*CP);
dpdt(2)=Q/CA-p(2)/(RA*CA);    
end