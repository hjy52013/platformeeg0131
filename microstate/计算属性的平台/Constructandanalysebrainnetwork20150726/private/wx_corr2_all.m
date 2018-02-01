function wx_corr2_all(inputdata1,inputdata2,outputdata,filename_file,filename_file1,filename_r,filename_m,first,last,step,pfirst,plast,pstep,num)
%功能：构建的模型N*N矩阵与R值矩阵进行相似度比较(皮尔逊方法）
%注：这里的网络是直接构建的R值真实矩阵和模型矩阵model

%格式要求：
%模型网络的存放形式是：“oinputdata1\filename_file\filename_file2\filename_m.mat”
%真实网络的存放形式是：“inputdata2\filename_file\filename.mat”
%要求将真实网络的每个被试的R值网络分别单独放在一个文件夹里，文件夹名称不同但和模型网络对应被试存放的文件夹的名称相同。
%各个被试的R值文件名称要求完全一致

%入口参数
%inputdata1表示一组要比较的网络（模型网络）的存放路径
%inputdata2表示另一组要比较的网络（真实网络）的存放路径
%outputdata表示结果的存放路径
%filename_file 表示一个被试中稀疏度层的文件夹的名称，不包含后缀数字的部分
%filename_file1表示参数r层文件夹的名称，不包含后缀数字的部分
%filename_r表示要处理的真实网络的文件名中不包含后缀数字的部分
%filename_m表示要处理的模型网络的文件名中不包含后缀数字的部分
%first1表示需要选取的稀疏度的起始数值
%last1表示需要选取的稀疏度的结束数值
%step1表示需要选取的稀疏度的变化步长
% pfirst表示模型参数的起始值
% plast表示模型参数的结束值
% pstep表示模型参数的变化步长值
%num表示r或n的取值个数

%作者：牛力敏
%日期：2014.05.29

%逐个读取每个被试的网络
FolderNamelist=dir(inputdata1);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %取模型网络中一个被试的网络存放路径
        dataPath1=strcat(inputdata1,'\',FolderName);
        %取真实网络中一个被试的网络存放路径
        dataPath2=strcat(inputdata2,'\',FolderName);
        %取结果中一个被试的网络的存放路径
        newname=strcat(outputdata,'\',FolderName);
        
        %在一个被试中逐个读取每个稀疏度下的网络
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
             %取模型网络中一个被试一个稀疏度下的网络存放路径
            dataPath_sparsity=strcat(dataPath1,'\',filename_file,sparsity_str);
            %取结果中一个被试一个稀疏度下的网络存放路径
            mkdir(strcat(newname,'\',filename_file,sparsity_str));
            newname_sparsity=strcat(newname,'\',filename_file,sparsity_str);
            
            %比较两个网络的皮尔逊相关度
                result=zeros(num,num);
                %取真实网络中要比较的网络
                file1=strcat(dataPath2,'\',filename_r,'.mat');
                b=importdata(file1);
                h=1;
                %取模型网络中要比较的网络
                for fi=pfirst:pstep:plast
                    l=1;
                    fi1=num2str(fi*100);
                    inputdata=strcat(dataPath_sparsity,'\',filename_file1,fi1);
                    for fil=pfirst:pstep:plast
                        fil1=num2str(fil*100);
                        file=strcat(inputdata,'\',filename_m,fil1,'.mat');
                        a=importdata(file);
                        [m,n]=size(a);
                        for i = 1:m
                            
                            a(i,i) = 0;
                            
                        end
                        P = corr2(b,a);
                        result(h,l)=P;
                        l=l+1;
                    end
                    h=h+1;
                end
                save(strcat(newname_sparsity,'\similarJZ',sparsity_str,'.mat'),'result');
        end
    end
end
end