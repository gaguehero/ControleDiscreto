clear; close all; clc

f = 10;
tempo = [0:1/(100*f):10/f];
sinal = sin(2*pi*f*tempo);
plot(sinal)