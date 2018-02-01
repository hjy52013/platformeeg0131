function AUC(dataPath,subCount)
%UNTITLED Summary of this function goes here
%   2011.10.21
%for i=1:90
%filename=strcat('effciency_node',num2str(i),'.mat')
%Degreemat=importdata(strcat(dataPath,'\',filename))
Degreemat=importdata(strcat(dataPath,'\','RMDDCC.mat'));
%Degreemat=importdata(Degreemat);
%Degreemat=Degreemat'
flag=zeros();
s1flag=zeros();
s2flag=zeros();
for col=1:subCount
AUCarea=0;
s=0;s1=0;                                                                                                                                                                                                                                                            
s2=0
for endj=8:33   
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
 
 SPLAUC(col,1)=AUCarea;
end
  

%end
save('E:\实验数据\四种方法的原始数据-R值矩阵\p-pearson\Networkproperty\AUCCC_MDD.mat','SPLAUC')
% flag=flag'
% save('E:\p\SPL\flag.mat','flag')
 % s1flag=s1flag'
% save('E:\p\SPL\s1.mat','s1flag')
 % s2flag=s2flag'
% save('E:\p\SPL\s2.mat','s2flag')
end

