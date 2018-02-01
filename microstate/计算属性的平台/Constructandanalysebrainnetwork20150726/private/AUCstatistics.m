function AUCstatistics(MDdataPath,CondataPath,OutPath,Name)
%UNTITLED Summary of this function goes here
%   2011.10.21

for NodeNum=1:25
 %filename=strcat('D_AUConeDegrees',num2str(NodeNum),'.mat')
 %MDmatPath=strcat(MDdataPath,'\',filename)
 %ConmatPath=strcat(CondataPath,'\',filename);
 MDmat=importdata(MDdataPath);
 Conmat=importdata(CondataPath);
 %MDa=MDmat(:,1);
 %Cona=Conmat(:,1);
 MDa=MDmat(NodeNum,:);
 Cona=Conmat(NodeNum,:)
 %[p,h] = ranksum(MDa,Cona)
 [h,p] = kstest2(MDa,Cona,0.05,'larger')
%[h,p] = kstest2(MDa,Cona)   增加larger参数可以清晰哪个大哪个小
 PCC(NodeNum,1)=NodeNum;
 PCC(NodeNum,2)=p;


end 
save(strcat(OutPath,'\',Name),'PCC')
end

