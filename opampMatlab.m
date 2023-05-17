iniciales = [0 0];
tInicial = 0;
tFinal = .003;
paso = .0000001;
tiempo = [tInicial:paso:tFinal];


[t,x] = ode45(@opamp,tiempo,iniciales);
figure(1)
plot(t,x(:,1));
grid on
xlabel("Tiempo");

figure(2)
plot(t,x(:,2))
grid on
xlabel("Tiempo");

function dx=opamp(t,x)
R1 = 1000;
R3 = 10000;
R4 = 15000;
C1 = 0.1e-6;

b = (R3+R4)/R3;
alpha = b/(R1*R1*C1*C1);
gamma = (1/(R1*C1))+((1-b)/(R1*C1))+(1/(R1*C1));
ta = 1/(R1*R1*C1*C1);

vi = 1;

dx = zeros(2,1);

A = [0 1; -ta -gamma];
B = [0; alpha];

dx(1:2) = A*[x(1);x(2)]+B;
 end