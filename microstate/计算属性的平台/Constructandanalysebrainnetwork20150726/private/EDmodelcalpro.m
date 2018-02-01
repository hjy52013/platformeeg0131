function EDmodelcalpro(inputdata1,inputdata2,outputdata,Enumber,filename_file,first,step,last)
%功能描述：
%求：五种全局属性的类似残差的比较
%要求：真实网络的被试与模型网络的被试一一对应，名称完全一致
%入口参数：
%inputdata1表示存放模型网络的属性值的路径
%datapath表示计算结果的存放路径的路径
%inputdata2表示存放均值网络的属性值的路径
%Enumber表示结果矩阵的行数或列数即r或n的取值个数
%filename_file 表示存储一个被试中一个稀疏度下属性的文件夹的名称
% first 表示起始的稀疏度值
% last 表示结束的稀疏度值
% step  表示稀疏度的步长值

%作者：牛力敏
%时间：2014.5.28

%逐个读取每个被试的网络的属性值
FolderNamelist=dir(inputdata1);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %取模型网络中一个被试的属性存放路径
        dataPath1=strcat(inputdata1,'\',FolderName);
        %取真实网络中一个被试的属性存放路径
        dataPath2=strcat(inputdata2,'\',FolderName);
        %取结果中一个被试的属性存放路径
        newname=strcat(outputdata,'\',FolderName);
        %在一个被试中逐个读取每个稀疏度下的相似度指标构建模型
        step_number=1;
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %取模型网络中一个被试一个稀疏度下的属性存放路径
            dataPath_sparsity=strcat(dataPath1,'\',filename_file,sparsity_str);
            %取结果中一个被试一个稀疏度下的属性存放路径
            mkdir(strcat(newname,'\',filename_file,sparsity_str));
            newname_sparsity=strcat(newname,'\',filename_file,sparsity_str);
            
            %计算E值
            
            %定义结果存放矩阵
%             mkdir(datapath);
            calglobal=zeros(Enumber);
            callocal=zeros(Enumber);
            calshortpath=zeros(Enumber);
            calas=zeros(Enumber);
            calcc=zeros(Enumber);
            calresult=zeros(Enumber);
            
            %读取模型网络属性存放矩阵
            as=importdata(strcat(dataPath_sparsity,'\assortativity\assortativity.mat'));
            shortpath=importdata(strcat(dataPath_sparsity,'\shortpath\shortpath.mat'));
            glo=importdata(strcat(dataPath_sparsity,'\Global efficiency\Global efficiency.mat'));
            local=importdata(strcat(dataPath_sparsity,'\local efficiency\local efficiency.mat'));
            cc=importdata(strcat(dataPath_sparsity,'\Cluster cofficient\Cluster cofficient.mat'));
            
             %读取真实网络属性存放矩阵
             SPLMDD=importdata(strcat(dataPath2,'\shortpath\shortpath.mat'));
             gallDegrees=importdata(strcat(dataPath2,'\global\Global efficiency.mat'));
             lallDegrees=importdata(strcat(dataPath2,'\local\local efficiency.mat'));
             B=importdata(strcat(dataPath2,'\assortativity\assortativity.mat'));
             CCMDD=importdata(strcat(dataPath2,'\Cluster cofficient\Cluster_cofficient.mat'));
             
            for i=1:Enumber
                for j=1:Enumber
                    calshortpath(i,j)=1/(shortpath(i,j)+SPLMDD(step_number,1))^2;
                    calglobal(i,j)=1/(glo(i,j)+gallDegrees(step_number,1))^2;
                    callocal(i,j)=1/(local(i,j)+lallDegrees(step_number,1))^2;
                    calas(i,j)=1/(as(i,j)+B(step_number,1))^2;
                    calcc(i,j)=1/(cc(i,j)+CCMDD(step_number,1))^2;
                    calresult(i,j)=calshortpath(i,j)*calglobal(i,j)*callocal(i,j)*calas(i,j)* calcc(i,j);
                end
            end
            % save(strcat(datapath,'\calas.mat'),'calas');
            % save(strcat(datapath,'\calshortpath.mat'),'calshortpath');
            % save(strcat(datapath,'\calglobal.mat'),'calglobal');
            % save(strcat(datapath,'\callocal.mat'),'callocal');
            % save(strcat(datapath,'\calcc.mat'),'calcc');
            save(strcat(newname_sparsity,'\calresult', sparsity_str,'.mat'),'calresult');
            step_number=step_number+1;
        end
    end
end
end
