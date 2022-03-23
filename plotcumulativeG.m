%
% Compute and display the cumulative public-employment multiplier over the business cycle
% The multiplier is obtained from Dynare simulations of the calibrated New Keynesian model
% The public-employment policy considered is that public employment remains constant in absence of government intervention 
%

clear all;close all;

%% Simulate a series of IRFs, with and without government intervention, for a series of technology shocks 

% Start from most negative technology shock, without government intervention
dynare modelNKm13G
perio=options_.periods;
UN=ones(perio+2,1);%there is one lag and one lead
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
i=1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Compute effect of government intervention for the most negative shock
dynare modelGm13G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm11G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelGm11G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm9G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelGm9G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm7G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelGm7G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm5G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelGm5G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm3G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelGm3G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit less negative  
dynare modelNKm1G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelGm1G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, slightly positive  
dynare modelNK1G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG1G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK3G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG3G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK5G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG5G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK7G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG7G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK9G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG9G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK11G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG11G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK13G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG13G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK17G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG17G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

% Next technology shock, a bit more positive
dynare modelNK21G
perio=options_.periods;
UN=ones(perio+2,1);
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
gexo=ys(8).*UN;
g=gendo+gexo;
save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

RES=oo_.endo_simul;
IRF=RES(1:7,2:end-1);
IRF=[IRF;ys(8).*ones(size(IRF(1,:)))];
load('storefileM.mat');
i=i+1;
STOREIRF(:,:,i,1)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

dynare modelG21G
RES=oo_.endo_simul;
IRF=RES(1:8,2:end-1);
load('storefileM.mat');
STOREIRF(:,:,i,2)=IRF;
save(['storefileM.mat'],'STOREIRF','i');

%% Compute and plot multipliers over the business cycle

load('storefileM.mat');
version='G';
q=@(thx)omegah.*thx.^(-eta);

apos=1;lpos=4;npos=5;thpos=6;gpos=8;upos=9;hgpos=10; ...
[ys] = STEADYB();
nss=ys(npos);
gss=ys(gpos);
gdpss=ys(apos).*ys(lpos).^alpha+ys(gpos).*omega.*ys(apos).^gamma+r.*ys(apos).*s.*ys(gpos)./q(ys(thpos));
STOREIRF(upos,:,:,:)=1-(1-s).*STOREIRF(npos,:,:,:);
STOREIRF(hgpos,2:end,:,:)=STOREIRF(gpos,2:end,:,:)-(1-s).*STOREIRF(gpos,1:end-1,:,:);
STOREIRF(hgpos,1,:,:)=STOREIRF(gpos,1,:,:)-(1-s).*gss;

% Compute peak unemployment to measure size of shock
numneg=7; % Number of negative shocks
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

% Compute real cost of employing public workers
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
