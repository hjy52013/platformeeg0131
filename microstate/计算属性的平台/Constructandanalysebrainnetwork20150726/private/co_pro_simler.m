function co_pro_simler(inputdatapath,outputdatapath,num,pro)
%功能： 计算CosPlus指标并返回相似度矩阵
% 功能：计算HDI指标并返回相似度矩阵
% 功能：计算HPI指标并返回相似度矩阵
% 功能：计算jaccard指标并返回相似度矩阵
% 功能：计算katz0.01指标并返回相似度矩阵
% 功能：计算katz0.001指标并返回相似度矩阵
% 功能：计算LHN1指标并返回相似度矩阵
% 功能：计算LHNII0.9指标并返回相似矩阵
% 功能：计算LHNII0.95指标并返回相似矩阵
% 功能：计算LHNII0.95指标并返回相似矩阵
% 功能：计算局部朴素贝叶斯模型性AA指标并返回相似矩阵
% 功能：计算局部朴素贝叶斯模型性CN指标并返回相似矩阵
% 功能：计算局部朴素贝叶斯模型性RA指标并返回相似矩阵
% 功能：计算LP指标并返回相似度矩阵,第二参数取0.0001
% 功能：计算MFI指标并返回相似矩阵
% 功能：计算PA指标并返回相似矩阵
% 功能：计算RWR0.85指标并返回相似矩阵
% 功能：计算RWR0.95指标并返回相似矩阵
%功能： 计算Salton指标并返回相似矩阵
% 功能：计算SimRank指标并返回相似度矩阵,第二参数取0.8
% 功能：计算Sorenson指标并返回相似矩阵
% 功能：计算TSCN指标并返回相似矩阵,第二参数取0.01
% 功能：计算RA指标并返回相似矩阵

%牛力敏,2014-6-19

%入口参数:
%(1)inputdatapath是存放入口参数的路径，入口参数是多个被试经稀疏度选择后的真实网络
% (2)num表示节点的个数
% （3）outputdatapath表示结果存放的路径

%逐个读取每个被试的文件
display(pro);
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
            %格式转换
            net = FormNet(b.a,num);
            %计算CosPlus指标
            if pro=='Cos'
            sim = CosPlus( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');
            end
            
            %计算HDI指标
            if pro == 'HDI'
             sim = HDI( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算HPI指标
            if pro == 'HPI'
             sim = HPI( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算jaccard指标
            if pro=='jac'
             sim = Jaccard( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算katz0.01指标
            if pro=='ka1'
             sim = Katz ( net ,0.01);
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算katz0.001指标
            if pro=='ka2'
             sim = Katz ( net ,0.001);
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算LHN1指标
            if pro=='LHN'
            sim = LHN( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算LHNII0.9指标
            if pro=='LH0'
            sim = LHNII( net,0.9 );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算LHNII0.95指标
            if pro=='LH5'
            sim = LHNII( net,0.95 );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算LHNII0.99指标
            if pro=='LH9'
            sim = LHNII( net,0.99 );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算局部朴素贝叶斯模型性AA指标
            if pro=='LNB'
            sim = LNBAA( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算局部朴素贝叶斯模型性CN指标
            if pro=='LNC'
            sim = LNBCN( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算局部朴素贝叶斯模型性RA指标
            if pro=='LNR'
            sim = LNBRA( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算LP指标
            if pro=='Loc'
             sim  = LocalPath( net, 0.0001 );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算MFI指标
            if pro=='MFI'
             sim = MFI( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算PA指标
            if pro=='PA1'
             sim = PA( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算RWR0.85指标
            if pro=='RWR'
            sim = RWR( net,0.85 );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算RWR0.95指标
            if pro=='RW9'
            sim = RWR( net,0.95 );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %计算Salton指标
            if pro=='Sal'
             sim = Salton( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算SimRank指标
            if pro=='Sim'
             sim = SimRank( net,0.8);
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算Sorenson指标
            if pro=='Sor'
             sim = Sorenson( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算TSCN指标
            if pro=='TSC'
             sim = TSCN( net,0.01 );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %计算RA指标
             
            if pro=='RA1'
             sim = RA( net );
            %保存结果
            save(strcat(newname,'\',matName),'sim');  
            end
            
            waitbar(i/m,h,'Please wait...',h);
        end
        close(h);
    end
end