function order_getoneDegree(FolderPath,outPath,c,filename,first,last,step)
%if c==G then  Global efficiency
%if c==l then  local efficiency
%UNTITLED2 Summary of this function goes here
%  2011.10.20
%CONfilename=strcat('oneDegrees',num2str(NodeNum),'.mat')
 %MDfilename=strcat('oneDegrees',num2str(NodeNum),'.mat')
 %ConfileName=Conreadlist(NodeNum,1).name;
 %MDmatPath=strcat(MDdataPath,'\',MDfilename)
 %ConmatPath=strcat(CondataPath,'\',CONfilename);
 %MDmat=importdata(MDmatPath);
 %Conmat=importdata(ConmatPath); 


FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
if FolderName ~= '.'
dataPath=strcat(FolderPath,'\',FolderName);
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
j=1;
 for i=first:step:last
        matName  =  strcat('B',filename,num2str(i),'.mat');
        %matName=readlist(i,1).name;
        matPath=strcat(dataPath,'\',matName);
       NetworkDegree = importdata(matPath);
      % allDegrees((i-first+1),FolderNum-2)=NetworkDegree(1,1);
      allDegrees((j),FolderNum-2)=NetworkDegree(1,1);
      j=j+1;
 end
 
end 

end
fileName=c;
save(strcat(outPath,'\',fileName),'allDegrees')