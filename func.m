function [ zabc ] = CDE1( t,z )


mu=398600.64   ;%  in km^3/sec^2
re=6378.140 ; %  earth semi major axis in km
j2=1082.28e-06;
j3=-2.5358868e-06;
j4=-1.6246180e-06;
j5=-0.22698599e-06;
j6=0.54518572e-06;
 
r=sqrt(z(1)*z(1)+z(2)*z(2)+z(3)*z(3));
rebyr=re/r;
rebyr2=rebyr*rebyr;
rebyr3=rebyr*rebyr2;
rebyr4=rebyr2*rebyr2;
rebyr5=rebyr*rebyr4;
rebyr6=rebyr*rebyr5;
 
zbyr=z(3)/r;
zbyr2=zbyr*zbyr;
zbyr3=zbyr*zbyr2;
zbyr4=zbyr*zbyr3;
zbyr5=zbyr*zbyr4;
zbyr6=zbyr*zbyr5;
 
temp1=-mu*z(1)/(r*r*r);
temp2=3*j2/2*rebyr2*(1-5*z(3)*z(3)/(r*r));
temp3=5*j3/2*rebyr3*(3-7*zbyr2)*zbyr;
temp4=-5*j4/8*rebyr4*(3-42*zbyr2+63*zbyr4);
temp5=-3*j5/8*rebyr5*(35-210*zbyr2+231*zbyr4)*zbyr;
temp6=j6/16*rebyr6*(35-945*zbyr2+3465*zbyr4-3003*zbyr6);
 
g1=z(4);
g2=z(5);
g3=z(6);
g4=temp1*(1+temp2+temp3+temp4+temp5+temp6);
 
temp1 = -mu* z(3)/(r*r*r);
temp2 = 3/2.0 * j2 * rebyr2*(3 - 5*zbyr2);
temp3 = 5/2.0 * j3 * rebyr3 * (6 - 7*zbyr2)*zbyr;
temp4 = -5/8.0*j4*rebyr4*(15 - 70*zbyr2 + 63*zbyr4);
temp5 = -3/8.0*j5*rebyr5*(105 - 315*zbyr2 + 231*zbyr4)*zbyr;
temp6 = j6/16 * rebyr6 * (245 - 2205*zbyr2 + 4851*zbyr4 - 3003 * zbyr6);
temp7 = -mu/(r*r);
temp8 = temp7*(-3/2.0*j3*rebyr3 + 15/8.0*rebyr5);
 
g5=(z(2)/z(1)*g4);
g6=temp1*(1+temp2+temp3+temp4+temp5+temp6)+temp7*temp8;

zabc=[g1;g2;g3;g4;g5;g6];
sat_x=z(1);
sat_y=z(2);
sat_z=z(3);
sat_xdot=z(4);
sat_ydot=z(5);
sat_zdot=z(6);



end
