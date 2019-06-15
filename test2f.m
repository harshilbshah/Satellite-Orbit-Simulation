function [satx,saty,satz,t]= test2f(z0,tspan)

%z0= [2999.5917 -5169.5881 4006.2532 0.877158 -4.212632 -6.074966];
%tspan=[0,12000];
[t,z]=ode45('CDE',tspan,z0);
satx=z(:,1);
saty=z(:,2);
satz=z(:,3);
%satvx=z(:,4);
%satvy=z(:,5);
%satvz=z(:,6);

end

