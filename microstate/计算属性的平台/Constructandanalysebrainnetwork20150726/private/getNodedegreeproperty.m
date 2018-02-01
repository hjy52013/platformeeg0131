function degree=getNodedegreeproperty (FolderPath,FilePath,prefix,filename1,first,last,step)
%UNTITLED Summary of this function goes here
%   2011.10.18 wenhong 
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
h = waitbar(0,'Please wait...');
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name
if FolderName ~= '.'
%mkdir(strcat('D:\matlab current','\',FilePath,'\',FolderName));
%mkdir(strcat(OutPath,'\','Degree',FolderName))
%mkdir(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName))
mkdir(strcat(FilePath,'\',prefix,'Degree\',prefix,'Degree',FolderName));
dataPath=strcat(FolderPath,'\',FolderName)
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
for filenum=first:step:last
     fileName=strcat(filename1,num2str(filenum));
%fileName=readlist(filenum,1).name;
file=strcat(dataPath,'\',fileName)
b=load(file)
%A=importdata(file)
%BC = betweenness_centrality(A)
c=load('E:\Graph\Graph.mat')
display(c.Graph.Data(:,1));
c.Graph.Data=[]
display(b.a(:,1));
c.Graph.Data(:,1)=b.a(:,1)
c.Graph.Data(:,2)=b.a(:,2)
c.Graph.Data(:,3)=b.a(:,3)
Degrees = GraphCountNodesDegree(c.Graph);
%[BC,Node]=GraphBetweennessCentrality(c.Graph);
filename=strcat(FilePath,'\',prefix,'Degree\',prefix,'Degree',FolderName,'\',prefix,'Degree',fileName)
%DegreePath=strcat('D:\matlab current','\',FilePath);
%filename=strcat(strcat(OutPath,'\','Degree',FolderName),'\','Degree',fileName)
save(filename,'Degrees');
%filename=strcat(strcat('D:\matlab current\BC','\','BC',FolderName),'\','BC',fileName)
%save(filename,'BC');
Degrees=[];
%BC=[];
%CCin = mexGraphClusteringCoefficient(c.Graph,[],'both');
%filename=strcat(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName),'\','CC',fileName)
%CC=CCin.NodeClusteringCoefficient(:,:)
%save(filename,'CC');
end 
end 
waitbar(FolderNum/Fm,h,'Please wait...',h);
end
degree=strcat(FilePath,'\',prefix,'Degree');
close(h);
end


