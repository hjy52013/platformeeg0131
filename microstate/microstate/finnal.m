function Label=finnal(data,maxgfp,k,tal)

%确定最终微状态，前提，根据所有的微状态已经求出tal
%gfp为所有极大GFP点，k为微状态的数目
[t,tt]=size(maxgfp);%t表示所有gfp极大值的个数
gfp_point=data(maxgfp(:,1),:);%gfp_point表示gfp极值点处各通道的电压值
dis=zeros(1,k);%两个微状态的距离
%初始化微状态

%开始聚类
for i=1:t
    for j=1:k
        dis(1,j)=gfp_point(i,:)*tal(j,:)'*gfp_point(i,:)*tal(j,:)';      
    end
    [maxd,Label(1,i)]=max(dis(1,:));
end






