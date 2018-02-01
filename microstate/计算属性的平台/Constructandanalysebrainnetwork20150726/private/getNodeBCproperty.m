function getNodeBCproperty ( FolderPath,OutPath,prefix,filename1,first,last,step)
%UNTITLED Summary of this function goes here
%   2011.10.18 wenhong 
FolderNamelist=dir(FolderPath);%获取文件夹名字
[Fm Fn]=size(FolderNamelist);%获取文件个数
h = waitbar(0,'Please wait...');
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name%获取文件名字
if FolderName ~= '.'
mkdir(strcat(OutPath,'\',prefix,'Betweenness_centrality\',prefix,'BC',FolderName));
%mkdir(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName))
dataPath=strcat(FolderPath,'\',FolderName);
readlist=dir(strcat(dataPath,'\*.mat'));%读取*.mat文件
[m n]=size(readlist);%文件个数
for filenum=first:step:last
      fileName=strcat(filename1,num2str(filenum));
%fileName=readlist(filenum,1).name;
file=strcat(dataPath,'\',fileName)
b=load(file)
%A=importdata(file)
BC = betweenness_centrality(b.Bmatrix)
%c=load('E:\Graph\Graph.mat')
%display(c.Graph.Data(:,1));
%c.Graph.Data=[]
%display(b.a(:,1));
%c.Graph.Data(:,1)=b.a(:,1)
%c.Graph.Data(:,2)=b.a(:,2)
%c.Graph.Data(:,3)=b.a(:,3)
%Degrees = GraphCountNodesDegree(c.Graph);
%[BC,Node]=GraphBetweennessCentrality(c.Graph);
%filename=strcat(strcat('E:\p\P_modify\R\R_Degree\R_Degree_MDD','\','Degree',FolderName),'\','Degree',fileName)
%save(filename,'Degrees');
filename=strcat(OutPath,'\',prefix,'Betweenness_centrality\',prefix,'BC',FolderName,'\',prefix,'BC',fileName)
save(filename,'BC');
%Degrees=[];
BC=[];
%CCin = mexGraphClusteringCoefficient(c.Graph,[],'both');
%filename=strcat(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName),'\','CC',fileName)
%CC=CCin.NodeClusteringCoefficient(:,:)
%save(filename,'CC');
end 
end 
waitbar(FolderNum/Fm,h,'Please wait...',h);
end
close(h);
end


