clear; close all; clc
s = tf('s');
gps=39454.8/(s*(s+88.71))
gpsPoloZero = zpk(gps)
gpsMF=feedback(gpsPoloZero,1);
polos = roots([1 88.71 39455])

figure(1)
rlocus(gpsMF);

figure(2)
step(gpsMF);
stepinfo(gpsMF)

figure(3)
margin(gps);

gaink=2;
figure(4)
margin(gps*gaink);

