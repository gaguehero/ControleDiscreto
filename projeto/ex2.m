clear; close all; clc
s = tf('s');
z=tf('z',0.0005);

gps=39454.8/(s*(s+88.71));
ftmf=zpk(feedback(gps,1));
step(ftmf)
hold

gz = 0.0049*(z+0.9853)/((z-1)*(z-0.957));
ftmfz= feedback(gz,1);
figure(1)
step(ftmfz);

figure(2)
rlocus(ftmfz);

gzmatlab = c2d(gps,1);
ftmfz2= feedback(gzmatlab,1);
figure(3)
rlocus(ftmfz2);

figure(4)
margin(gz);

figure(5)
margin(gzmatlab);