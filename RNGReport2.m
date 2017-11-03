%%This inputs the data and gets it in a usable format
hist=readtable('Data.csv');
price=hist.OilPrice_WTI_;
time=hist.Time;
wells=hist.ActiveWells;

%%
%this plots the historical data
scatter(price, wells);
xlabel('WTI Oil Price ($/bbl)')
ylabel('Number of Active Wells')
xlim([min(price)*.6 max(price)*1.2]);
ylim([min(wells)*.6 max(wells)*1.2]);

%%
%this creates a linear regression model and calculates the max distance
%from model. then using this it creates a linear model above and below. I
%need help here
best=LinearModel.fit(price,wells);
modelwells=best.Coefficients.Estimate(2)*price+best.Coefficients.Estimate(1);
dist=wells-modelwells;
up=max(dist);
low=min(dist);
upper=best.Coefficients.Estimate(2)*price+best.Coefficients.Estimate(1)+up;
lower=best.Coefficients.Estimate(2)*price+best.Coefficients.Estimate(1)+low;

scatter(price,wells);
xlabel('WTI Oil Price ($/bbl)')
ylabel('Number of Active Wells')
xlim([min(price)*.6 max(price)*1.2]);
ylim([min(wells)*.6 max(wells)*1.2]);
hold on
plot(price,upper)
plot(price,lower)

%%
%this calls the linear models and gives the value of num of wells for a
%given wti
n=length(price);
[top]=upperGandJ(1200,best,up);
[bottom]=lowerGandJ(1200,best,low);
[e,a,b]=randGandJ();
delta=b-a;

initPrice=price(n)
initRig=wells(n)

%distance from model to top
updist=upperGandJ(initPrice, best, up)-initRig
downdist=lowerGandJ(initPrice,best,low)-initRig



priceincrease=[initPrice:upperGandJ(initRig, best, up)]'
assoc_rigs=repmat(initRig, length(priceincrease))
plot(priceincrease, assoc.rigs)
%Starting from initial condition, use the net wells added each find 
%(march along vertical direction (constant price) and continue until
% you reach to the upper/lower band) to find the time required to 
%reach the limiting border. Mark down the intersection point as c1


