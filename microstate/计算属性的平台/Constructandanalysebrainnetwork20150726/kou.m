function  kou(str,number)
readlist=load(str);
 P=readlist.p;
 W1=0;
 X1=0;
 Y1=0;
 for i=1:number
     u=P(i,1);
     w=log(u);
     xx=P(i,2);
     x=xx*xx/4;
     yy=P(i,3);
     y=yy*yy/4;
     W1=W1+w;
     X1=X1+x;
     Y1=Y1+y;
 end
     W2=W1/10;
     X2=X1/10;
     Y2=Y1/10;
     l10=0;
     l20=0;
     l12=0;
     l11=0;
     l21=0;
     l22=0;
 for j=1:number
       u0=P(j,1);
       w0=log(u0);
       xx0=P(j,2);
       x0=xx0*xx0/4;
       yy0=P(j,3);
       y0=yy0*yy0/4;
     l10=l10+(x0-X2)*(w0-W2);
     l20=l20+(y0-Y2)*(w0-W2);
     l11=l11+(x0-X2)*(x0-X2);
     l12=l12+(x0-X2)*(y0-Y2);
     l22=l22+(y0-Y2)*(y0-Y2);
     l21=l21+(x0-X2)*(y0-Y2);
 end
     zb(1,1)=l11;
     zb(1,2)=l12;
     zb(1,3)=l10;
     zb(1,4)=l21;
     zb(1,5)=l22;
     zb(1,6)=l20;
 save('C:\Users\niulimin\Desktop\kousan.mat','zb')
end