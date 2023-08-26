clear; close all; clc
z=tf('z',0.8);

for Kp = 0:0.05:1
    Kp
    c = (23.13*Kp*(z+0.03077))/((1+0.4373*Kp)*z^2-(0.01535*Kp+ 0.86)*z+0.0328);
    stepinfo(c)
end