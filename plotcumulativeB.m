%
% Compute and display the cumulative public-employment multiplier over the business cycle
% The multiplier is obtained from Dynare simulations of the calibrated New Keynesian model
% The public-employment policy considered is that public employment remains a constant fraction of private employment in absence of government intervention 
%

clear all;close all;

%% Simulate a series of IRFs, with and without government intervention, for a series of technology shocks

% Start from most negative technology shock, without government intervention
dynare modelNKm13B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
i=1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1); % There is one lag and one lead
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

% Compute effect of government intervention for the most negative shock
dynare modelGm13B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm11B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelGm11B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm9B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelGm9B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm7B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelGm7B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm5B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelGm5B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative 
dynare modelNKm3B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelGm3B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm1B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelGm1B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, slightly positive  
dynare modelNK1B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG1B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK3B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG3B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK5B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG5B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK7B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG7B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK9B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG9B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK11B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG11B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK13B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG13B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');


% Next technology shock, a bit more positive
dynare modelNK17B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG17B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK21B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

perio=options_.periods;
UN=ones(perio+2,1);
GUN=IRF(8,:)';
[ys] = STEADYB();
a=ys(1).*UN;
c=ys(2).*UN;
pie=ys(3).*UN;
l= ys(4).*UN;
n=ys(5).*UN;
th=ys(6).*UN;
R=ys(7).*UN;
gendo=0.*UN;
hireg=0.*UN;
epsa=0.*UN;
gexo=[ys(8);GUN;ys(8)];
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

dynare modelG21B
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

%% Compute and plot multipliers over the business cycle

load('storefileM.mat');
version='B';
q=@(thx)omegah.*thx.^(-eta);

apos=1;lpos=4;npos=5;thpos=6;gpos=8;upos=9;hgpos=10;
[ys] = STEADYB();
nss=ys(npos);
gss=ys(gpos);
gdpss=ys(apos).*ys(lpos).^alpha+ys(gpos).*omega.*ys(apos).^gamma+r.*ys(apos).*s.*ys(gpos)./q(ys(thpos));
STOREIRF(upos,:,:,:)=1-(1-s).*STOREIRF(npos,:,:,:);
STOREIRF(hgpos,2:end,:,:)=STOREIRF(gpos,2:end,:,:)-(1-s).*STOREIRF(gpos,1:end-1,:,:);
STOREIRF(hgpos,1,:,:)=STOREIRF(gpos,1,:,:)-(1-s).*gss;

% Compute peak unemployment to measure size of shock
numneg=7;
maxx=squeeze(max(STOREIRF(upos,:,:,1),[],2));
minx=squeeze(min(STOREIRF(upos,:,:,1),[],2));
UNEMPx=[maxx(1:numneg);minx(numneg+1:end)]	

% Compute multiplier by accumulating number of worker*week in public sector and number of worker*week crowded out in private sector
Gx=squeeze(sum(STOREIRF(gpos,:,:,1),2)); % Public employees*week	
Gy=squeeze(sum(STOREIRF(gpos,:,:,2),2)); % Public employees*week
Nx=squeeze(sum(STOREIRF(npos,:,:,1),2)); % Total employees*week before g
Ny=squeeze(sum(STOREIRF(npos,:,:,2),2)); % Total employees*week after g
Lx=squeeze(sum(STOREIRF(lpos,:,:,1),2)); % Total employees*week before g
Ly=squeeze(sum(STOREIRF(lpos,:,:,2),2)); % Total employees*week after g
DG=Gy-Gx;
DN=Ny-Nx;
DL=Ly-Lx;

% Compute real cost of employing public workers in terms of consumption goods
FGx=(omega.*STOREIRF(apos,:,:,1).^gamma).*STOREIRF(gpos,:,:,1)+STOREIRF(hgpos,:,:,1).*r.*STOREIRF(apos,:,:,1)./q(STOREIRF(thpos,:,:,1));
CGx=squeeze(sum(FGx,2));
FGy=(omega.*STOREIRF(apos,:,:,2).^gamma).*STOREIRF(gpos,:,:,2)+STOREIRF(hgpos,:,:,2).*r.*STOREIRF(apos,:,:,2)./q(STOREIRF(thpos,:,:,2));
CGy=squeeze(sum(FGy,2));
DC=CGy-CGx;

% Plot results
xin=[5 6 7 8];
new_xticks=['5%';'6%';'7%';'8%'];

figure(10)
clf
plot((UNEMPx.*100),DN./DG,'-b','LineWidth',4)
set(gca,'YGrid','on','XGrid','on','FontSize',22)
xlabel('Unemployment rate','FontSize',22)
axis tight
ylim([0,0.6])
set(gca,'XTick',xin)
set(gca,'xticklabel',new_xticks)
ylabel('Cumulative multiplier','FontSize',22)
saveas(gcf,['figures/CUM_',version,'.fig'])
print('-depsc',['graph/CUM_',version,'.eps'])

figure(22)
clf
plot((UNEMPx.*100),gdpss.*DN./DC,'-b','LineWidth',4)
set(gca,'YGrid','on','XGrid','on','FontSize',22)
xlabel('Unemployment rate','FontSize',22)
axis tight
ylim([0,1])
set(gca,'XTick',xin)
set(gca,'xticklabel',new_xticks)
ylabel('Cumulative multiplier','FontSize',22)
saveas(gcf,['figures/CUMGDP_',version,'.fig'])
print('-depsc',['graph/CUMGDP_',version,'.eps'])