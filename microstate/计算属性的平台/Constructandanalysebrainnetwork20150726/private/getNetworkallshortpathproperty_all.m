function getNetworkallshortpathproperty_all( FolderPath,OutPath,filename_file1,filename,sparsity,pfirst,plast,pstep)
%�������·��
%���ߣ�ţ����
%ʱ�䣺2014.5.28
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
            %�Խ����ϵ�0��ʹ�õ���ƽ�����Ľ����Ϊ0����˽��Խ����ϵ����ݸ�Ϊ�����
            %����ƽ����=1/(1/A+1/B+1/C+1/D+....),������������ݶԵ���ƽ����û��Ӱ��
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

