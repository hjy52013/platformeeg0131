function order_getoneDegree_gall(FolderPath,OutPath,filename_file1,filename,sparsity,pfirst,plast,pstep)
%计算全局效率
%作者：牛力敏
%时间：2014.5.28
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
mkdir(strcat(OutPath,'\','Global efficiency'));
 lie=1;
for FolderNum1=pfirst:pstep:plast
   FolderNum=num2str(FolderNum1*100);
    FolderName= strcat('\GB',filename_file1,num2str(FolderNum))
    if FolderName ~= '.'
      
        dataPath=strcat(FolderPath,FolderName);
%         readlist=dir(strcat(dataPath,'\*.mat'));
   i=1;
        
      for filenum1=pfirst:pstep:plast
          filenum=num2str(filenum1*100);
         
            for l=sparsity:sparsity
          fileName=strcat(filename,num2str(filenum),'.mat');
           
            
          file=strcat(dataPath,'\B',fileName);
           
            b=importdata(file);
           
           allDegrees(lie,i)=b(1,1);
       
         
            end
              i=i+1;
             b=[];
      end
         
     end
     lie=lie+1;
end
save(strcat(OutPath,'\','Global efficiency\','Global efficiency.mat'),'allDegrees');
end