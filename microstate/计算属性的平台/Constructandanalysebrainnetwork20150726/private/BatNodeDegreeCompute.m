%该函数的作用是批量计算节点的度、模块内度、以及各个节点与其他模块之间的连接数量。
% 入口参数dataPath接受包含二值矩阵的文件夹，NodeOfMod接受90个节点所属的模块的文件
% CGorMDNum表示被试的数量

% 一对一，多对一。  即，多个二值矩阵    对应     一个节点所属模块文件
function BatNodeDegreeCompute(dataPathFile,NodeOfMod)

readlist  = dir(dataPathFile);
[m n] = size(readlist);
NodeOfModule1 = load(NodeOfMod);
NodeOfModule = NodeOfModule1.NodeOfModule;

 %--创建一个文件夹---
tempPath=strcat(dataPathFile,'\','nodeOfDegree');
mkdir(tempPath);
%  -----end------


for t = 1:m       %寻找所传文件夹中所有.mat文件
    subFolderName=readlist(t,1).name;
    if strfind(subFolderName,'mat')
        imgPath=strcat(dataPathFile,'\',subFolderName);
%         display(imgPath);

        %-----------------------------------------------------------------------
        %找到.mat文件后load进来。
        BinaryMartrix1 = load(imgPath);   %BinaryMartrix 存放二值邻接矩阵
        BinaryMartrix = BinaryMartrix1.Z;

        %注意：NodeOfModule  是节点编号从小到大排序后的的矩阵
        [m1,n1] = size(BinaryMartrix);
        [m2,n2] = size(NodeOfModule);
        %第一维存放度，第二维存放节点对应的模块号
        nodeIntroDegree=zeros(m1,3);        %存放每个节点的模块内度
        nodeDegree=zeros(m1,3);             %存放每个节点的总度

        %----把NodeOfMod以节点编号大小进行排序-------%
        NodeOfModule=sortrows(NodeOfModule,1);


        %计算一共划分成了有几个模块
        flag = 0;
        ModuleType = [];
        for i = 1:m2
            if i==1
                ModuleType(1) = NodeOfModule(1,2);
            else
                for j = 1:length(ModuleType)
                    if NodeOfModule(i,2) == ModuleType(j)
                        flag =1;
                    end
                end
                if flag ==0
                    ModuleType(length(ModuleType)+1) = NodeOfModule(i,2);
                end
            end
            flag = 0;
        end
        ModuleNumber = length(ModuleType);

        PKni = zeros(m2,ModuleNumber);
        nodeModulePk = 0;
        %计算每个节点的模块内度nodeIntroDegree 和 总度nodeDegree
        for i=1:m1
            nodeDegree(i,1) = i;
            nodeIntroDegree(i,1) = i;
            NodeModule = NodeOfModule(i,2);               %从NodeOfModule中找出节点i属于哪个模块
            nodeDegree(i,3) = NodeModule;                 %把节点i的所属模块号存入nodeDegree第二维
            nodeIntroDegree(i,3) = NodeModule;             %把节点i的所属模块号存入nodeIntroDegree第二维
            for j=1:n1
                if i~=j
                    if BinaryMartrix(i,j)~=0                          %不等于0，证明节点i和节点j之间存在边
                        nodeDegree(i,2) = nodeDegree(i,2)+1;          %计算节点i的总度存入数组nodeDegree中

                        nodeModulePk = NodeOfModule(j,2);
                        PKni(i,nodeModulePk) =  PKni(i,nodeModulePk) + 1;  %计算节点i与各个模块之间的连接的总边数。
                        if NodeOfModule(j,2) == NodeModule            %如果第i行的某个节点与第i个节点是在同一模块。。。
                            nodeIntroDegree(i,2) = nodeIntroDegree(i,2)+1;  %计算第i个节点的模块内度
                        end
                    end
                end
            end
        end

        fileName=strcat('nodeOfDegree-',subFolderName);
        savePath = strcat(tempPath,'\',fileName);
        save(savePath,'nodeIntroDegree','nodeDegree','ModuleNumber','PKni');
    end
end



% 从上面得到的结果继续下面的计算

readlist  = dir(tempPath);
[m n] = size(readlist);


 %--创建一个文件夹---
participationPath=strcat(dataPathFile,'\','participation');
mkdir(participationPath);
%  -----end------


for t = 1:m       %寻找所传文件夹中所有.mat文件
    subFolderName=readlist(t,1).name;
    if strfind(subFolderName,'mat')
        imgPath=strcat(tempPath,'\',subFolderName);
%         display(imgPath)
        nodeDegreeTemp = load(imgPath);  
        
        nodeDegree=nodeDegreeTemp.nodeDegree;     %存放每个节点的总度
        nodeIntroDegree=nodeDegreeTemp.nodeIntroDegree; %存放每个节点的模块内度
        moduleNumber = nodeDegreeTemp.ModuleNumber;%存放模块的个数
        PKni = nodeDegreeTemp.PKni;  %存放每个节点对各个模块的参与边数
        [m1,n1] = size(nodeDegree);
        [m3,n3] = size(PKni);
        Zi = [];             %存放每个节点的--1.节点号，2.所属模块.3.参与系数
        Pi = [];
        NodeModule =  0;    %存放第i个节点对应的模块号

        for i = 1:m1   %每个节点都要求Z值和P值
            NodeModule = nodeIntroDegree(i,3);    %把节点i的所属模块号赋值给NodeModule
            Zi(i,1) = i; %把节点号存入Zi第一列
            Zi(i,2) = NodeModule; %把节点所属的模块号存入Zi第二列
            %-------------------------计算Pi-参与系数--------------------------------%
            KniTemp = 0;
            for k =1:n3
                KniTemp = KniTemp + (PKni(i,k)/nodeDegree(i,2))^2;
            end
            Pi(i) = 1-KniTemp;
            Zi(i,3) =Pi(i);
            %-----end---Pi----------------------------------------------------
        end

        fileName=strcat('P-',subFolderName);
        savePath = strcat(participationPath,'\',fileName);
        save(savePath,'Zi');     
    end
end

end
