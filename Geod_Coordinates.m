function [ geod_phi,geod_lamda ] = Geod_Coordinates( year,month,date,hour,min,sec,msec,xn,yn,zn,a,b,c )
%xn,yn,zn are ground_coorindates of point imaged.
%a,b,c are parameters of spheroid representing earth.  year,month,date,hour,min,sec,msec give 
%the time at which this point is imaged.

r=sqrt(xn^2+yn^2);
%fprintf('xn yn zn r %f %f %f %f \n',xn,yn,zn,r);
tantheta=(zn/r);
%fprintf('tantheta %f \n',tantheta);
tanphi=tantheta*a^2/c^2;
%fprintf('tanphi %f \n',tanphi);
geod_phi=atan(tanphi)*180/pi;
%fprintf('geod_phi %f \n',geod_phi);
tantheta=yn/xn;
theta=atan(tantheta);
if ((xn>0)&&(yn>0))
    theta=theta;
elseif ((xn>0)&&(yn<0))
    theta=theta;
elseif ((xn<0)&&(yn>0))
    theta=theta+pi;
elseif ((xn<0)&&(yn<0))
    theta=theta+pi;
end
            

siderial_angle=ut_siderial_angle(year,month,date,hour,min,sec,msec);
geod_lamda=(theta-siderial_angle)*180/pi;
if (geod_lamda<0)
    geod_lamda=geod_lamda+360;
%fprintf('geod_phi geod_lamda %f %f \n',geod_phi,geod_lamda);
end
%**********************************************************************************
%below program for finding siderial_angle at any time

    function[siderial_angle]= ut_siderial_angle(year,month,date,hour,minute,second,msec); 
%output: siderial_angle

mond(1)=0;mond(2)=31;mond(3)=59;mond(4)=90;mond(5)=120;mond(6)=151;mond(7)=181;
mond(8)=212;mond(9)=243;mond(10)=272;mond(11)=304;mond(12)=334;
%fprintf('mond %f %f %f %f %f %f %f %f %f %f %f \n',mond);
year_temp=year;
topi=2*pi;
siderial_angle=millisecond+second*1000;
siderial_angle=siderial_angle*0.001+60*(60*hour+minute);
siderial_angle=0.11574074074e-04*siderial_angle;
if (year_temp>1900)
    year_temp=year_temp-1900;
end
m=year_temp-50;
l=(m+2)/4.0;
n=month;
if ((n<=2)&&(m==(l*4-2)))
    l=l-1;
end
l=m*365+mond(n)+date+l-1;
siderial_angle=0.277987616+siderial_angle*1.0027379093+l*0.27379093e-02;
siderial_angle=(siderial_angle-floor(siderial_angle))*topi;
%fprintf('siderial_angle is %f \n',siderial_angle);
end

end