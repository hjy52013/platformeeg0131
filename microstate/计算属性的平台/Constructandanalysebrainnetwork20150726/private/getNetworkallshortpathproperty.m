function getNetworkallshortpathproperty( FolderPath,OutPath,prefix,filename,first,last,step)
%UNTITLED Summary of this function goes here
%   2011.10.25
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
h = waitbar(0,'Please wait...');
mkdir(strcat(OutPath,'\',prefix,'shortpath'));
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name
    if FolderName ~= '.'
        %mkdir(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName))
        dataPath=strcat(FolderPath,'\',FolderName)
        readlist=dir(strcat(dataPath,'\*.mat'));
       % [m n]=size(readlist);
        i=1;
      
        for filenum=first:step:last
            %filenum=1:m
            fileName=strcat(filename,num2str(filenum));
            %fileName=readlist(filenum,1).name
            %fileName1=fileName(1,end-2);
            file=strcat(dataPath,'\',fileName)
            %file=strcat(dataPath,'\',fileName1,num2str(filenum))
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
            %CCin = clustering_coefficients (b.Bmatrix);
            D = all_shortest_paths(b.Bmatrix);
            %对角线上的0将使得调和平均数的结果变为0，因此将对角线上的数据改为无穷大
            %调和平均数=1/(1/A+1/B+1/C+1/D+....),因此无穷大的数据对调和平均数没有影响
            [k1 k2]=size(D );
            for j=1:k1
                D(j,j)=inf;
            end
            %S=mean(D);
            %SPL=mean(S);
            S=harmmean(D);
            SPL=harmmean(S);
            %CC=mean(CCin);
            %filename=strcat(strcat('E:\p\p\Con_Sub_ClusteringCoefficient','\','CC',FolderName),'\','CC',fileName)
            %CCCON(filenum-9,FolderNum-2)=CC;
            %SPLCON(filenum-9,FolderNum-2)=SPL;
            %CCMDD(i,FolderNum-2)=CC;
            SPLMDD(i,FolderNum-2)=SPL;
           i=i+1;
        end
        b.Bmatrix=[];
    end
    waitbar(FolderNum/Fm,h,'Please wait...',h);
end
save(strcat(OutPath,'\',prefix,'shortpath\',prefix,'shortpath.mat'),'SPLMDD');
close(h);
%if strcmp(Name,'BSortCon')
%save('D:\matlab current\MDCC.mat','CCMDD');
%save(strcat(OutPath,'\CONSPL.mat'),'SPLMDD');
%elseif strcmp(Name,'BSortMD')
%save(strcat(OutPath,'\MDSPL.mat'),'SPLMDD');
%end

