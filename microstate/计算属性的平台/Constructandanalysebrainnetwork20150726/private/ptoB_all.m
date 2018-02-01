function ptoB_all(oinputdata,ooutputdata,number,first,last,step,filename1)
%功能：模型网络稀疏度选择
%入口参数：
% oinputdata 表示存放排序后模型网络的文件夹路径
% ooutputdata 表示存放结果的文件夹路径
% number 表示网络节点的个数
% number 表示网络节点的个数
% first 表示起始的稀疏度值
% last 表示结束的稀疏度值
% step  表示稀疏度的步长值
%filename1表示一个被试下各稀疏度整个存放的文件夹名（不包含数字）

%作者：牛力敏
%日期：2014.05.27

%逐个读取每个被试的经过排序的网络矩阵
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
 display(FolderName);
 if FolderName ~= '.'
mkdir(strcat(ooutputdata,'\',FolderName));
dataPath=strcat(oinputdata,'\',FolderName);
newname=strcat(ooutputdata,'\',FolderName);

%在一个被试中逐个读取每个稀疏度下的经过排序的网络矩阵
for sparsity= first:step:last
    sparsity_str=num2str(sparsity);
    %读取一个被试每个稀疏度下经过排序的网络矩阵的存放路径
    dataPath1=strcat(dataPath,'\',filename1,sparsity_str);
    
     %构建存放每个稀疏度下的稀疏度截取过的网络的路径
  mkdir(strcat(newname,'\',filename1,sparsity_str));  
  newname1=strcat(newname,'\',filename1,sparsity_str)
  
  %逐个读取一个被试下的每个稀疏度下的经过排序的网络矩阵
FolderNamelist_sparsity=dir(dataPath1);
[Fm_s Fn_s]=size(FolderNamelist_sparsity);
for FolderNum_sparsity=1:Fm_s
FolderName_sparsity= FolderNamelist_sparsity(FolderNum_sparsity,1).name;
 display(FolderName_sparsity);
 if FolderName_sparsity ~= '.'
mkdir(strcat(newname1,'\',FolderName_sparsity));
dataPath_sparsity=strcat(dataPath1,'\',FolderName_sparsity);
newname_sparsity=strcat(newname1,'\',FolderName_sparsity);

%逐个读取模型网络进行稀疏度选择
readlist=dir(strcat(dataPath_sparsity,'\*.mat'));
[m n]=size(readlist);
for filenum=1:m    
fileName=readlist(filenum,1).name;
file=strcat(dataPath_sparsity,'\',fileName);
 display(file);
 F=importdata(file);
 knum=sparsity*number*(number-1)*0.01/2;
 knum=round(knum)
for i=1:knum
    F(i,3)=1;
    a(i,:)=F(i,:);
end 
filename=strcat(newname_sparsity,'\',fileName) 
save(filename,'a')
a=[]
end
 
 end
end
 end
end
end