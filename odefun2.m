function dydt = odefun2(t,y)
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

%set K1 and K6 (t>5, dynamic)
K1=0.2;
K6=0.2;

%fill dydt
dydt(1)=-K1*y(1)+K2*y(2)+K7*y(3)-K8*y(1);
dydt(2)=K4*y(4)+K1*y(1)-(K2+K3)*y(2);
dydt(3)=K5*y(4)-(K7+K6)*y(3)+K8*y(1);
dydt(4)=K3*y(2)+K6*y(3)-(K4+K5)*y(4);

end