function shortpa_all (oinput,ooutput,filename_file,filename_file1,filename_p,first1,last1,step1,number,pfirst,plast,pstep,pro)
%功能描述：
%计算全局属性包括：特征路径长度，聚合系数，协调系数，全局效率，局部效率
%输入参数：
%oinput表示经过稀疏度选择的脑网络数据所存放的文件夹的路径
%ooutput表示计算结果的存放路径
%filename_file 表示一个被试中稀疏度层的文件夹的名称，不包含后缀数字的部分
%filename_file1表示参数r层文件夹的名称，不包含后缀数字的部分
%filename表示要处理的文件的文件名中不包含后缀数字的部分
%first1表示需要选取的稀疏度的起始数值
%last1表示需要选取的稀疏度的结束数值
%step1表示需要选取的稀疏度的变化步长
%number表示脑区的个数
% pfirst表示模型参数的起始值
% plast表示模型参数的结束值
% pstep表示模型参数的变化步长值
%pro表示计算的属性种类

%作者：牛力敏
%时间：2014.5.28

first=str2num(first1);
step = str2num(step1);
last = str2num(last1);
filename=strcat('sort',filename_p);
      
%逐个读取每个被试的截取稀疏度之后的网络矩阵
FolderNamelist=dir(oinput);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(ooutput,'\',FolderName));
        dataPath=strcat(oinput,'\',FolderName);
        newname=strcat(ooutput,'\',FolderName);
        
        %在一个被试中逐个读取每个稀疏度下的截取稀疏度之后的网络矩阵
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %构建存放每个稀疏度下的截取稀疏度之后的网络矩阵的路径
            mkdir(strcat(newname,'\',filename_file,sparsity_str));
            dataPath1=strcat(dataPath,'\',filename_file,sparsity_str);
            newname1=strcat(newname,'\',filename_file,sparsity_str)
            
            %在一个被试中的一个稀疏度下逐个读取r值不同时的截取稀疏度之后的网络矩阵
%             for r=pfirst:pstep:plast
%                 r_str=num2str(r);
%                 mkdir(strcat(newname1,'\',filename_file1,r_str));
                mkdir(strcat(newname,'\Intermediate results\',filename_file,sparsity_str));
%                 dataPath2=strcat(dataPath1,'\',filename_file1,r_str);
%                 newname1=strcat(newname1,'\',filename_file1,r_str);
                newname2=strcat(newname,'\Intermediate results\',filename_file,sparsity_str);
                %矩阵变形
                bform = Bform(dataPath1,newname2,number);
                %计算最短路径
                if pro=='s'
                getNetworkallshortpathproperty_all(newname2,newname1,filename_file1,filename,sparsity,pfirst,plast,pstep);
                end
%             end
                %计算聚合系数
                if pro=='cc'
                getNetworkclusteringsproperty_all(newname2,newname1,filename_file1,filename,sparsity,pfirst,plast,pstep);
                end
                %定义全局效率和局部效率的过程数据存放文件路径
                 if pro=='g'
                 mkdir(strcat(newname,'\','global\intermaediate1\',filename_file,sparsity_str));
                 g_newname1=strcat(newname,'\','global\intermaediate1\',filename_file,sparsity_str);
                  mkdir(strcat(newname,'\','global\intermaediate2\',filename_file,sparsity_str));
                 g_newname2=strcat(newname,'\','global\intermaediate2\',filename_file,sparsity_str);
                 
                 %矩阵变形
                  BCTpropertydataform(dataPath1 ,g_newname1,number);
                 
                  
                  %计算全局效率
                    effciency_fold(g_newname1, g_newname2,'G');
                   order_getoneDegree_gall(g_newname2,newname1,filename_file1,filename,sparsity,pfirst,plast,pstep);
                  end
                  
                   %计算局部效率
                       if pro=='l'
                    mkdir(strcat(newname,'\','local\intermaediate1\',filename_file,sparsity_str));
                    l_newname1=strcat(newname,'\','local\intermaediate1\',filename_file,sparsity_str);
                    mkdir(strcat(newname,'\','local\intermaediate2\',filename_file,sparsity_str));
                    l_newname2=strcat(newname,'\','local\intermaediate2\',filename_file,sparsity_str);
                     BCTpropertydataform(dataPath1 ,l_newname1,number);
                     effciency_fold(l_newname1, l_newname2,'l');
                    mkdir(strcat(newname,'\','local\intermaediate3\',filename_file,sparsity_str));
                    l_newname=strcat(newname,'\','local\intermaediate3\',filename_file,sparsity_str);
                    mean_fold(l_newname2,l_newname);
                    order_getoneDegree_lall(l_newname,newname1,filename_file1,filename,sparsity,pfirst,plast,pstep)
                       end
                    %计算协调系数
                     if pro=='as'
                     mkdir(strcat(newname,'\','assortativity\intermaediate1\',filename_file,sparsity_str));
                    a_newname1=strcat(newname,'\','assortativity\intermaediate1\',filename_file,sparsity_str);
                     BCTpropertydataform(dataPath1 ,a_newname1,number);
                     BCTassortativity_all(a_newname1,newname1,filename_file1,filename,sparsity,pfirst,plast,pstep);
                     end
            
        end
    end
end
end