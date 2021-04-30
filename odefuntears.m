function dfdt = odefuntears(t,f)
%Define constants
%T=upside-down triangle--to figure out later
%C=right-side-up triangle
E=118.3;
Pec=9.62*1000;
s=4.66;
S=6.92*10^(0-6);
A=2.14*10^(0-6);
K=8.9*1000;
G=0.05;
Pc=0.013;

%set min and max h values
min=1.31*10^(0-6);
max=3.69*10^(0-6);
%divide volume of tear by ocular surface area to get decrease in h per tear
hdec=(6.5*10^(0-6))/1.25;
%set physiologically realistic rate of tear production (response to low h)
prod=2*10^(0-6);
%for crying tests only--set prodbase to manipulable rate, add to each  
%dh/dt expression in if statements below
%prodbase=1.6*10^(0-5);

%Create dfdt vector
dfdt=zeros(2,1);
%Fill dfdt
%Row 1 is dh/dt, 2 is dc/dt
%substituted equations for Q and J into ddt to make things easier on matlab
%Wherever they have h or c, I have f(1) or f(2) (which are h(t) and c(t))
if f(1)<min
    %add steady source of tear production
    dfdt(1)=Pc*(f(2)-1)-(((f(1))^3)/12*(S*(f(1))+A*((f(1))^(0-3))-G))-E*(1-s*(S*(f(1))+A*((f(1))^(0-3))))/(K+f(1))+prod;%+prodbase
elseif f(1)>max
    %decrease h by one tear droplet
    dfdt(1)=Pc*(f(2)-1)-(((f(1))^3)/12*(S*((f(1)))+A*((f(1))^(0-3))-G))-E*(1-s*(S*((f(1)))+A*((f(1))^(0-3))))/(K+f(1))-hdec;%+prodbase
else
    %normal case
    dfdt(1)=Pc*(f(2)-1)-((f(1))^3)/12*(S*(f(1))+A*((f(1))^(0-3))-G)-E*(1-s*(S*(f(1))+A*((f(1))^(0-3))))/(K+f(1));%+prodbase
end
dfdt(2)=(E*f(2)*(1-s*(S*(f(1))+A*((f(1))^(0-3))))/(K+f(1))+(1/Pec)*((f(1)*(f(2))))-Pc*(f(2)-1)*f(2)-(f(2))*(((f(1))^3)/12)*(S*(f(1))+A*((f(1))^(0-3))-G))/f(1);
end