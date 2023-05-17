% Numeradaor y denominador
num = 2.5e8;
den = [1 5000 1e8]; 
% Funcion transferencia
G = tf(num, den);

plot(step(G))
