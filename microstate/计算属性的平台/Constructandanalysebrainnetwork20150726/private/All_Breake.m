function All_Breake(inputdata,outputdata,num)
%功能：将1行（N*N）列的矩阵，如（1行，961列的矩阵）变成N*N（31*31）的矩阵。

%格式要求：
%相关矩阵的存放形式是：“oinputdata1\filename_file(被试文件夹）\filename（属性矩阵）.mat”

%入口参数
%inputdata表示属性矩阵的存放路径
%outputdata表示结果的存放路径
%num表示r或n的取值个数

%作者：牛力敏，牛会兰
%日期：2014.06.3

%逐个读取每个被试的属性矩阵
FolderNamelist=dir(inputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %取一个被试的属性矩阵存放路径
        dataPath1=strcat(inputdata,'\',FolderName);
        %取一个被试结果的存放路径
        newname=strcat(outputdata,'\',FolderName);
        
        %读取一个被试的所有属性矩阵
        readlist=dir(strcat(dataPath1,'\*.mat'));
        [m n]=size(readlist);
        
        %矩阵的格式转换
        for fileNum=1:m
            matName=readlist(fileNum,1).name;
            matPath=strcat(dataPath1,'\',matName);
            b=importdata( matPath);
             col=1;
            for i=1:num
                for j=1:num
                    %s=sprintf('Simulation in process:%d',ceil(i/10));
                    if col<(num*num+1)
                        AUC_pro(i,j)=b(1,col);
                        col=col+1;
                    end
                    
                end
            end
            
            %保存结果
            save(strcat(newname,'\',matName),'AUC_pro')
        end
    end
end

end