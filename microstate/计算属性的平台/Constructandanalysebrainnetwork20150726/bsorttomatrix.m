function bmatrix = bsorttomatrix(col,nodes)

%将平台构建的网络边的存储矩阵，转化为90×90的二值矩阵，方便作图使用。
%nodes为节点数
%col,平台的出口。形式如下：
%32 42 1
%32 45 1
%bmatrix，转换后的二值矩阵，形式如下：
%0 0 1 0 1
%0 0 0 1 0
%1 0 0 1 1
%郭浩130924

bmatirx = zeros(nodes,nodes)
[m,k]=size(col)
for i=1:m
    bmatrix(col(i,1),col(i,2)) = 1;
    bmatrix(col(i,2),col(i,1)) = 1;
end




