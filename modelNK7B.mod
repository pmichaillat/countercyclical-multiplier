// Declare New Keynesian model model in which public employment is a constant fraction of private employment

// Endogenous variables
var a c pie l n th R g;

// Innovations
varexo  epsa;

// Parameters
parameters phi phipi D s delta r omegah eta alpha omega gamma R0 rhoa epsilon sigmaa  phir zeta;

[phirx,phix,phipix,Dx,sx,deltax,rx,omegahx,etax,alphax,omegax,gammax,R0x,rhoax,epsilonx,sigmaax,zetax]=SETUPB();

zeta=zetax;
phir=phirx;
phi=phix;
phipi=phipix;
D=Dx;
s=sx;
r=rx;
omegah=omegahx;
eta=etax;
alpha=alphax;
omega=omegax;
gamma=gammax;
R0=R0x;
rhoa=rhoax;
sigmaa=sigmaax;
epsilon=epsilonx;
delta=deltax;

// Model

model;

# q = omegah*th^(-eta);
# f = min(1,omegah*th^(1-eta));
# qn = omegah*th(+1)^(-eta);
# u = 1-(1-s)*n(-1);
# h = n-(1-s)*n(-1);
# w = omega*a^gamma;
# y = a*(l^alpha);
# mpl = a*alpha*l^(alpha-1);

//Monetary policy rule

R = max(1,R0*(1+pie)^(phipi*(1-phir))*(R(-1)/R0)^phir);

//Euler equation
1/R = delta*c/(c(+1)*(1+pie(+1)));

// Resource constraint
y=c*(1+(phi/2)*pie^2)+(r/q)*h*a;

//New Keynesian Phillips Curve
pie*(1+pie)=1/phi*(epsilon*((1/mpl)*(w+a*r/q-D*(c/c(+1))*a(+1)*r/qn))+(1-epsilon))*(y/c)+ delta*pie(+1)*(1+pie(+1));

//Laws of motion
n=l+g;
n=(1-s)*n(-1)+u*f;
g=zeta*n;

//Technology Shocks

log(a) = rhoa* log(a(-1))+epsa;

end;

[ys] = STEADYB();
ass=ys(1);
css=ys(2);
piess=ys(3);
lss= ys(4);
nss=ys(5);
thss=ys(6);
Rss=ys(7);
gss=ys(8);

initval;
n=nss;
th=thss;
l=lss; 
pie=piess;
c=css;
a = ass;
g=gss;
R=Rss;
epsa=0;
end;

shocks;
var epsa;
periods 1;
values (7*sigmaa);
end;

options_.maxit_=35;
options_.dynatol=10^(-13);

simul(periods=15000);

