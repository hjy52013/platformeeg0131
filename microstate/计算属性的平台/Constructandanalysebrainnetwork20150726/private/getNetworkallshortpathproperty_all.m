function getNetworkallshortpathproperty_all( FolderPath,OutPath,filename_file1,filename,sparsity,pfirst,plast,pstep)
%计算最短路径
%作者：牛力敏
%时间：2014.5.28
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
mkdir(strcat(OutPath,'\','shortpath'));
 lie=1;
for FolderNum1=pfirst:pstep:plast
   FolderNum=num2str(FolderNum1*100);
    FolderName= strcat('\',filename_file1,num2str(FolderNum))
    if FolderName ~= '.'
      
        dataPath=strcat(FolderPath,FolderName);
%         readlist=dir(strcat(dataPath,'\*.mat'));
   i=1;
        
      for filenum1=pfirst:pstep:plast
          filenum=num2str(filenum1*100);
         
            for l=sparsity:sparsity
          fileName=strcat(filename,num2str(filenum),'.mat');
           
            
          file=strcat(dataPath,'\',fileName);
           
            b=importdata(file);
           
            D = all_shortest_paths(b);
            %对角线上的0将使得调和平均数的结果变为0，因此将对角线上的数据改为无穷大
            %调和平均数=1/(1/A+1/B+1/C+1/D+....),因此无穷大的数据对调和平均数没有影响
            [k1 k2]=size(D );
            for j=1:k1
                D(j,j)=inf;
            end
            S=harmmean(D);
            SPL=harmmean(S);
            SPLMDD(lie,i)=SPL;
         
            end
              i=i+1;
             b=[];
      end
         
     end
     lie=lie+1;
end
save(strcat(OutPath,'\','shortpath\','shortpath.mat'),'SPLMDD');
end

