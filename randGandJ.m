function [e,a,b] = randGandJ()
a=0;
b=0;
while a==b
e=rand(1)*.20;
a=round(rand(1)*100);
b=round(rand(1)*100);
end
end

