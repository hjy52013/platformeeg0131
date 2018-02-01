function Attribute_classisy(inputdata1,inputdata2,outputdata,M,L,num,w)
%功能：为进行分类研究进行格式：将实验组和对照组的所有被试的所有模型网络所有属性进行格式转换。
%功能详细介绍：实验组M个被试，对照组L个被试，针对每个被试构建（N*N）个模型网络
%             针对每一个模型网络有w种全局属性。
%             在入口参数中：属性值的存储形式为：inputdata1\beishi(被试文件夹)\pro.mat（一个被试下所有模型网络一种属性的存储矩阵N*N）
%             在出口参数中：属性的存储方式为：outputdata\Att_Classfy.mat（每个矩阵表示一个模型网络，
%             每个矩阵为（（ M+L）*（w+1）），其中每一行表示一个被试，前w列表示w种全局属性，最后一列是类标签（即实验组或对照组）

%作者：牛会兰、牛力敏
%日期：2014.06.03

%入口参数
%inputdata1表示实验组数据的存放路径
%inputdata2表示相对照组数据的存放路径
%outputdata表示结果的存放路径
%M表示实验组的被试个数
%L表示对照组的被试个数
%num表示参数r或n的取值个数
%w表示全局属性的个数

for k=1:num
    for p=1:num
        
        %定义每个模型网络的结果矩阵
        Att_Classfy=zeros((M+L),(w+1));
        
        row=1;  %用于记录被试个数
        
        %取对照组的某个模型网络的属性
        
        %逐个读取对照组每个被试的属性矩阵
        FolderNamelist=dir(inputdata2);
        [Fm Fn]=size(FolderNamelist);
        for FolderNum=1:Fm
            FolderName= FolderNamelist(FolderNum,1).name;
            display(FolderName);
            if FolderName ~= '.'
                %取模型网络中一个被试的两种网络的相关矩阵存放路径
                dataPath2=strcat(inputdata2,'\',FolderName);
                
                %取各个属性值
                 SPLMDD=importdata(strcat(dataPath2,'\aucshortpath.mat'));
                 gallDegrees=importdata(strcat(dataPath2,'\aucGlobal efficiency.mat'));
                 lallDegrees=importdata(strcat(dataPath2,'\auclocal efficiency.mat'));
                 B=importdata(strcat(dataPath2,'\aucassortativity.mat'));
                 CCMDD=importdata(strcat(dataPath2,'\aucCluster cofficient.mat'));
                 
                 Att_Classfy(row,1)=SPLMDD(k,p); 
                 Att_Classfy(row,2)=gallDegrees(k,p); 
                 Att_Classfy(row,3)=lallDegrees(k,p); 
                 Att_Classfy(row,4)=B(k,p); 
                 Att_Classfy(row,5)=CCMDD(k,p); 
                 Att_Classfy(row,6)=0; 
                   row=row+1;
            end  
        end
        
        %逐个读取对照组每个被试的属性矩阵
        FolderNamelist=dir(inputdata1);
        [Fm Fn]=size(FolderNamelist);
        for FolderNum=1:Fm
            FolderName= FolderNamelist(FolderNum,1).name;
            display(FolderName);
            if FolderName ~= '.'
                %取模型网络中一个被试的两种网络的相关矩阵存放路径
                dataPath1=strcat(inputdata1,'\',FolderName);
                
                %取各个属性值
                 SPLMDD=importdata(strcat(dataPath1,'\aucshortpath.mat'));
                 gallDegrees=importdata(strcat(dataPath1,'\aucGlobal efficiency.mat'));
                 lallDegrees=importdata(strcat(dataPath1,'\auclocal efficiency.mat'));
                 B=importdata(strcat(dataPath1,'\aucassortativity.mat'));
                 CCMDD=importdata(strcat(dataPath1,'\aucCluster cofficient.mat'));
                 
                 Att_Classfy(row,1)=SPLMDD(k,p); 
                 Att_Classfy(row,2)=gallDegrees(k,p); 
                 Att_Classfy(row,3)=lallDegrees(k,p); 
                 Att_Classfy(row,4)=B(k,p); 
                 Att_Classfy(row,5)=CCMDD(k,p); 
                 Att_Classfy(row,6)=1; 
                 row=row+1;
            end   
        end
         save(strcat(outputdata,'\','Att_Classfy',num2str(k),'-',num2str(p),'.mat'),'Att_Classfy');
    end
end

end
