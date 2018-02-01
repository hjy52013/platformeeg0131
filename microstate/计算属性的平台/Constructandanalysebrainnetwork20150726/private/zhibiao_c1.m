function  zhibiao_c1(str,number)
%求解空气质量分指数
 readlist=load(str);
 X=readlist.gaoya;
 for i=1:number
     y=X(i,4); 
     if  0<=y && y<=5 %一氧化碳
        q=[(50-0)*(y-0)/(5-0)]+0   %一氧化碳
     end  
      if 5<y && y<=10    %一氧化碳
         q=[(100-50)*(y-5)/(10-5)]+50;   %一氧化碳
      end
      if 10<y && y<=35      %一氧化碳
        q=[(150-100)*(y-10)/(35-10)]+100;   %一氧化碳
      end
      if   35<y && y<=60   %一氧化碳
        q=[(200-150)*(y-35)/(60-35)]+150;   %一氧化碳
      end
      if 60<y && y<=90   %一氧化碳
          q=[(300-200)*(y-60)/(90-60)]+200;    %一氧化碳
      end
      if 90<y && y<=120  %一氧化碳
       q=[(400-300)*(y-90)/(120-90)]+300;   %一氧化碳
      end
      if  120<y && y<=150    %一氧化碳
      q=[(500-400)*(y-120)/(150-120)]+400;   %一氧化
     end
     zb(i,4)=q;  
 end
 save('C:\Users\niulimin\Desktop\zhi.mat','zb')
end