function [newsig,tal,Label,energy]=getmicrostate(gfp,k,data);
%gfpΪ���м���GFP�㣬kΪ΢״̬����Ŀ
[t,tt]=size(gfp);%t��ʾ����gfp����ֵ�ĸ���
[number,channel]=size(data);%numberΪ����ʱ�̣�channelΪ�缫ͨ������Ŀ
gfp_point=zeros(t,channel);%gfp_point��ʾgfp��ֵ�㴦��ͨ���ĵ�ѹֵ
for i=1:t
    gfp_point(i,:)=data(gfp(i,1),:);
end
microstate=zeros(k,channel);%��ʾ΢״̬
oldsig=0;%��ʼ�ɵķ���
newsig=0;%��ʼ�µķ���
sig_d=0;%��ʼ��sigma_d
R=0;%��ʼ��R
Epsilon=0.000001;
tal=zeros(k,channel);%��һ����΢״̬��ʾ
Lable=zeros(1,t);%ÿ��ʱ��״̬�ı��
dis=zeros(1,k);%����΢״̬�ľ���
S=zeros(channel,channel);
%��ʼ��΢״̬
[idx,idx]=sort(rand(1,t));
microstate=gfp_point(idx(1:k),:);
energy=zeros(k,t);%ÿһ��ʱ��΢״̬��ʱ��ǿ��
%��ʼ��tal
for i=1:k
    tal(i,:)=microstate(i,:)./norm(microstate(i,:));
end
ii=1;
while 1
%��ʼ����
newsig=0;
for i=1:t
    for j=1:k
        dis(1,j)=gfp_point(i,:)*tal(j,:)'*gfp_point(i,:)*tal(j,:)';      
    end
    [maxd,Label(1,i)]=max(dis(1,:));
end
%��S������ֵ�������������µ�talֵ��
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
%�ж�
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

%����sig_d�Լ�R*R
for i=1:t
    sig_d=sig_d+gfp_point(i,:)*gfp_point(i,:)'/t/(channel-1);
end
R=1-newsig/sig_d;



