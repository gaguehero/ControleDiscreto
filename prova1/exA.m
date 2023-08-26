clear; close all; clc
s = tf('s');
Gps = 16/((s+0.25)*(s+4));
Hs = 1/(s+400);
ftml = feedback(Gps,Hs);
h = stepplot(ftml);
