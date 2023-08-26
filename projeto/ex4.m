clear; close all; clc;
s=tf('s');
z=tf('z',0.0005);

gz = 0.0049*(z+0.9853)/((z-1)*(z-0.957));
ftmfz = feedback(gz,1);
rlocus(ftmfz);

pidd=(18.06*z^2-30.67*z+13.05)/(z*(z-1))
controlado = feedback(pidd*gz,1);
step(controlado)
stepinfo(controlado)

Kp = 4.57;
Ki = 0.44;
Kd = 13.05;

% for i=1:-0.1:0
%     termo1=i*Kp+Ki+Kd;
%     termo2=i*Kp+2*Kd;
%     termo3=Kd;
%     pidd=(termo1*z^2-termo2*z+termo3)/(z*(z-1))
%     controlado = feedback(pidd*gz,1);
%     figure(i*10)
%     step(controlado)
%     stepinfo(controlado)
% end

KpLinha = Kp*0.5;
j=0
% for i=1:0.2:6
%     j=j+1
%     termo1=KpLinha+Ki+i*Kd;
%     termo2=KpLinha+2*i*Kd;
%     termo3=i*Kd;
%     pidd=(termo1*z^2-termo2*z+termo3)/(z*(z-1))
%     controlado = feedback(pidd*gz,1);
%     figure(j)
%     step(controlado)
%     stepinfo(controlado)
% end
KdLinha = Kd*3;

termo1=KpLinha+Ki+KdLinha;
termo2=KpLinha+2*KdLinha;
termo3=KdLinha;
pidd=(termo1*z^2-termo2*z+termo3)/(z*(z-1))
controlado = feedback(pidd*gz,1);
figure(2)
step(controlado)
stepinfo(controlado)

figure(3)
t = 0:0.0005:2;
step(ftmfz)
lsim(ftmfz,t,t)

