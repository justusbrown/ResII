function [Tot_Time] = Total_TimeGandJ(c0,c1,c2,b,a,i)
dist=abs(c2(i)-c0(i))+abs(c2(i)-c1(i));
Tot_Time=dist/(a-b);
end

