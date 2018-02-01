function getNetworkclusteringsproperty_all( FolderPath,OutPath,filename_file1,filename,sparsity,pfirst,plast,pstep)
%计算聚合系数
%作者：牛力敏
%时间：2014.5.28
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
mkdir(strcat(OutPath,'\','Cluster cofficient'));
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
           
           CCin = clustering_coefficients (b);
           CC=mean(CCin);
            CCMDD(lie,i)=CC;
            end
              i=i+1;
             b=[];
      end
         
     end
     lie=lie+1;
end
save(strcat(OutPath,'\','Cluster cofficient\','Cluster cofficient.mat'),'CCMDD');
end

