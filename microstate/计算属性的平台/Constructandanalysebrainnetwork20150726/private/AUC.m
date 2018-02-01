function AUC(dataPath,OUTPath,subCount,number)
%UNTITLED Summary of this function goes here
%   2011.10.21
%for i=1:90
%subCount表示的是被试的个数（28或38）
%number表示的是处理的稀疏度的个数
%filename=strcat('effciency_node',num2str(i),'.mat')
%Degreemat=importdata(strcat(dataPath,'\',filename))
readlist=dir(strcat(dataPath,'\*.mat'));
 [m n]=size(readlist);
 for NodeNum=1:m 
     fileName=readlist(NodeNum,1).name;
     matPath=strcat(dataPath,'\',fileName);
     Degreemat=importdata(matPath);
%Degreemat=importdata(strcat(dataPath,'\','RMDDCC.mat'));
%Degreemat=importdata(Degreemat);
%Degreemat=Degreemat'
flag=zeros();
s1flag=zeros();
s2flag=zeros();
for col=1:subCount
AUCarea=0;%AUCarea的面积
s=0;s1=0;  %s1单个正方形的面积    s单个的正方形和三角形的面积之和                                                                                                                                                                                                                                                      
s2=0%s2单个三角形的面积
for endj=1:(number-1) 
    Degreemat(endj,col)    
    Degreemat(endj+1,col)
    if(Degreemat(endj,col)>Degreemat(endj+1,col))
       s1=Degreemat(endj,col)*0.1;
       s2=(Degreemat(endj,col)-Degreemat(endj+1,col))*0.1/2;    
       s=s1-s2;
       %s=s1+s2;
       AUCarea=AUCarea+s;
       flag(col,endj)=AUCarea;
       s1flag(col,endj)=s1;
       s2flag(col,endj)=s2;
       
    
    elseif (Degreemat(endj,col)<Degreemat(endj+1,col))
       s1=Degreemat(endj,col)*0.1;
       s2=(Degreemat(endj+1,col)-Degreemat(endj,col))*0.1/2;
       s=s1+s2;
       
       AUCarea=AUCarea+s;
       flag(col,endj)=AUCarea;
       s1flag(col,endj)=s1;
       s2flag(col,endj)=s2;     
    else   s1=Degreemat(endj,col)*0.1;
           %s2=(Degreemat(endj,col)-Degreemat(starti,col))*0.1/2;
           %s=s1+s2;
           AUCarea=AUCarea+s1;
       flag(col,endj)=AUCarea;
       s1flag(col,endj)=s1;
       s2flag(col,endj)=s2;
        
    
    end 

end
 
 %PROAUC(col,1)=AUCarea;
 %为统一下一步的非参数检验的计算形式更改如下
 PROAUC(1,col)=AUCarea;
end
  

%end
save(strcat(OUTPath,'\',fileName),'PROAUC')
% flag=flag'
% save('E:\p\SPL\flag.mat','flag')
 % s1flag=s1flag'
% save('E:\p\SPL\s1.mat','s1flag')
 % s2flag=s2flag'
% save('E:\p\SPL\s2.mat','s2flag')
 end
end

