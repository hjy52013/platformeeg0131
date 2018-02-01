function EDmodel3(nodeed,smatrix)
 mkdir('F:\解剖领域的功能网络\pearson\模型网络\modet10');
for r=0:0.1:7
    r1=num2str(r*100);
    mkdir(strcat('F:\解剖领域的功能网络\pearson\模型网络\modet10\modet',r1));
    for n=0:0.1:7
    n1=num2str(n*100);
    modes=zeros(90);
for i=1:90
    for j=1:90
     k = smatrix(i,j).^r;
     d = nodeed(i,j).^-n;
     modes(i,j) = k*d;
    end
end
save(strcat('F:\解剖领域的功能网络\pearson\模型网络\modet10\modet',r1,'\modet',n1,'.mat'),'modes'); 
    end
end
end