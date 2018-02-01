function r = jac(a,b)
%TEST Summary of this function goes here
%   Detailed explanation goes here
%a=[1,0;0,1];
%b=[1,1;1,0];
c=a&b;
d=a|b;

n=sum(c);
l=sum(n);

m=sum(d);
j=sum(m);

r=l/j;
end

