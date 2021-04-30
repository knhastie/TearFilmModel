
t=zeros(1,201);
y=zeros(1,51);

for i=0:200
    t(i+1)=i/5;
end
for i=0:50
    y(i+1)=i/50-0.5;
end

m = 0;
sol = pdepe(m,@pdefun,@pdeic,@pdebc,y,t);

h = sol(:,:,1);
c = sol(:,:,2);

surf(y,t,h)
title('h(y,t)')
xlabel('Distance y')
ylabel('Time t')

figure

surf(x,t,c)
title('c(x,t)')
xlabel('Distance x')
ylabel('Time t')