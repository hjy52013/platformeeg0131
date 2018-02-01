function ED(s)
 i=1;
for k=1:5:351
    result1(i,:)=s(k,:);
    %result1(:,i)=s(:,k);
    i=i+1;
end
save('F:\解剖领域的功能网络\pearson\属性分析\modet24\检验比较\归一化\result1.mat','result1'); 
end