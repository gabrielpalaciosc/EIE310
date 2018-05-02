h = 1 : 1000;
x = 1 : 500000;
tic;
[y] = conv(x, h);
s = toc;
% inventa h(n)
% inventa x(n)
% registra instante inicial
% convuelve
% tiempo de cálculo [seg]
N = 2 * length(h) * length(x);    % num. OPF
MFps = 1E-6 * N / s;              % mega flops
fprintf('Millones ops. : %5.0f\n', 1E-6 * N)
fprintf('Tiempo [seg]  : %2.2f\n', s)
fprintf('Veloc. MFLOPS : %5.0f\n\n', MFps)