function y = dxdt01(t,Iu1,Iu2,Iv1,Iv2,Is,gamma,beta,omega,tau)

ff = @(x) max(0,x);

dIu1dt = (-Iu1 + ff(Is - beta*Iv1 - omega*Iu2))/tau; 
dIu2dt = (-Iu2 + ff(Is - beta*Iv2 - omega*Iu1))/tau;
dIv1dt = (-Iv1 + ff(Iu1))/tau; 
dIv2dt = (-Iv2 + ff(Iu2))/tau;

y = [dIu1dt; dIu2dt; dIv1dt; dIv2dt];
