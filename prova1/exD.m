clear; close all; clc
z=tf('z',0.8);
Kp = 554;
ftmfz = (2.07*Kp*(z+0.343))/((Kp*0.005*(z+0.349)+(z-0.82)*(z-0.04)));
step(ftmfz)
Kp = -30;
ftmfz2 = (2.07*Kp*(z+0.343))/((Kp*0.005*(z+0.349)+(z-0.82)*(z-0.04)));
step(ftmfz2)