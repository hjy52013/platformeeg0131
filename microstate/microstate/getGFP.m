function [gfp,maxgfp,number,t,channel]=getGFP(data);
%data_pathΪ����Դ��·��
%maxgfp�����洢GFP�ļ���ֵ��number��ʾ��ֵ�����
%��GFP
%dataΪ�Ե����ݼ���ÿ��Ϊÿһʱ�̣�ÿ��Ϊһ��ͨ������ʱ�̵ĵ�λ
gfp=std(data,1,2);%
[t,channel]=size(data);
number=0;%number��ʾGFP��ֵ�����
maxgfp=zeros(1,2);%maxgfp�����洢GFP�ļ���ֵ
if gfp(1,:)>gfp(2,:)%��ʼ��ȡ����ֵ��
    number=number+1;
    maxgfp(number,1)=1;
    maxgfp(number,2)=gfp(1,:);
end
    for i=2:t-1
        left=gfp(i-1,:);%��ʾǰһ��ʱ�̵ĵ�
        middle=gfp(i,:);%��ʾ��ǰʱ�̵ĵ�
        right=gfp(i+1,:);%��ʾ��һ��ʱ�̵ĵ�
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
            