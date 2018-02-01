function global_getoneDegree(FolderPath,outPath)
%UNTITLED2 Summary of this function goes here
%  2011.10.20



FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
if FolderName ~= '.'
dataPath=strcat(FolderPath,'\',FolderName);
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
 for i=1:m
        matName=readlist(i,1).name;
        matPath=strcat(dataPath,'\',matName);
       NetworkDegree = importdata(matPath);
       allDegrees(i,FolderNum-2)=NetworkDegree(1,1);
 end
 
end 

end
fileName=strcat('l_avg_MD_oneDegrees')
save(strcat(outPath,'\',fileName),'allDegrees')
