function getNetworkclusteringsproperty( FolderPath,OutPath,Name )
%UNTITLED Summary of this function goes here
%   2011.10.25
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name
if FolderName ~= '.'
%mkdir(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName))
dataPath=strcat(FolderPath,'\',FolderName)
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
i=1;
for filenum=10:34
%fileName=readlist(filenum,1).name;
file=strcat(dataPath,'\',Name,num2str(filenum))
b=load(file)
%c=load('E:\Graph\Graph.mat')
%display(c.Graph.Data(:,1));
%c.Graph.Data=[]
%  splay(b.a(:,1));
%c.Graph.Data(:,1)=b.a(:,1)
%c.Graph.Data(:,2)=b.a(:,2)
%c.Graph.Data(:,3)=b.a(:,3)
%Degrees = GraphCountNodesDegree(c.Graph);
%filename=strcat(strcat('E:\p\P_Modify\P_MD\P__MD_Degree','\','Degree',FolderName),'\','Degree',fileName)
%save(filename,'Degrees');
CCin = clustering_coefficients (b.Bmatrix);
%D = all_shortest_paths(b.Bmatrix);
%S=mean(D);
%SPL=mean(S);
CC=mean(CCin);
%filename=strcat(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName),'\','CC',fileName)
%CCCON(filenum-9,FolderNum-2)=CC;
%SPLCON(filenum-9,FolderNum-2)=SPL;
CCMDD(i,FolderNum-2)=CC;
%SPLMDD(i,FolderNum-2)=SPL;
i=i+1;;
end 
b.Bmatrix=[];
end 

end
if strcmp(Name,'BSortCon')
%save('D:\matlab current\MDCC.mat','CCMDD');
save(strcat(OutPath,'\CONCC.mat'),'CCMDD');
elseif strcmp(Name,'BSortMD')
  save(strcat(OutPath,'\MDDCC.mat'),'CCMDD');  
%save('D:\matlab current\MDSPL.mat','SPLMDD');

end

