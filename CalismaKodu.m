clear all
close all
clc

Is = 10e-9;
Itau = 25e-9;
C = 1e-9;
Vt = 26*10e-3;
gamma = 0.33;
beta = 3;
omega = 3;
tau = C*Vt/Itau;
% tau =10.4e-3;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
%x0 = [0;0;0;0];
x0 = 1e-10*rand(4,1);
tspan = linspace(0,0.6,1e3);

% opts = odeset;
opts = odeset('Reltol',1e-12,'Abstol',1e-12);
[tt,xx] = ode15s(dxdt, tspan, x0, opts);

figure
subplot(3,1,1)
% plot(tt,xx,'linewidth',2);
% legend('Iu1','Iu2','Iv1','Iv2');
plot(tt,xx(:,1)*1e9,'linewidth',2);
hold on
plot(tt,xx(:,3)*1e9,'linewidth',2);
title('\tau = 10.4 milliseconds')
ylabel('I_{u1}, I_{v1}(nA)')
xlabel('time(seconds)')
legend('I_{u1}','I_{v1}');
hold off
grid;

Itau = 25e-9;
C = 5e-9;
Vt = 26*10e-3;
tau = C*Vt/Itau;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
x0 = 1e-10*rand(4,1);
tspan = linspace(0,3,1e3);

% opts = odeset;
opts = odeset('Reltol',1e-12,'Abstol',1e-12);
[tt,xx] = ode15s(dxdt, tspan, x0, opts);

subplot(3,1,2)
% plot(tt,xx,'linewidth',2);
% legend('Iu1','Iu2','Iv1','Iv2');
plot(tt,xx(:,1)*1e9,'linewidth',2);
hold on
plot(tt,xx(:,3)*1e9,'linewidth',2);
title('\tau = 52 milliseconds')
ylabel('I_{u1}, I_{v1}(nA)')
xlabel('time(seconds)')
legend('I_{u1}','I_{v1}');
hold off
grid;

Itau = 25e-9;
C = 10e-9;
Vt = 26*10e-3;
tau = C*Vt/Itau;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
x0 = 1e-10*rand(4,1);
tspan = linspace(0,6,1e3);

% opts = odeset;
opts = odeset('Reltol',1e-12,'Abstol',1e-12);
[tt,xx] = ode15s(dxdt, tspan, x0, opts);

subplot(3,1,3)
% plot(tt,xx,'linewidth',2);
% legend('Iu1','Iu2','Iv1','Iv2');
plot(tt,xx(:,1)*1e9,'linewidth',2);
hold on
plot(tt,xx(:,3)*1e9,'linewidth',2);
title('\tau = 104 milliseconds')
ylabel('I_{u1}, I_{v1}(nA)')
xlabel('time(seconds)')
legend('I_{u1}','I_{v1}');
hold off
grid;

Itau = 25e-9;
C = 1e-9;
Vt = 26*10e-3;
tau = C*Vt/Itau;
%% phase portrait girdileri
limits = [1 40;1 40] * 1e-10;
axis = [1  3];%çizdirdiðim denklem Ör:Iui-Ivi
sample = 10;%kaç tane baþlangýç noktasý olacak
dimension=4;%denklem sayýsý

%% beta deðiþecek
figure
phasePotrait4(dxdt,limits,axis,dimension,sample)
hold on

beta = 2.5;
dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
phasePotrait4(dxdt,limits,axis,dimension,sample)

beta = 3.5;
dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
phasePotrait4(dxdt,limits,axis,dimension,sample)
title('\beta Effect')
ylabel('I_{vi}(nA)')
xlabel('I_{ui}(nA)')
legend('\beta = 3','\beta = 2.5','\beta = 3.5')
hold off

%% Omega deðiþecek

Is = 10e-9;
Itau = 25e-9;
C = 1e-9;
Vt = 26*10e-3;
gamma = 0.33;
beta = 3;
omega = 3;
tau = C*Vt/Itau;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);

figure
phasePotrait4(dxdt,limits,axis,dimension,sample)
hold on

omega = 2.5;
dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
phasePotrait4(dxdt,limits,axis,dimension,sample)

omega = 3.5;
dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
phasePotrait4(dxdt,limits,axis,dimension,sample)
title('\omega Effect')
ylabel('I_{vi}(nA)')
xlabel('I_{ui}(nA)')
legend('\omega = 3','\omega = 2.5','\omega = 3.5')
hold off

%% Tau deðiþecek

Is = 10e-9;
Itau = 25e-9;
C = 1e-9;
Vt = 26*10e-3;
gamma = 0.33;
beta = 3;
omega = 3;
tau = C*Vt/Itau;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);

figure
phasePotrait4(dxdt,limits,axis,dimension,sample)
hold on

Itau = 25e-9;
C = 5e-9;
Vt = 26*10e-3;
tau = C*Vt/Itau;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
phasePotrait4_2(dxdt,limits,axis,dimension,sample)

Itau = 25e-9;
C = 10e-9;
Vt = 26*10e-3;
tau = C*Vt/Itau;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
phasePotrait4_3(dxdt,limits,axis,dimension,sample)
title('\tau Effect')
ylabel('I_{vi}(nA)')
xlabel('I_{ui}(nA)')
legend('\tau = 10.4 milliseconds','\tau = 52 milliseconds','\tau = 104 milliseconds')
hold off

%% Is deðiþecek

Is = 10e-9;
Itau = 25e-9;
C = 1e-9;
Vt = 26*10e-3;
gamma = 0.33;
beta = 3;
omega = 3;
tau = C*Vt/Itau;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
%x0 = [0;0;0;0];
x0 = 1e-10*rand(4,1);
tspan = linspace(0,0.6,1e3);

% opts = odeset;
opts = odeset('Reltol',1e-12,'Abstol',1e-12);
[tt,xx] = ode15s(dxdt, tspan, x0, opts);

figure
subplot(3,1,1)
% plot(tt,xx,'linewidth',2);
% legend('Iu1','Iu2','Iv1','Iv2');
plot(tt,xx(:,1)*1e9,'linewidth',2);
hold on
plot(tt,xx(:,3)*1e9,'linewidth',2);
title('I_{s} = 10 nanoAmpere')
ylabel('I_{u1}, I_{v1}(nA)')
xlabel('time(seconds)')
legend('I_{u1}','I_{v1}');
hold off
grid;

Is = 1e-9;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
%x0 = [0;0;0;0];
x0 = 1e-10*rand(4,1);
tspan = linspace(0,0.6,1e3);

% opts = odeset;
opts = odeset('Reltol',1e-12,'Abstol',1e-12);
[tt,xx] = ode15s(dxdt, tspan, x0, opts);

subplot(3,1,2)
% plot(tt,xx,'linewidth',2);
% legend('Iu1','Iu2','Iv1','Iv2');
plot(tt,xx(:,1)*1e9,'linewidth',2);
hold on
plot(tt,xx(:,3)*1e9,'linewidth',2);
title('I_{s} = 1 nanoAmpere')
ylabel('I_{u1}, I_{v1}(nA)')
xlabel('time(seconds)')
legend('I_{u1}','I_{v1}');
hold off
grid;

Is = 100e-9;

dxdt = @(t,x) dxdt01(t,x(1,:),x(2,:),x(3,:),x(4,:),Is,gamma,beta,omega,tau);
%x0 = [0;0;0;0];
x0 = 1e-10*rand(4,1);
tspan = linspace(0,0.6,1e3);

% opts = odeset;
opts = odeset('Reltol',1e-12,'Abstol',1e-12);
[tt,xx] = ode15s(dxdt, tspan, x0, opts);

subplot(3,1,3)
% plot(tt,xx,'linewidth',2);
% legend('Iu1','Iu2','Iv1','Iv2');
plot(tt,xx(:,1)*1e9,'linewidth',2);
hold on
plot(tt,xx(:,3)*1e9,'linewidth',2);
title('I_{s} = 100 nanoAmpere')
ylabel('I_{u1}, I_{v1}(nA)')
xlabel('time(seconds)')
legend('I_{u1}','I_{v1}');
hold off
grid;