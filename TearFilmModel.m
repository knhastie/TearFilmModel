%set time span and initial conditions
%current values are for healthy eye, changed timespan upper limit and c0
%for DES eye
timespan=[0 5.97];
h0=3*10^(0-6);
c0=300;
f0=[h0;c0];

%call ode45 and odefun to get f matrix
[t,f]=ode45(@odefuntears,timespan,f0);
f1=f(:,1);
f2=f(:,2);

%create f3=production over time
%following f3 values are for not crying test
%would add baseline production rate from odefuntears.m to both parts of if
%statement for crying tests--have done so with comments
min=1.31*10^(0-6);
f3=zeros(size(f1));
for i=1:length(f1)
    if f1(i)<min
        f3(i)=2;%+prodbase
    else
        f3(i)=0.02;%+prodbase
    end
end

figure
yyaxis left
plot(t,f1)
ylabel('Film Thickness (m)')
yyaxis right
plot(t,f3)
title('Tear Film Thickness and Tear Production Rate over Time')
xlabel('Time (s)')
ylabel('Tear Production Rate (uL/s)')
legend('Film Thickness','Tear Production')
set(gca,'fontsize',30)
figure
plot(t(100:length(t)),f2(100:length(f2)))
title('Tear Film Osmolarity over Time')
xlabel('Time (s)')
ylabel('Film Osmolarity (Osm/m^3)')
set(gca,'fontsize',30)

