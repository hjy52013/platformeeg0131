function  zhibiao_c(str,number)
%求解空气质量分指数
 readlist=load(str);
 X=readlist.gaoya;
 for i=1:number
     y=X(i,4); 
     if  0<=y && y<=2 %一氧化碳
        q=[(50-0)*(y-0)/(2-0)]+0   %一氧化碳
     end  
      if 2<y && y<=4    %一氧化碳
         q=[(100-50)*(y-2)/(4-2)]+50;   %一氧化碳
      end
      if 4<y && y<=14      %一氧化碳
        q=[(150-100)*(y-4)/(14-4)]+100;   %一氧化碳
      end
      if   14<y && y<=24   %一氧化碳
        q=[(200-150)*(y-14)/(24-14)]+150;   %一氧化碳
      end
      if 24<y && y<=36   %一氧化碳
          q=[(300-200)*(y-24)/(36-24)]+200;    %一氧化碳
      end
      if 36<y && y<=48  %一氧化碳
       q=[(400-300)*(y-36)/(48-36)]+300;   %一氧化碳
      end
      if  48<y && y<=60    %一氧化碳
      q=[(500-400)*(y-48)/(60-48)]+400;   %一氧化
     end
     zb(i,4)=q;  
 end
 save('C:\Users\niulimin\Desktop\zhi.mat','zb')
end