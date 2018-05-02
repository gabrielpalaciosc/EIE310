function [M, A] = dtft2(x, n, w)
% M = magnitudes de la DTFT calculadas en las frecuencias w
% A = ángulos [rad] de la DTFT calculados en las frecuencias w
% x = secuencia en función de n
% n = vector con índices de x
% w = vector con frecuencias deseadas
[x, n] = impulso(0, -10, 10);
w = [0 : 0.01 : 1] * pi;
[X] = dtft(x, n, w);
subplot 221; plot(w/pi, abs(X));
xlabel('w / Pi [rad/m]');
title('DTFT de impulso'); grid