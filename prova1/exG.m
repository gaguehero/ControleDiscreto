clear; close all; clc
z=tf('z',0.8);

Kp = 60;
ftmf = Kp*2.07*(z+0.343)/(Kp*0.005*(z+0.349)+(z-0.82)*(z-0.04));
ftmf = zpk(ftmf);
rlocus(ftmf);
figure;

Kp = 125.04;
ftmf2 = Kp*2.07*(z+0.343)/(Kp*0.005*(z+0.349)+(z-0.82)*(z-0.04));
rlocus(ftmf2);
