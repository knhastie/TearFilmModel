function dpdt = odefunaorta(t,p)
%set constants
RA=0.900;
CA=1.0666;
RP=0.075;
CP=2.2666;
q0=425;
s=5/6;
h=1/3;

%Create time and flow vectors
    if mod(t,s)<h
        Q=q0*sin(pi*mod(t,s)/h);
    else
        Q=0;
    end

%switched CP and RP to CA and RA for odefunaorta (only change)
dpdt=Q/CA-p/(RA*CA);
end