function guiyi(oinputdata,ooutputdata,filename,first,last,step)
%功能：实现对相似度指标的归一化处理（针对多个被试的批处理）

%存储形式：“oinputdata\filename_file(被试文件夹名）\filename.mat”

%入口参数：
% oinputdata表示存放欧式距离的文件夹路径及文件名
% ooutputdata 表示存放结果的文件夹路径
% first 表示起始的稀疏度值
% last 表示结束的稀疏度值
% step  表示稀疏度的步长值
%filename 表示相似度指标的文件名（不包含数字）

%作者：牛力敏
%日期：2014.05.27

%逐个读取每个被试的节点相似度文件
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(ooutputdata,'\',FolderName));
        dataPath=strcat(oinputdata,'\',FolderName);
        newname=strcat(ooutputdata,'\',FolderName);
        
         %在一个被试中逐个读取每个稀疏度下的相似度指标
         for sparsity= first:step:last
             sparsity_str=num2str(sparsity);
             
             file=strcat(dataPath,'\',filename,sparsity_str,'.mat');
             gy=importdata(file);
             [m,n]=size(gy);
             sim=zeros(m);
            
             %对矩阵进行归一化
             minva=min(gy);
             minvalue=min(minva);
             maxva=max(gy);
             maxvalue=max(maxva);
             for i=1:m
                 for j=1:m
                     v=gy(i,j);
                     %guiyi=(v-min)*(max-min);
                     sim(i,j)=(v-minvalue)/(maxvalue-minvalue);
                 end
             end
            save(strcat(newname,'\gy',filename,sparsity_str,'.mat'),'sim');  
         end
    end
end
end