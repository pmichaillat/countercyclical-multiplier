%
% Compute steady state of the calibrated New Keynesian model
% ys: vector of steady-state values in endo_names order
%

function [ys] = STEADYB()
	
global M_
  
delta = M_.params(5); 
r = M_.params(6); 
omegah = M_.params(7); 
eta = M_.params(8); 
alpha = M_.params(9); 

[u0,vu0,s,zeta]=BLS();
n0=(1-u0)./(1-s);
l0=n0.*(1-zeta);
g0=n0.*zeta;
th0=vu0;
R0=1./delta;
q=@(x)omegah.*x.^(-eta);
y0=l0^alpha;
c0=y0-r./q(th0).*(s.*n0);
	
ys =[1;c0;0;l0;n0;th0;R0;g0];