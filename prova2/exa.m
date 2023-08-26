s=tf('s');
z=tf('z',0.1);
Gps = 16/((s+0.25)*(s+4));
Hs = 400/(s+400);
GpHs = Gps*Hs;
GpHz = c2d(GpHs,0.1);
GpHzpz = zpk(GpHz)
w=(1+0.05*s)/(1-0.05*s);
GpHw=(0.066531*(w+0.9555)*(w+0.001039))/(w*(w-0.9753)*(w-0.6703));
GpHwpz=zpk(GpHw);
GpHwpzsimp=minreal(GpHwpz);
gainK = 19.37;
margin(gainK*GpHwpzsimp)
Dw=19.37*((4.02*s+1)/(105.73*s+1));
Dz=c2d(Dw,0.1,'tustin');
Dzpz=zpk(Dz)
controlado=GpHzpz*Dz;
margin(controlado)

Gpz = c2d(Gps,0.1);
step((Gpz*Dz)/(1+controlado))
stepinfo((Gpz*Dz)/(1+controlado))
