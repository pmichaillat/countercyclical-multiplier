%==========================================================
% calculate average of key variables in US data, 2001--2011
% Use these averages in calibration
%==========================================================

function [u0,vu0,s,zeta,rhoa,sigmaa]=BLS()

%%=================================================  get data from JOLTS (monthly frequency)
% total separations
fid=fopen('data/JOLTS-TSRNF-2012.txt'); ...
BX = textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', ',');
fclose(fid);
BX=BX(4);
S=BX{1};
S=S./100;

% vacancies
fid=fopen('data/JOLTS-JOLNF-2012.txt');
BX = textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', ',');
fclose(fid);
V=BX{4};

%short series 2001--2011
S=S(2:end-1);
V=V(2:end-1);
jolts=max(size(S));

%%===================================================================   get data from CPS  (monthly  frequency)
%unemployment level
fid=fopen('data/CPS-UL-2012.txt');
BX = textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', ',');
fclose(fid);
UL=BX{4}; 

%unemployment rate
fid=fopen('data/CPS-UR-2012.txt');
BX = textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', ',');
fclose(fid);
UR=BX{4}; 
UR=UR./100;

%short series 2001--2011
ULs=UL((end-1)-jolts+1:end-1); 
URs=UR((end-1)-jolts+1:end-1);


%%==========================================================  get data from CES (monthly frequency)
 %total nonfarm employment level
fid=fopen('data/CES-EMPNF-2012.txt');
BX = textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', ',');
fclose(fid);
N=BX{4};

%total private employment level
fid=fopen('data/CES-EMPPRIV-2012.txt');
BX = textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', ',');
fclose(fid);
L=BX{4}; 

%total government employment level
fid=fopen('data/CES-EMPGOV-2012.txt');
BX = textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', ',');
fclose(fid);
G=BX{4}; 

%short series 2001--2011
N=N((end-1)-jolts+1:end-1);
L=L((end-1)-jolts+1:end-1);
G=G((end-1)-jolts+1:end-1);

%%===================================================================  Some important moments
% labor market tightness -- ratio of levels
TH=V./ULs;
u0=mean(URs);
vu0=mean(TH);
s=mean(S)./4; %use weekly frequency in calibration
zeta=mean(G./N);


%%==============================================================================
%%construct the time series for technology from US data, HP-filter it, and report momemts of the series 
%% moments are obtained by estimating a weekly AR(1) process
%% data source: BLS MSPC, nonfarm business sector, quarterly frequency.
%%==============================================================================

whp=10^5;%weight on hp filter for quarterly data
labshare=0.66; %labor share, following convention

fid=fopen('data/MSPC-OUTPUT-2012.txt');
BX= textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', '\t');
fclose(fid);
OUTPUT=BX{4};

fid=fopen('data/MSPC-EMP-2012.txt');
BX= textscan(fid,'%s %s %s %f','HeaderLines',1,'delimiter', '\t');
fclose(fid);
EMP=BX{4};

%% focus on the period 1947:Q1--2011:Q4
EMP=EMP(1:end-1);
OUTPUT=OUTPUT(1:end-1);
OUTPUT=log(OUTPUT);
EMP=log(EMP);
Az=OUTPUT-labshare.*EMP;

%obtain detrended log techno with HP filter
[atrend,ahp]=hpfilter(Az,whp);

%estimate AR(1) process from quarterly data
mz=ar(ahp,1,'ls');
polyz=mz.a;
rhoQ=-polyz(2);
sigmaQ=mz.NoiseVariance;
sigmaQ=sigmaQ^0.5;

% convert coefficients such that they are valid at weekly frequency
rhoa=(rhoQ).^(1./13);
sigmaa=sigmaQ./(1+rhoa^2+rhoa^4+rhoa^6+rhoa^8+rhoa^10+rhoa^12+rhoa^14+rhoa^16+rhoa^18+rhoa^20+rhoa^22+rhoa^24).^(0.5); 


