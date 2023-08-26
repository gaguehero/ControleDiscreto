s=tf('s');
z=tf('z',0.1);
Gps = 16/((s+0.25)*(s+4));
Gpz = c2d(Gps,0.1);
Hs = 400/(s+400);
GpHs = Gps*Hs;
GpHz = c2d(GpHs,0.1);
GpHzpz = zpk(GpHz);
ganhoK=0.5625;

w=(1+0.05*s)/(1-0.05*s);
GpHw=(0.066531*(w+0.9555)*(w+0.001039))/(w*(w-0.9753)*(w-0.6703));
GpHwpz=zpk(GpHw);
GpHwpzsimp=minreal(GpHwpz);
gainK=0.5625;
margin(gainK*GpHwpzsimp)
Dz=0.5625;
ftml=(Dz*Gpz)/(1+Dz*GpHzpz);
step(ftml)
stepinfo(ftml)