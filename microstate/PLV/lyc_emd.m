function new_x = lyc_emd(raw_x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
imfs=emd(raw_x);

[m,n]=size(imfs);
for i=1:m
   %corrcoef函数是计算两组数据的相关系数，corrcoef(x,y)表示x序列和y序列的相关系数，得到的是2*2矩阵，对角元素为自相关系数，非对角元素为互相关系数 
    a=corrcoef(imfs(i,:),raw_x);
    xg(i)=a(1,2);
end
xg;
for i=1:m-1;
    %计算各IMF的方差贡献率
    %定义：方差=平方的均值-均值的平方，即D(x)=E(x^2)-[E(x)]^2
    %平方的均值 imf2p=mean(c(i,:).^2,2)
    %均值的平方 imfp2=mean(c(i,:),2).^2
%各IMF的方差
mse(i)=mean(imfs(i,:).^2,2)-mean(imfs(i,:),2).^2;
end
mmse=sum(mse);%mmse为所有的方差和
for i=1:m-1;
    mse(i)=mean(imfs(i,:).^2,2)-mean(imfs(i,:),2).^2;
    %方差百分比，也就是方差贡献率
    mseb(i)=mse(i)/mmse*100;
end
flag=[];
for   f=1:m
    if xg(f)>0.8
       flag=[flag; f];
    end   
end
[o,p]=size(flag);
if   o>0
    
    temp_x=[];
        for   g=1:o
            label=flag(g,1);
            temp=imfs(label,:);
              temp_x=[temp_x;temp];
        end
         %有用的IMF信号重构
         new_x=sum(temp_x);
else
 max_xg=max(xg);   
 flag_xg=0;
for  d=1:m
    if   xg(d)==max_xg
        flag_xg=d;
    end
end
   %     new_x=x;
    new_x=imfs(flag_xg,:);
    disp('该时间序列EMD分解没有符合要求的，因此选择最大的！');
end

disp(new_x);



end

