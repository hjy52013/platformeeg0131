function  modes_tu()
%功能描述：X轴表示的n
%         Y轴表示的是r
%         Z轴表示的是对应网络的全局效率
%         最终画出三维的图像
X=0:0.1:7;
 Y=0:0.1:7;
 readlist=load('C:\Users\niulimin\Desktop\1\shortpath.mat');
 P=readlist.shortpath;
%[m n]=size(readlist);
for i=1:71
    for j=1:71
       Z(i,j)=P(i,j); 
    end
end
 %mesh(X,Y,Z);
 surf(X,Y,Z);
AXIS([0 7 0 7 2 5]);
 %plot(456,345,0.35,'color','w');
% plot3(456,345,0.35,'*','MarkerSize',20,'color','w');
 % xlabel('x轴线');
 % ylabel('y轴线');
 % zlabel('z轴线');
  %title('西安地区PM2.5的时空分布图');
end