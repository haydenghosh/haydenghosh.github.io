clc; clear; close all;
%% sound for approximation of 440 Hz
fs = 44100;
f = 440;
T = 1/f;
duration = 3;
periods = duration/T;
t = 0:1/fs:duration;
parabolic_approx = zeros(size(t));
for n = 0:periods-1
    parabolic_approx = parabolic_approx + pulse(t-n*T,f);
    parabolic_approx = parabolic_approx - pulse(t-n*T-T/2,f);
end
parabolic_approx = (parabolic_approx/max(parabolic_approx))*0.5;
sound(parabolic_approx,fs);
audiowrite('parabolic_approx.wav',parabolic_approx,fs);

pure_sinusoid = 0.5*sin(2*pi*f*t);
audiowrite('pure_sinusoid.wav',pure_sinusoid,fs);
