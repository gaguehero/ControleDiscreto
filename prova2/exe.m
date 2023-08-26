clear; close all; clc;
s=tf('s');
z=tf('z',0.1);
Gps = 16/((s+0.25)*(s+4));
Hs = 400/(s+400);
GpHs = Gps*Hs;
polo = exp(-0.46+i*0.55)

Gpz = c2d(Gps,0.1);
GpHz = c2d(GpHs,0.1);

ftmf=zpk((Gpz)/(1+GpHz));
ftmfSimp = minreal(ftmf);

A = [0 1
    -0.718 1.579];
B = [0.07
    0.171];
C = [0 1];
D = 0;
P=[0.5382 + 0.3300*i 0.5382 - 0.3300*i];
F= place(A,B,P);
I=eye(size(A));
MJ=C*inv(I-A+B*F)*B;
J=1/MJ;

sys=ss(A-B*F,2.67*B,C,[],0.1)
step(sys)
stepinfo(sys)