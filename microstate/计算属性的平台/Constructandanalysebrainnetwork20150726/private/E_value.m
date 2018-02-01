function E_value(dataPath,outPath,num)
%�������������ȣ�����N*N��*1��Pֵ����ֽ�ΪN*N�ľ���
%��Σ���������������ƶȱȽ�ֵE

%�洢��ʽ����oinputdata\filename�����Եķǲ�����������.mat

%��ڲ�����
%inputdata1��ʾ���ģ�����������ֵ��·��
%datapath��ʾ�������Ĵ��·����·��
%num��ʾr��n��ȡֵ����

%���ߣ�ţ����
%ʱ�䣺2014.5.29

%��ȡģ�������������Ե�P������
as1=importdata(strcat(dataPath,'\assortativity.mat'));
shortpath1=importdata(strcat(dataPath,'\shortpath.mat'));
glo1=importdata(strcat(dataPath,'\Global efficiency.mat'));
local1=importdata(strcat(dataPath,'\local efficiency.mat'));
cc1=importdata(strcat(dataPath,'\Cluster cofficient.mat'));

%����N*N��*1��Pֵ����ֽ�ΪN*N�ľ���
%���������N*N����Ĵ�ž���
as=zeros(num,num);
shortpath=zeros(num,num);
glo=zeros(num,num);
local=zeros(num,num);
cc=zeros(num,num);

col_P=1;
for i1=1:num
    for j1=1:num
        if col_P<(num*num+1)
            as(i1,j1)=as1(col_P,1);
            shortpath(i1,j1)=shortpath1(col_P,1);
            glo(i1,j1)=glo1(col_P,1);
            local(i1,j1)=local1(col_P,1);
            cc(i1,j1)=cc1(col_P,1);
            col_P=col_P+1;
        end
        
    end
end
[m,n]=size(as);
for i=1:m
    for j=1:m
        E_value(i,j)=(1/as(i,j))*(1/shortpath(i,j))*(1/glo(i,j))*(1/local(i,j))*(1/cc(i,j));
    end
end
save(strcat(outPath,'\E_value.mat'),'E_value');
end