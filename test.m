z0= [2999.5917 -5169.5881 4006.2532 0.877158 -4.212632 -6.074966];
tspan=[0,12000];
[t,z]=ode45('CDE',tspan,z0);
a=z(:,1);
b=z(:,2);
c=z(:,3);
d=z(:,4);
e=z(:,5);
f=z(:,6);
plot(t,a)
saveas(gcf,'a.jpg')
plot(t,b)
saveas(gcf,'b.jpg')
plot(t,c)
saveas(gcf,'c.jpg')
plot(t,d)
saveas(gcf,'d.jpg')
plot(t,e)
saveas(gcf,'e.jpg')
plot(t,f)
saveas(gcf,'f.jpg')