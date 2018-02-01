function sparsity_all(oinputdata,ooutputdata,number)
%功能：模型网络排序(去掉一半)
%入口参数：
% oinputdata 表示存放模型网络的文件夹路径
% ooutputdata 表示存放结果的文件夹路径
% number 表示网络节点的个数

%作者：牛力敏
%日期：2014.05.27

%逐个读取每个被试的模型网络
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
 display(FolderName);
 if FolderName ~= '.'
mkdir(strcat(ooutputdata,'\',FolderName));
dataPath=strcat(oinputdata,'\',FolderName);
newname=strcat(ooutputdata,'\',FolderName);

%逐个读取一个被试下的每个稀疏度下的模型网络
FolderNamelist_sparsity=dir(dataPath);
[Fm_s Fn_s]=size(FolderNamelist_sparsity);
for FolderNum_sparsity=1:Fm_s
FolderName_sparsity= FolderNamelist_sparsity(FolderNum_sparsity,1).name;
 display(FolderName_sparsity);
 if FolderName_sparsity ~= '.'
mkdir(strcat(newname,'\',FolderName_sparsity));
dataPath_sparsity=strcat(dataPath,'\',FolderName_sparsity);
newname_sparsity=strcat(newname,'\',FolderName_sparsity);

%逐个读取一个被试下的一个稀疏度下当参数r确定时的模型网络
FolderNamelist_r=dir(dataPath_sparsity);
[Fm_r Fn_r]=size(FolderNamelist_r);
for FolderNum_r=1:Fm_r
FolderName_r= FolderNamelist_r(FolderNum_r,1).name;
 display(FolderName_r);
 if FolderName_r ~= '.'
mkdir(strcat(newname_sparsity,'\',FolderName_r));
dataPath_r=strcat(dataPath_sparsity,'\',FolderName_r);
newname_r=strcat(newname_sparsity,'\',FolderName_r);

%逐个读取模型网络进行排序
readlist=dir(strcat(dataPath_r,'\*.mat'));
[m n]=size(readlist);

for filenum=1:m    
fileName=readlist(filenum,1).name;
file=strcat(dataPath_r,'\',fileName);
 display(file);
 F=importdata(file);
arnum=1;
for rnum=2:number
    cnum=rnum-1;
    for i=1:cnum
        a(arnum,1)=rnum;
        a(arnum,2)=i;
        display(F(rnum,i));
        %display(b.R(rnum,i));
        a(arnum,3)=F(rnum,i);
        %a(arnum,3)=abs(b.R(rnum,i));
        
        arnum=arnum+1;
        
    end
end
    sortb=sortrows(a,-3);
    
    %为了在名称中体现是p值还是r值网络
if strfind(fileName,'_P')
filename=strcat(newname_r,'\','Psort',fileName)
else if strfind(fileName,'_R')
  filename=strcat(newname_r,'\','Rsort',fileName)
    else 
     filename=strcat(newname_r,'\','sort',fileName)   
    end
end
save(filename,'sortb');

end
 end
end
 end
end
 end
end
end