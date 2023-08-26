clear; close all; clc;
s = tf('s');
z=tf('z',0.0005);

gz = 0.0049*(z+0.9853)/((z-1)*(z-0.957))
zpk(gz)
gainK=0.22;

w=(1+0.00025*s)/(1-0.00025*s);
Gw=(0.0049*w + 0.004828)/(w^2 - 1.957*w + 0.957)
Gw1=zpk(Gw);
Gw=minreal(Gw);
Gw1=minreal(Gw1)
figure(1)
margin(Gw*gainK);

%ftmfz= feedback(gz,1);
Dw=0.22*((0.022*s+1)/(0.00154*s+1))
Dz=c2d(Dw,0.0005,'tustin');

controlado=gz*Dz;
figure(2)
margin(controlado)
ftmfz=feedback(controlado,1);
stepinfo(ftmfz);
figure(3)
step(ftmfz);


figure(4)
t = 0:0.0005:2;
step(ftmfz)
lsim(ftmfz,t,t)

