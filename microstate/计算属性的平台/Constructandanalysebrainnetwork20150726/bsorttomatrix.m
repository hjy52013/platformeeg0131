function bmatrix = bsorttomatrix(col,nodes)

%��ƽ̨����������ߵĴ洢����ת��Ϊ90��90�Ķ�ֵ���󣬷�����ͼʹ�á�
%nodesΪ�ڵ���
%col,ƽ̨�ĳ��ڡ���ʽ���£�
%32 42 1
%32 45 1
%bmatrix��ת����Ķ�ֵ������ʽ���£�
%0 0 1 0 1
%0 0 0 1 0
%1 0 0 1 1
%����130924

bmatirx = zeros(nodes,nodes)
[m,k]=size(col)
for i=1:m
    bmatrix(col(i,1),col(i,2)) = 1;
    bmatrix(col(i,2),col(i,1)) = 1;
end




