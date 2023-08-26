clear; close all; clc;
s=tf('s');
z=tf('z',0.1);
Gps = 16/((s+0.25)*(s+4));
Hs = 400/(s+400);
GpHs = Gps*Hs;
ftml= Gps/(1+GpHs);

%for i = 1:10:150 %deste for, temos que o ganho crítico está entre 101 e 111
%    gaink=i;
%    figure(i)
%    stepplot(gaink*Gps/(1+gaink*GpHs));
%end
%j=1;
%for i = 107.37959:0.00001:107.3796
%    gaink=i;
%    figure(j)
%    stepplot(gaink*Gps/(1+gaink*GpHs));
%    j=j+1;
%end

gainku= 107.37959;
figure(1)
stepplot(gainku*Gps/(1+gainku*GpHs));

cc=pid(64.43,844,1.23);
figure(2)
stepplot(cc*Gps/(1+cc*GpHs));
stepinfo(cc*Gps/(1+cc*GpHs))


Gpz = c2d(Gps,0.1);
GpHz = c2d(GpHs,0.1);
cd=(11.9*z^2-4.7*z+1.23)/(0.1*z*(z-1));
figure(3)
stepplot((cd*Gpz)/(1+cd*GpHz))



Gpz = c2d(Gps,0.01);
GpHz = c2d(GpHs,0.01);
cdadequado=c2d(cc,0.01,'tutsin')
figure(4)
stepplot((cdadequado*Gpz)/(1+cdadequado*GpHz))
stepinfo((cdadequado*Gpz)/(1+cdadequado*GpHz))