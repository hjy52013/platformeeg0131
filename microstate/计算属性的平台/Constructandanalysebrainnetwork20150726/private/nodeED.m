function nodeED(nodefile,number,outpath)
%功能描述：
%根据AAL模板中每个脑区的坐标
%计算AAL模板中每两个脑区之间的欧式距离
%入口参数:
%(1)nodefile是含n*3矩阵的.mat文件的存放路径及文件名，其中mat文件的每一行代表一个脑区，每一列代表一个坐标上的值
% (2)number表示节点的个数
% （3）outpath表示结果存放的路径
%作者：牛力敏
%时间：2013年11月
num=str2num(number); %将节点的个数转换为数字
nodeed=zeros(num);
h = waitbar(0,'Please wait...');
b=load(nodefile)
for i=1:num     %通过两个循环，求出每两个节点之间的距离
    a=b.node(i,1);
    d=b.node(i,2);
    c=b.node(i,3);
    for j=1:num
        a1=b.node(j,1);
        d1=b.node(j,2);
        c1=b.node(j,3);
        nodeed(i,j)=sqrt((a1-a)*(a1-a)+(d1-d)*(d1-d)+(c1-c)*(c1-c));
    end
    save(strcat(outpath,'\nodeed.mat'),'nodeed');
    waitbar(i/num,h,'Please wait...',h);
end
close(h);
end