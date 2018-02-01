function EDmodel(oinputdata1,oinputdata2,ooutputdata,number,first,last,step,filename,pfirst,plast,pstep)
%功能：利用欧式距离和节点相似指标构建模型网络
%入口参数：
% oinputdata1 表示存放欧式距离的文件夹路径及文件名
% oinputdata2 表示存放接地啊相似性指标的文件夹路径
% ooutputdata 表示存放结果的文件夹路径
% number 表示网络节点的个数
% first 表示起始的稀疏度值
% last 表示结束的稀疏度值
% step  表示稀疏度的步长值
%filename 表示相似度指标的文件名（不包含数字）
% pfirst表示模型参数的起始值
% plast表示模型参数的结束值
% pstep表示模型参数的变化步长值

%作者：牛力敏
%日期：2014.05.27

%读取欧式距离的文件
nodeed=importdata(oinputdata1)

%逐个读取每个被试的节点相似度文件
FolderNamelist=dir(oinputdata2);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(ooutputdata,'\',FolderName));
        dataPath=strcat(oinputdata2,'\',FolderName);
        newname=strcat(ooutputdata,'\',FolderName);
        
        %在一个被试中逐个读取每个稀疏度下的相似度指标构建模型
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %构建存放每个稀疏度下的模型网络的路径
            mkdir(strcat(ooutputdata,'\',FolderName,'\sparsity',sparsity_str));
            newname1=strcat(ooutputdata,'\',FolderName,'\sparsity',sparsity_str)
            
            %读取每个稀疏度下的相似度指标矩阵
            file=strcat(dataPath,'\',filename,sparsity_str,'.mat');
            smatrix=importdata(file);
            
            %构建模型网络
            %参数r从pfirst到plast步长为pstep
            for r=pfirst:pstep:plast
                r1=num2str(r*100);
                mkdir(strcat(newname1,'\model',r1));
                %参数n从pfirst到plast步长为pstep
                for n=pfirst:pstep:plast
                    n1=num2str(n*100);
                    model=zeros(number);
                    for i=1:number
                        for j=1:number
                            %if i==j
                            %modes(i,j) = 1;
                            %else
                            k = smatrix(i,j).^r;
                            d = nodeed(i,j).^-n;
                            model(i,j) = k*d;
                            % end
                            
                        end
                    end
                    save(strcat(newname1,'\model',r1,'\model',n1,'.mat'),'model');
                end
            end
        end
    end
end