clear; close all; clc;
s=tf('s');
z=tf('z',0.01);
Gps = 16/((s+0.25)*(s+4));
Hs = 400/(s+400);
GpHs = Gps*Hs;

Gpz = c2d(Gps,0.01);
GpHz = c2d(GpHs,0.01);
GpHzpz = zpk(GpHz);
pidd=(189.54*z^2-301.75*z+120.8)/(z*(z-1))
controlado=(pidd*Gpz)/(1+pidd*GpHzpz);
step(controlado)
stepinfo(controlado)