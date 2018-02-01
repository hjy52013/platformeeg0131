function E_value(dataPath,outPath,num)
%功能描述：首先：将（N*N）*1的P值矩阵分解为N*N的矩阵
%其次：求两组网络的相似度比较值E

%存储形式：“oinputdata\filename（属性的非参数检验结果）.mat

%入口参数：
%inputdata1表示存放模型网络的属性值的路径
%datapath表示计算结果的存放路径的路径
%num表示r或n的取值个数

%作者：牛力敏
%时间：2014.5.29

%读取模型网络属性属性的P检验结果
as1=importdata(strcat(dataPath,'\assortativity.mat'));
shortpath1=importdata(strcat(dataPath,'\shortpath.mat'));
glo1=importdata(strcat(dataPath,'\Global efficiency.mat'));
local1=importdata(strcat(dataPath,'\local efficiency.mat'));
cc1=importdata(strcat(dataPath,'\Cluster cofficient.mat'));

%将（N*N）*1的P值矩阵分解为N*N的矩阵
%定义各属性N*N矩阵的存放矩阵
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