function duibi(a,b)
[ma,na]=size(a);
[mb,nb]=size(b);
for  i=1:ma
    a1=a(i,1);
    a2=a(i,2);
    for  j=1:mb
        b1=b(j,1);
        b2=b(j,2);
        if a1==b1 && a2==b2      
               c(i,1)=b(j,1);
               c(i,2)=b(j,2);
               c(i,3)=b(j,3);
        end
    end
end
save('F:\解剖领域的功能网络\pearson\属性分析\shubai\result32.mat','c');
end