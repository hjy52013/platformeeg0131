function  modes_tu1()
%����������X���ʾ��n
%         Y���ʾ����r
%         Z���ʾ���Ƕ�Ӧ�����ȫ��Ч��
%         ���ջ�����ά��ͼ��
X=0:0.02:7;
 Y=0:0.02:7;
 readlist=load('D:\��\��������Ĺ�������\modes\CNN\shortpath.mat');
 P=readlist.shortpath;
%[m n]=size(readlist);
for i=1:351
    for j=1:351
       Z(i,j)=P(i,j); 
    end
end
 %mesh(X,Y,Z);
 surf(X,Y,Z);
AXIS([0 7 0 7 2 5]);
 %plot(456,345,0.35,'color','w');
% plot3(456,345,0.35,'*','MarkerSize',20,'color','w');
 % xlabel('x����');
 % ylabel('y����');
 % zlabel('z����');
  %title('��������PM2.5��ʱ�շֲ�ͼ');
end