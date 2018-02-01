function AUC_corr2(inputdata,outputdata,sparsity_number,filename_file,filename,first,last,step,num)
%功能：计算一个被试下多个稀疏度下的各模型与真实网络相关系数（如皮尔逊相关）的AUC值
%注：主要分为三大部分
%一：将相关系数的矩阵变成行表示形式。例如：构建稀疏度8—32的模型网络，则一个稀疏度下会得到一个相关系数的矩阵，则8—32会有25个矩阵
%    将这25个矩阵合成一个矩阵，新合成的矩阵的一行为原来的一个矩阵，一共会有25行，从稀疏度8到稀疏度32.
%    若每个稀疏度下相关系数的矩阵为31*31，则新合成的矩阵为25行，961列
%二：将上一步合成的矩阵进行AUC计算。例如：合成的矩阵为25行，961列，则每一列分别进行AUC计算，然后得到一个1行，961列的矩阵
%三：似于第一步的逆过程。例如：将第二部合成的1行，961列的矩阵，按照第一步的逆过程变成31*31的矩阵。

%格式要求：
%相关矩阵的存放形式是：“oinputdata1\filename_file(被试文件夹）\filename_file2（稀疏度文件夹）\filename_m（相关矩阵）.mat”

%作者：牛力敏
%日期：2014.05.29

%入口参数
%inputdata表示相关矩阵的存放路径
%outputdata表示结果的存放路径
%sparsity_number表示稀疏度的个数
%num表示r或n的取值个数
%first表示需要选取的稀疏度的起始数值
%last表示需要选取的稀疏度的结束数值
%step表示需要选取的稀疏度的变化步长
%filename_file表示稀疏度级别的文件夹名称
%filename表示两种网络的相关矩阵的名称，不包含数字
%num表示r或n的取值个数

%逐个读取每个被试的两种网络的相关矩阵
FolderNamelist=dir(inputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %取模型网络中一个被试的两种网络的相关矩阵存放路径
        dataPath1=strcat(inputdata,'\',FolderName);
        %取一个被试结果的存放路径
        newname=strcat(outputdata,'\',FolderName);
        
        %一：将相关系数的矩阵变成行表示形式。
        %在一个被试中逐个读取每个稀疏度下的两种网络的相关矩阵
        
        %定义存放一个被试的两个网络的相关系数的的矩阵
        AllTC=zeros(sparsity_number,(num*num));
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %取模型网络中一个被试一个稀疏度下的两种网络的相关矩阵
            file=strcat(dataPath1,'\',filename_file,sparsity_str,'\',filename,sparsity_str,'.mat');
            b=importdata(file);
            [m,n]=size(b);
            i=1;
            for row_r=1:m
                for col_r=1:m
                    AllTC((sparsity-first+1),i)=b(row_r,col_r);
                    i=i+1;
                end
            end
        end
        
        %二：将上一步合成的矩阵进行AUC计算。
         Degreemat= AllTC;  %将第一步的结果矩阵赋值给第二步
         number=sparsity_number;  %将稀疏度的个数赋值给行数
         subCount=(num*num);  %将第一步的列数赋值给第二步
        flag=zeros();
        s1flag=zeros();
        s2flag=zeros();
        for col=1:subCount
            AUCarea=0;%AUCarea的面积
            s=0;s1=0;  %s1单个正方形的面积    s单个的正方形和三角形的面积之和
            s2=0%s2单个三角形的面积
            for endj=1:(number-1)
                Degreemat(endj,col)
                Degreemat(endj+1,col)
                if(Degreemat(endj,col)>Degreemat(endj+1,col))
                    s1=Degreemat(endj,col)*0.1;
                    s2=(Degreemat(endj,col)-Degreemat(endj+1,col))*0.1/2;
                    s=s1-s2;
                    %s=s1+s2;
                    AUCarea=AUCarea+s;
                    flag(col,endj)=AUCarea;
                    s1flag(col,endj)=s1;
                    s2flag(col,endj)=s2;
                    
                    
                elseif (Degreemat(endj,col)<Degreemat(endj+1,col))
                    s1=Degreemat(endj,col)*0.1;
                    s2=(Degreemat(endj+1,col)-Degreemat(endj,col))*0.1/2;
                    s=s1+s2;
                    
                    AUCarea=AUCarea+s;
                    flag(col,endj)=AUCarea;
                    s1flag(col,endj)=s1;
                    s2flag(col,endj)=s2;
                else   s1=Degreemat(endj,col)*0.1;
                    %s2=(Degreemat(endj,col)-Degreemat(starti,col))*0.1/2;
                    %s=s1+s2;
                    AUCarea=AUCarea+s1;
                    flag(col,endj)=AUCarea;
                    s1flag(col,endj)=s1;
                    s2flag(col,endj)=s2;
                    
                    
                end
                
            end
            PROAUC(1,col)=AUCarea;
        end
        
        %三：似于第一步的逆过程：形式整理
        AUCecompare=zeros(num,num);
        col_P=1;
        for i=1:num
            for j=1:num
                if col_P<(num*num+1)
                    AUCecompare(i,j)=PROAUC(1,col_P);
                    col_P=col_P+1;
                end
                
            end
        end
             save(strcat(newname,'\AUC','.mat'),'AUCecompare');
    end
end
end