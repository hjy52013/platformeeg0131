function [gfp,maxgfp,number,t,channel]=getGFP(data);
%data_path为数据源的路径
%maxgfp用来存储GFP的极大值，number表示极值点个数
%求GFP
%data为脑电数据集，每行为每一时刻，每列为一个通道各个时刻的电位
gfp=std(data,1,2);%
[t,channel]=size(data);
number=0;%number表示GFP极值点个数
maxgfp=zeros(1,2);%maxgfp用来存储GFP的极大值
if gfp(1,:)>gfp(2,:)%开始求取极大值点
    number=number+1;
    maxgfp(number,1)=1;
    maxgfp(number,2)=gfp(1,:);
end
    for i=2:t-1
        left=gfp(i-1,:);%表示前一个时刻的点
        middle=gfp(i,:);%表示当前时刻的点
        right=gfp(i+1,:);%表示后一个时刻的点
        if middle>=left&&middle>=right
            number=number+1;
            maxgfp(number,1)=i;
            maxgfp(number,2)=middle;
        end
    end
if gfp(t,:)>gfp(t-1,:)
    number=number+1;
    maxgfp(number,1)=i;
    maxgfp(number,2)=gfp(t,:);
end
            