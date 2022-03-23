%
% Calibrate the economic environment for the New Keynesian model
% All parameters are computed at weekly frequency
%

function [phirx,phix,phipix,Dx,sx,deltax,rx,omegahx,etax,alphax,omegax,gammax,R0x,rhoax,epsilonx,sigmaax,zetax,valgx]=SETUPB()

%public-employment response to shock
valgx=0.0001;

%% Parameters calibrated from BLS data

[u0,vu0,sx,zetax,rhoax,sigmaax]=BLS();
n0=(1-u0)./(1-sx);
l0=n0.*(1-zetax);
g0=n0.*zetax;
th0=vu0;

%% Parameters calibrated in the literature from microdata and macrodata

alphax=0.66;
deltax=0.95.^(1./52); 
R0x=1./deltax;
etax=0.7; 	
gammax=0.5; 
Dx=deltax.*(1-sx);
phix=61;
epsilonx=11;
phipix=1.5;
phirx=(0.6)^(1/13);

%% Parameters calibrated to match average level of key variables

omegahx=(sx./(1-sx).*(1-u0)./(u0).*th0.^(etax-1)); 
cost=0.32;
q=@(x)omegahx.*x.^(-etax);
f=@(x)omegahx.*x.^(1-etax);
costr=(1-Dx).*cost./q(th0);
M=epsilonx./(epsilonx-1);
omegax=(alphax./M.*l0.^(alphax-1))./(1+costr);
rx=cost.*omegax;