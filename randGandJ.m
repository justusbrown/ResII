function [e,a,b]=randGandJ()
b=0;
a=0;
while (b-a)~=0
e=rand(1)*.20;
a=round(rand(1)*100);
b=round(rand(1)*100);
end 