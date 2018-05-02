
fx = 0.05;     % frecuencia [c/m] de x
fs = 0.05;     % frecuencia [c/m] de las sinusoides de la DTFT
for pxg = -180 : 30 : 180, % fase de x en grados
  px = (pi/180) * pxg;     % fase de x en rad
n = [0 : 1 : 19];
x = cos(2*pi * fx * n - px);
c = cos(2*pi * fs * n);
s = sin(2*pi * fs * n);
% vector n
% secuencia x
% componente coseno de la DTFT
% componente seno de la DTFT
PrCos = x .* c;
PrSen = x .* s;
SPC = sum(PrCos);
SPS = sum(PrSen);
% producto punto a punto con comp. coseno
% producto punto a punto con comp. seno
% sumatoria de productos con comp. coseno
% sumatoria de productos con comp. seno
  pcxg = (180/pi) * atan2(SPS, SPC); % calcula fase de x en grados
  fprintf('pxg: %3.0f  SPC = %2.2f  SPS = %2.2f  pcxg = %3.1f \n'...
         , pxg, SPC, SPS, pcxg)
end