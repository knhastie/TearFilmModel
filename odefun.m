function dydt = odefun(t,y)
%set up empty column vector
dydt=zeros(4,1);

%set constant rates
K2=0.5;
K3=0.4;
K4=0.1;
K5=0.5;
K7=0.01;
%uncomment for part b
%K8=0.4;

%set K1 and K6 (first five seconds dynamic, or non-dynamic)
K1=1;
K6=1;

%fill dydt
%included K8 terms only for part b
dydt(1)=-K1*y(1)+K2*y(2)+K7*y(3)-K8*y(1);
dydt(2)=K4*y(4)+K1*y(1)-(K2+K3)*y(2);
dydt(3)=K5*y(4)-(K7+K6)*y(3)+K8*y(1);
dydt(4)=K3*y(2)+K6*y(3)-(K4+K5)*y(4);

end