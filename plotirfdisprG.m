%
% Plot impulse response functions (IRFs) from the Dynare simulations of the calibrated New Keynesian model
% Simulate recessions: the response of the economy to negative technology shocks
% Plot two series of IRFs
% (1) no government response: public employment remains constant over time
% (2) government intervention: the government increases public employment when the technology shock occurs
%

close all;clear all;

%% Dynare simulation  without government intervention

dynare modelNKdisprG
RES=oo_.endo_simul;
num=M_.endo_nbr;
nam=M_.endo_names;
perio=options_.periods;
IRF=RES; % Include t=0 and t=T+1 at their steady-state value
 
top=400;
rang=[1:top];
version='Gdispr';
sizeparam=9;
q=@(x)omegah.*x.^(-eta);
f=@(x)omegah.*x.^(1-eta);

%% Analysis 

apos=1;cpos=2;pipos=3;lpos=4;npos=5;thpos=6;rpos=7;gpos=8;upos=9;ypos=10;hpos=11;rrpos=12;hgpos=13;hlpos=14;vacpos=15;costpos=16;gdppos=17;
namg={'Technology','Consumption of final good','Inflation rate (annualized)','Private employment','Employment','Labor market tightness','Nominal interest rate (annualized)',...
'Public employment','Unemployment','Output','Number of hires','Real interest rate (annualized)','Hires in the public sector','Hires in the private sector','Vacancies per hire','Marginal hiring cost per hire','Gross domestic product (GDP)'};

[ys] = STEADYB();
gss=ys(8);
IRF(rpos,:)=IRF(rpos,:).^(52)-1; % Annualize interest rate
IRF(pipos,:)=(IRF(pipos,:)+1).^(52)-1; % Annualize inflation
IRF(gpos,:)=gss.*ones(size(IRF(1,:)));
IRF(upos,:)=1-(1-s).*IRF(npos,:);
IRF(ypos,:)=IRF(apos,:).*IRF(lpos,:).^alpha;
IRF(hpos,2:end)=IRF(npos,2:end)-(1-s).*IRF(npos,1:end-1);
IRF(rrpos,1:end-1)=(IRF(rpos,1:end-1)+1)./(IRF(pipos,2:end)+1)-1;
IRF(hgpos,2:end)=IRF(gpos,2:end)-(1-s).*IRF(gpos,1:end-1);
IRF(hlpos,2:end)=IRF(lpos,2:end)-(1-s).*IRF(lpos,1:end-1);
IRF(vacpos,:)=1./q(IRF(thpos,:));
IRF(costpos,1:end-1)=r.*IRF(apos,1:end-1)./q(IRF(thpos,1:end-1))-delta.*(1-s).*r.*IRF(apos,2:end)./q(IRF(thpos,2:end));
IRF(gdppos,2:end)=IRF(ypos,2:end)+IRF(gpos,2:end).*omega.*IRF(apos,2:end).^gamma+IRF(hgpos,2:end).*r.*IRF(apos,2:end)./q(IRF(thpos,2:end));

% Cut first and last periods that are steady-state values
IRF=IRF(:,2:end-1);

%% IRF without government intervention 

gralm=[apos,gpos,thpos,lpos,upos,gdppos]; 

figure(4)
clf
for j=1:6
   	subplot(3,2,j)
	plot(rang,IRF(gralm(j),rang),'-b','LineWidth',2)
	axis tight
	title(namg{gralm(j)},'FontSize',sizeparam)
	 	if j<=4
	   		set(gca,'YGrid','on','XGrid','on','XTickLabel','','FontSize',sizeparam)
	 	else
	 		set(gca,'YGrid','on','XGrid','on','FontSize',sizeparam)
	 		xlabel('Weeks after shock','FontSize',sizeparam)
	 	end
end
print('-depsc',['IRFprelm_',version,'.eps'])

%% Preparation for simulation with government intervention

STOREIRF(:,:,1)=IRF;
save(['storefile.mat'],'STOREIRF','version','rang','namg','sizeparam','gralm','gra','rpos','pipos','npos','lpos','upos','hpos','hlpos','hgpos','ypos','apos','gpos','vacpos','rrpos','thpos','cpos','costpos','gdppos');

UN=ones(perio+2,1); % There is one lag and one lead
GUN=IRF(gpos,:)';
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
gexo=[ys(gpos);GUN;ys(gpos)];
g=gendo+gexo;

save('INNIT.mat','n','th','l','pie','c','a','g','R','gendo','hireg','epsa','gexo') ;

%% Simulation with government intervention

dynare modelGdisprG
RES=oo_.endo_simul;
IRF=RES;

load('storefile.mat');
[ys] = STEADYB();
q=@(x)omegah.*x.^(-eta);
f=@(x)omegah.*x.^(1-eta);
gdpss=ys(apos).*ys(lpos).^alpha+ys(gpos).*omega.*ys(apos).^gamma+r.*ys(apos).*s.*ys(gpos)./q(ys(thpos));

IRF(rpos,:)=IRF(rpos,:).^(52)-1; % Annualize interest rate
IRF(pipos,:)=(IRF(pipos,:)+1).^(52)-1; % Annualize inflation
IRF(upos,:)=1-(1-s).*IRF(npos,:);
IRF(ypos,:)=IRF(apos,:).*IRF(lpos,:).^alpha;
IRF(hpos,2:end)=IRF(npos,2:end)-(1-s).*IRF(npos,1:end-1);
IRF(rrpos,1:end-1)=(IRF(rpos,1:end-1)+1)./(IRF(pipos,2:end)+1)-1;
IRF(hgpos,2:end)=IRF(gpos,2:end)-(1-s).*IRF(gpos,1:end-1);
IRF(hlpos,2:end)=IRF(lpos,2:end)-(1-s).*IRF(lpos,1:end-1);
IRF(vacpos,:)=1./q(IRF(thpos,:));
IRF(costpos,1:end-1)=r.*IRF(apos,1:end-1)./q(IRF(thpos,1:end-1))-delta.*(1-s).*r.*IRF(apos,2:end)./q(IRF(thpos,2:end));
IRF(gdppos,2:end)=IRF(ypos,2:end)+IRF(gpos,2:end).*omega.*IRF(apos,2:end).^gamma+IRF(hgpos,2:end).*r.*IRF(apos,2:end)./q(IRF(thpos,2:end));
IRF=IRF(:,2:end-1);
STOREIRF(:,:,2)=IRF;

%% IRF with government intervention 

figure(4)
for j=1:6
   	subplot(3,2,j)
	hold on
	plot(rang,IRF(gralm(j),rang),'--r','LineWidth',2)
	axis tight
end
print('-depsc',['IRFpostlm_',version,'.eps'])

%% Compare two simulations to compute instantaneous multiplier

rangm=[1:1000];

MULTIPLIER=(STOREIRF(npos,rangm,2)-STOREIRF(npos,rangm,1))./(STOREIRF(gpos,rangm,2)-STOREIRF(gpos,rangm,1));

figure(9)
clf
plot(rang,MULTIPLIER(rang),'-b','LineWidth',4)
set(gca,'YGrid','on','XGrid','on','FontSize',22)
xlabel('Weeks after shock','FontSize',22)
xlim([0,400])
ylim([0,0.7])
ylabel('Instantaneous multiplier','FontSize',22)
print('-depsc',['INST_',version,'.eps'])

FGx=(omega.*STOREIRF(apos,rangm,1).^gamma).*STOREIRF(gpos,rangm,1)+STOREIRF(hgpos,rangm,1).*r.*STOREIRF(apos,rangm,1)./q(STOREIRF(thpos,rangm,1));
FGy=(omega.*STOREIRF(apos,rangm,2).^gamma).*STOREIRF(gpos,rangm,2)+STOREIRF(hgpos,rangm,2).*r.*STOREIRF(apos,rangm,2)./q(STOREIRF(thpos,rangm,2));
DC=FGy-FGx;
MULTIPLIER_GDP=gdpss.*((STOREIRF(npos,rangm,2)-STOREIRF(npos,rangm,1))./DC);

figure(10)
clf
plot(rang,MULTIPLIER_GDP(rang),'-b','LineWidth',4)
set(gca,'YGrid','on','XGrid','on','FontSize',22)
xlabel('Weeks after shock','FontSize',22)
xlim([0,400])
ylim([0,1])
ylabel('Instantaneous multiplier','FontSize',22)
print('-depsc',['INSTGDP_',version,'.eps'])