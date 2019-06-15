function [satx,saty,satz,t,xn,yn,zn]=remotesate()%give z0 and tspan in sate()
%prompt='Enter file name: ';
%x=input(prompt);
%x='GeoStationarySat.txt'
%%%p=fopen(x);
%M = fscanf(fp, 'M=%s', 1)
z0= [2999.5917 -5169.5881 4006.2532 0.877158 -4.212632 -6.074966];
tspan=[0,12000];
[t,z]=ode45('CDE1',tspan,z0);
satx=z(:,1);
saty=z(:,2);
satz=z(:,3);
%satvx=z(:,4);
%satvy=z(:,5);
%satvz=z(:,6);

[xn,yn,zn]=ground(satx,saty,satz);

end

function [temp10, temp11, temp12]=ground(satx,saty,satz)

a=6378.204;
b=a;
c=6356.401;

temp1 = ((satx).^2)/(a.^2) ;
temp2 = ((saty).^2)/(b.^2) ;
temp3 = ((satz).^2)/(c.^2) ;

temp4 = 1./(((temp1+temp2+temp3).^(0.5)));

temp5 = - temp4;

temp6 = (1- temp4).^2 ;

temp7 = (1-temp5).^2 ;

temp8 = (((satx).^2)+((saty).^2)+((satz).^2)).*(temp6);

temp9 = (((satx).^2)+((saty).^2)+((satz).^2)).*(temp7);


if temp8 < temp9
    temp10=temp4.*satx;
    temp11=temp4.*saty;
    temp12=temp4.*satz;
else
    temp10=temp5.*satx;
    temp11=temp5.*saty;
    temp12=temp5.*satz;
end
end