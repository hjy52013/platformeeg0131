function  PM(x,y)
%功能描述：X轴表示的是城市的编号
%         Y轴表示的是时间，时间2013年1月1号编号是1
%          2013年4月26号是116，中间过一天加1
%         Z轴表示的是PM2.5的值
%         最终画出三维的图像
X=1:1:13;
 Y=1:1:46;
 readlist=load('C:\Users\niulimin\Desktop\PM\PM2.mat');
 P=readlist.PM2;
%[m n]=size(readlist);
for i=1:46
    for j=1:13
       Z(i,j)=P(i,j); 
    end
end
 %mesh(X,Y,Z);
 surf(X,Y,Z);
  xlabel('x轴线');
  ylabel('y轴线');
  zlabel('z轴线');
  title('西安地区PM2.5的时空分布图');
end
