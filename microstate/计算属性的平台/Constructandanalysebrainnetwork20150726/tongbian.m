function tongbian(inputdata1,inputdata2,output)
%功能：计算两个网络的共同边的个数占总变数的百分比
result=zeros(71,71);
file1=strcat(inputdata2,'\BSort9.mat');
b=importdata(file1);
h=1;
for fi=0:10:700
    l=1;
    fi1=num2str(fi);
inputdata=strcat(inputdata1,'\modet',fi1);
for fil=0:10:700
    fil1=num2str(fil);
    file=strcat(inputdata,'\sortmodet',fil1,'.mat');
    a=importdata(file);
    [m,n]=size(a);
k=0;
for i=1:m
    a1=a(i,1);
    for j=1:m
        b1=b(j,1);
        if a1==b1
            b2=b(j,2);
            a2=a(i,2);
            if a2==b2
                k=k+1;
            end
        end
    end
end
k1=k/m;
result(h,l)=k1;
l=l+1;
end
h=h+1;
end
save(strcat(output,'\fene.mat'),'result');
end