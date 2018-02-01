function  paixu(oinputdata,ooutputdata,num,pfirst,pstep)
%功能介绍：
%对n*n的网络进行排序
%入口参数
%oinputdata表示存放E值矩阵的文件夹的路径
%odatapath表示结果存放的路径
%num表示r或n的取值个数
% pfirst表示模型参数的起始值
% pstep表示模型参数的变化步长值

%作者：牛力敏
%日期：2014.05.28

%逐个读取每个被试的E值矩阵
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(ooutputdata,'\',FolderName));
        dataPath=strcat(oinputdata,'\',FolderName);
        newname=strcat(ooutputdata,'\',FolderName);
        
        %逐个读取一个被试下的每个稀疏度下的E值矩阵
        FolderNamelist_sparsity=dir(dataPath);
        [Fm_s Fn_s]=size(FolderNamelist_sparsity);
        for FolderNum_sparsity=1:Fm_s
            FolderName_sparsity= FolderNamelist_sparsity(FolderNum_sparsity,1).name;
            display(FolderName_sparsity);
            if FolderName_sparsity ~= '.'
                mkdir(strcat(newname,'\',FolderName_sparsity));
                dataPath_sparsity=strcat(dataPath,'\',FolderName_sparsity);
                newname_sparsity=strcat(newname,'\',FolderName_sparsity);
                
                %逐个读取E值矩阵进行排序
                readlist=dir(strcat(dataPath_sparsity,'\*.mat'));
                [m n]=size(readlist);
                for filenum=1:m
                    fileName=readlist(filenum,1).name;
                    file=strcat(dataPath_sparsity,'\',fileName);
                    display(file);
                    a=importdata(file);
                    inum=pfirst;
                    jnum=pfirst;
                    for i=1:num
                        for j=1:num
                            result((i-1)*num+j,1)=inum;
                            result((i-1)*num+j,2)=jnum;
                            result((i-1)*num+j,3)=a(i,j);
                            jnum=jnum+pstep;
                        end
                        inum=inum+pstep;
                        jnum=pfirst;
                    end
                    orderresult=sortrows(result,-3);
                    save(strcat(newname_sparsity,'\',fileName),'orderresult');
                end
            end
        end
    end
end
end