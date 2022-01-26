clear all ; close all; clc
%%
cd /users/andrewatkinson/local_docs/mdpcodefiles/remotesensing/PS6
%%
[TB2013, RTB2013] = geotiffread('ASO_50M_SWE_USCATB_20130429.tif');
[TB2018, RTB2018] = geotiffread('ASO_50M_SWE_USCATB_20180423.tif');

%%

TB2013 = double(TB2013);
TB2013(TB2013<0)=NaN;

TB2018 = double(TB2018);
TB2018(TB2018<0)=NaN;
%%
Dx=50;
Dy=Dx; 
%%
X = (RTB2013.XWorldLimits(1)+Dx/2):Dx:(RTB2013.XWorldLimits(2)-Dx/2);
Y = (RTB2013.YWorldLimits(2)-Dx/2):-Dy:(RTB2013.YWorldLimits(1)+Dx/2);

%%
figure(1);
imagesc(X,Y,TB2013,[0 1]);
c = colorbar;
c.Label.String = 'SWE (m)';
title('SWE 2013','fontsize',15);  
set(gca,'fontsize',15);axis equal; 
ylabel('northing','fontsize',15);
xlabel('easting','fontsize',15); 
title('SWE 2013')

%%
figure(2);
imagesc(X,Y,TB2018,[0 1]);
c = colorbar;
c.Label.String = 'SWE (m)';
title('SWE 2018','fontsize',15);  
set(gca,'fontsize',15);axis equal; 
ylabel('northing','fontsize',15);
xlabel('easting','fontsize',15); 
title('SWE 2018')
%%

TotVolume2018 = sum(TB2018(:),'omitnan');
TotVolume2018KM = TotVolume2018./1000

%%

TotVolume2013 = sum(TB2013(:),'omitnan');
TotVolume2013KM = TotVolume2013./1000
