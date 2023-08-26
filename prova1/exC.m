clear; close all; clc
z=tf('z',0.8);
s=tf('s');

gs = 16/((s+0.25)*(s+4));
hs = 1/(s+400);
ftmf = feedback(gs,hs);

zohgz = ((16/(z-1))-17.07/(z-0.82)+1.07/(z-0.04))*(z-1);
zohgzPoloZero = zpk(zohgz);

gz = c2d(gs,0.8);

gzPoloZero = zpk(gz);
gph = 16/((s+0.25)*(s+4)*(s+400));
gphz = c2d(gph,0.8);
gphzPoloZero = zpk(gphz)
ftmfz = zpk(zohgzPoloZero/(1+gphzPoloZero));
ftmfz = minreal(ftmfz);
step(ftmfz)
ftmz2 = -2.2204e-16*(z-9.212e15)*(z+0.3517)/((z-0.811)*(z-0.04337));
stepinfo(ftmf)
stepinfo(ftmz2)
step(ftmf,ftmz2)