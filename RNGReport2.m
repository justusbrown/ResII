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
plot(best)
plot(price,lower)
hold off
%%
%The algorithm

n=length(price);
initPrice=price(n);
initRig=wells(n);

iter=0;
i=0;
c0();
c1();
c2();
c3();

%For realization=1:12000000
[e,a,b]=randGandJ();

while sum(Tot_Time) <= 60 && iter<10000000

iter=iter+1;
i=i+1;
c0(i)=initPrice;

    
if (a-b)>0
    c1(i)=upperGandJ(c0, best, up);
    updist=c1(i)-c0(i);
    c2(i)=c1(i)+updist*e;
    Tot_Time(i)=Total_TimeGandJ(c0,c1,c2,b,a,i);
    option=1;
else
    c1(i)=lowerGandJ(c0,best,low);
    downdist=c1(i)-c0(i);
    c2(i)=c1(i)+downdist*e;
    Tot_Time(i)=Total_TimeGandJ(c0,c1,c2,b,a,i);
    option=2;
end
if option==2 %may need to add an option for b-a=a or should we just say it can't be
    range_c=(c1(i)-best.Coefficients.Estimate(1))/best.Coefficients.Estimate(2);
    range_l=(c1(i)-best.Coefficients.Estimate(1)-low)/best.Coefficients.Estimate(2);
    range_u=(c1(i)+200);
    range_d=(c1(i)-200);
    sam=hist.
    %need to subset the data given this box
else 
    range_c=(c1(i)-best.Coefficients.Estimate(1))/best.Coefficients.Estimate(2);
    range_r=(c1(i)-best.Coefficients.Estimate(1)-up)/best.Coefficients.Estimate(2);
    range_u=(c1(i)+200);
    range_d=(c1(i)-200);
    %need to subset the data given this box
end
%once subsetted need to find a random point within the box to call the new
%c0 


c0(i+1)=c3(i);
end


