function Label=finnal(data,maxgfp,k,tal)

%ȷ������΢״̬��ǰ�ᣬ�������е�΢״̬�Ѿ����tal
%gfpΪ���м���GFP�㣬kΪ΢״̬����Ŀ
[t,tt]=size(maxgfp);%t��ʾ����gfp����ֵ�ĸ���
gfp_point=data(maxgfp(:,1),:);%gfp_point��ʾgfp��ֵ�㴦��ͨ���ĵ�ѹֵ
dis=zeros(1,k);%����΢״̬�ľ���
%��ʼ��΢״̬

%��ʼ����
for i=1:t
    for j=1:k
        dis(1,j)=gfp_point(i,:)*tal(j,:)'*gfp_point(i,:)*tal(j,:)';      
    end
    [maxd,Label(1,i)]=max(dis(1,:));
end






