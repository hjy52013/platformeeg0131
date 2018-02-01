function coACT(inputdatapath,outputdatapath,num)
%功能： 计算ACT指标并返回相似度矩阵
%牛力敏,2014-6-19

%入口参数:
%(1)inputdatapath是存放入口参数的路径，入口参数是多个被试经稀疏度选择后的真实网络
% (2)num表示节点的个数
% （3）outputdatapath表示结果存放的路径

%逐个读取每个被试的文件
FolderNamelist=dir(inputdatapath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdatapath,'\',FolderName));
        dataPath=strcat(inputdatapath,'\',FolderName);
        newname=strcat(outputdatapath,'\',FolderName);
        readlist=dir(strcat(dataPath,'\*.mat'));
        [m n]=size(readlist);
        h = waitbar(0,'Please wait...');
        %在一个被试中逐个读取文件进行计算
        for fileNum=1:m
            matName=readlist(fileNum,1).name;
            matPath=strcat(dataPath,'\',matName);
            le=strfind(matName,'.')
            FolderName=matName(1:(le-1));
            %FolderName=matName;
            b=load(matPath);
            %计算ACT指标
            net = FormNet(b.a,num);
            sim = ACT( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim')
            waitbar(i/m,h,'Please wait...',h);
        end
        close(h);
    end
end