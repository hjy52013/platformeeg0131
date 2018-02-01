function [newsig,tal,Label,energy]=getmicrostate(gfp,k,data);
%gfp为所有极大GFP点，k为微状态的数目
[t,tt]=size(gfp);%t表示所有gfp极大值的个数
[number,channel]=size(data);%number为所有时刻，channel为电极通道的数目
gfp_point=zeros(t,channel);%gfp_point表示gfp极值点处各通道的电压值
for i=1:t
    gfp_point(i,:)=data(gfp(i,1),:);
end
microstate=zeros(k,channel);%表示微状态
oldsig=0;%初始旧的方差
newsig=0;%初始新的方差
sig_d=0;%初始化sigma_d
R=0;%初始化R
Epsilon=0.000001;
tal=zeros(k,channel);%归一化的微状态表示
Lable=zeros(1,t);%每个时刻状态的标记
dis=zeros(1,k);%两个微状态的距离
S=zeros(channel,channel);
%初始化微状态
[idx,idx]=sort(rand(1,t));
microstate=gfp_point(idx(1:k),:);
energy=zeros(k,t);%每一个时刻微状态的时间强度
%初始化tal
for i=1:k
    tal(i,:)=microstate(i,:)./norm(microstate(i,:));
end
ii=1;
while 1
%开始聚类
newsig=0;
for i=1:t
    for j=1:k
        dis(1,j)=gfp_point(i,:)*tal(j,:)'*gfp_point(i,:)*tal(j,:)';      
    end
    [maxd,Label(1,i)]=max(dis(1,:));
end
%求S的特征值及特征向量（新的tal值）
for i=1:k
    S=zeros(channel,channel);
    for j=1:t
        if Label(1,j)==i
            S=S+gfp_point(j,:)'*gfp_point(j,:);
        end
    end
    [X,lumda]=eig(S);
    r=abs(sum(lumda));
    n=find(r==max(r));
    max_lumda=lumda(n,n);
    tal(i,:)=X(:,n)';
end
%判断
for i=1:t
    j=Label(1,i);
    newsig=newsig+(gfp_point(i,:)*gfp_point(i,:)'-(tal(j,:)*gfp_point(i,:)')*(tal(j,:)*gfp_point(i,:)'))/t/(channel-1);
end
if abs(oldsig-newsig)<=Epsilon*newsig
    for time=1:t
        Number=Label(1,time);
        for number=1:k
            if number~=Number
                energy(number,time)=0;
            else
                energy(number,time)=gfp_point(time,:)*tal(number,:)';
            end
        end
    end
    break;
else
    oldsig=newsig;
    ii=ii+1
    continue;
end

end

%计算sig_d以及R*R
for i=1:t
    sig_d=sig_d+gfp_point(i,:)*gfp_point(i,:)'/t/(channel-1);
end
R=1-newsig/sig_d;



