function smatrix = similarn(nodes)
for num=8:32
    num1=num2str(num);
inputPath=strcat('F:\解剖领域的功能网络\pearson\pearson均值\MD\percentage\BsortMD-R-extractStd-std-8\BSort',num1,'.mat')
col=importdata(inputPath);
bmatirx = zeros(nodes,nodes)
[m,k]=size(col)
for i=1:m
    bmatrix(col(i,1),col(i,2)) = 1;
    bmatrix(col(i,2),col(i,1)) = 1;
end
[m,k]=size(bmatrix)
for i=1:m
C=i;
B(1,i)=C;
end
smatrix = zeros(m,m)
for i=1:length(B)
smatrix(B(i),B(i))=m+1;
end
for i=1:m 
    for k=i+1:m
        r=0;
        for j=1:m
            p=bmatrix(i,j);
            q=bmatrix(k,j);
            if (p==q && p~=0)
                r=r+1
            end
        end
        smatrix(i,k)=r;
        smatrix(k,i)=r;
    end
end
save(strcat('F:\解剖领域的功能网络\pearson\pearson均值\MD\最邻近个数\smatrix',num1,'.mat'),'smatrix') 
end










