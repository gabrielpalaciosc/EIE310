% Datos para el dise�o del filtro
Fs = 200; % frecuencia de muestreo
f = [45 50]; % vector con frecuencias l�mites de bandas
% no se especifican los l�mites 0 y Fs/2
a = [1 0]; % amplitudes deseadas en las bandas
rp = 1; % ripple en la banda de paso
rs = 40; % ripple en la banda de rechazo
% Desviaciones
dev = [(10^(rp/20)-1)/(10^(rp/20)+1) 10^(-rs/20)];
% Estima el orden necesario para lograr las especificaciones
[N, fo, ao, w] = remezord(f, a, dev, Fs);
% Despliega N
N
% Dise�a el filtro
b = remez(N, fo, ao, w);
% Calcula la respuesta de frecuencia obtenida
f1 = 0; % frec. m�nima
f2 = 100; % frec. m�xima
f = [f1 : (f2-f1)/511 : f2];
H = freqz(b, a, f, Fs);
% Grafica Mag[H(f)]
subplot 221; semilogy(f, abs(H));
axis([f1 f2 1e-4 2]); grid
xlabel('f[Hz]'); title('Mag(H) de LPF FIR')
% Lee la se�al, la filtra y graba la se�al filtrada
load('ecg_rdo.txt')
y = conv(ecg_rdo, b);
save 'ecg_fir.txt' y -ascii