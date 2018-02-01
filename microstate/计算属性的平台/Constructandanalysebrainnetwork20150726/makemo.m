function  makemo(str,number)
readlist=load(str);
 P=readlist.p;
 % for i=1:number
      % x=P(i,2);
      % y=P(i,3);
       %N(i,1)=x;
      % N(i,2)=y;
      % x1=-x*x/2222.22;
       %y1=-y*y/10000;
      % z1=x1+y1-10.91;
      % u=0.004*exp(z1)*1000000000*2.88;
      % N(i,3)=u;
  %end
  [x,y]=meshgrid(0:0.25:4*pi); 
  x1=-x*x/2222.22;
  y1=-y*y/10000;
  z1=x1+y1-10.91;
   z=0.004*exp(z1)*1000000000*2.88;
   surf(x,y,z);
 xlabel('x轴线');
  ylabel('y轴线');
  ylabel('y轴线');
  title('模型图');
end