function Statistics( MDdataPath,CondataPath ,OutPath,name,number,class)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% number代表的是稀疏度
%class表示类型larger,smaller,emport
 MDreadlist=dir(strcat(MDdataPath,'\*.mat'));
 [MDm MDn]=size(MDreadlist);
 Conreadlist=dir(strcat(CondataPath,'\*.mat'));
[Conm Conn]=size(Conreadlist);
%readlist=dir(strcat(MDdataPath,'\*.mat'));
%[m n]=size(readlist);
%h = waitbar(0,'Please wait...');
%for NodeNum=1:90
for NodeNum=1:MDm 
 %CONfilename=strcat('oneDegrees',num2str(NodeNum),'.mat')
 %MDfilename=strcat('oneDegrees',num2str(NodeNum),'.mat')
 ConfileName=Conreadlist(NodeNum,1).name;
 MDfilename =MDreadlist(NodeNum,1).name;
 MDmatPath=strcat(MDdataPath,'\',MDfilename)
 ConmatPath=strcat(CondataPath,'\',ConfileName);
 MDmat=importdata(MDmatPath);
 Conmat=importdata(ConmatPath);
 for PNum=1:number
 MDa=MDmat(PNum,:);
 Cona=Conmat(PNum,:);
 %MDa=MDmat(1,:);
 %Cona=Conmat(1,:);
 %[p,h] = ranksum(MDa,Cona)
%[h,p] = kstest2(MDa,Cona)
if class=='larger'
[h,p] = kstest2(MDa,Cona,0.05,'larger');
end
if class=='Smalle'
[h,p] = kstest2(MDa,Cona,0.05,'Smaller');
end
   if class=='emport'
[h,p] = kstest2(MDa,Cona); 
end
 Statis(PNum,NodeNum)=p;
 end
%waitbar(NodeNum/MDm,h,'Please wait...',h); 
end 
save(strcat(OutPath,'\',name),'Statis');
%close(h);
end

