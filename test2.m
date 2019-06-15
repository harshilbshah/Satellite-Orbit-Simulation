z0= [2999.5917 -5169.5881 4006.2532 0.877158 -4.212632 -6.074966];
tspan=[0,12000];
[t,z]=ode45('CDE',tspan,z0);
satx=z(:,1);
saty=z(:,2);
satz=z(:,3);
satvx=z(:,4);
satvy=z(:,5);
satvz=z(:,6);
plot(t,satx)
title('x postion vs t')
xlabel('time')
ylabel('position x')
saveas(gcf,'satx.jpg')

plot(t,b)
title('y postion vs t')
xlabel('time')
ylabel('position y')
saveas(gcf,'saty.jpg')

plot(t,c)
title('z postion vs t')
xlabel('time')
ylabel('position z')
saveas(gcf,'satz.jpg')

plot(t,d)
title('x velocity vs t')
xlabel('time')
ylabel('velocity x')
saveas(gcf,'satvx.jpg')

plot(t,e)
title('y velocity vs t')
xlabel('time')
ylabel('velocity y')
saveas(gcf,'satvy.jpg')

plot(t,f)
title('z velocity vs t')
xlabel('time')
ylabel('velocity z')
saveas(gcf,'satvz.jpg')
