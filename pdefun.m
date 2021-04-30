function [c,f,s] = pdefun(y,t,u,dudt)
%Define constants
E=118.3;
Pec=9.62*1000;
s=4.66;
S=6.92*10^(0-6);
A=2.14*10^(0-6);
K=8.9*1000;
G=0.05;
Pc=0.013;

%Fill parameters for du/dt vector
c1=1;
f1=((u(1)^3)/12)*diff((S*diff(u(1),y,2)+A/(u(1)^3)-G*y),y);
s1=Pc*(u(2)-1)-E*(1-s*(S*diff(u(1),y,2)+A/(u(1)^3)))/(K+u(1));
c2=u(1);
f2=(u(1)/Pec)*diff(u(2),y)-u(2)*((u(1)^3)/12)*diff((S*diff(u(1),y,2)+A/(u(1)^3)-G*y),y);
s2=E*u(2)*(1-s*(S*diff(u(1),y,2)+A/(u(1)^3)))/(K+u(1))-Pc*(u(2)-1)*u(2);
c=[c1;c2];
f=[f1;f2];
s=[s1,s2];
end