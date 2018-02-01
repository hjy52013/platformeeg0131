function  geshi_trans(a,newname)
%功能：将90*90的矩阵转换成4005*1的矩阵
%先将脑区1与其他89个脑区的对应关系写出
%再讲第二个脑区与其他88个脑区（去除脑区1,2）的对应该系写出
%依次类推，至写出第89个脑区与90脑区的对应关系
k=1;
for fi=1:89
    j=fi+1;
    for i=j:90
       geshi(k,1)=a(fi,i);
       k=k+1;
    end
 end
 save(strcat(newname,'\geshi.mat'),'geshi'); 
end
