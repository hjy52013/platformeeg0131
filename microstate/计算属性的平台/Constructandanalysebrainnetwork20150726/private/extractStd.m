% extractStd('D:\Program Files\MATLAB71\work\R-constructBrainNetwork\jiqingpengpai2\cg-pearson\cg-pearson',2);

%实现功能：提取出正负n个标准差之内的数据集，去除掉n个标准差之外的数据,并计算剔除之后的均值

%程序具体步骤：
%1.提取某组所有被试的90*90相关系数矩阵的某个交叉点的数据，组成一个维数为 某组 个数 的向量Z
%比如某组有28例被试，则会提取28例相关阵的位置（NodeI，NodeJ）的数据组成一个28维向量。因为有90*90个，
%所以是三维数组Z：90*90*28
%3.计算新向量的均值
%4.将所有90*90个这样的均值存入一个最后的矩阵中返回。

%该方法需要两个参数1.要处理 组 的所有被试的.mat文件。2.所有
function avg=extractStd(dataPath,FilePath)    
    % FilePath表示输出的路径
    readlist  = dir(dataPath)  %dir函数返回一个M-by-1的结构体矩阵，该结构体包含name,date,bytes,isdir
    [m n] = size(readlist)  %返回readlist矩阵的行数和列数
    
    Z = zeros(90,90,1);   %Z是三维数组90*90*m   
    P=0;  %实际的后缀名为.mat文件个数，也就是被试的实际个数
    Q=zeros(90,90);   %剔除后的被试的实际个数  
  
    %1.把N例被试（比如28例）90*90的矩阵转化为三维数组
    for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
             P=P+1;
             imgPath=strcat(dataPath,'\',subFolderName);
             display(imgPath)
             load(imgPath);                 
             for i=1:90 
                for j=1:90 
                    Z(i,j,P) = R(i,j);
                end
             end             
         end       
    end

 
    %3.计算新向量的均值
    %4.将所有90*90个这样的均值存入一个最后的结果矩阵Result中。





    [m n P] = size(Z) 
    Result = zeros(90,90);
    tempResult = 0
    for i=1:m 
        for j=1:n
             for k=1:P
                    Q(i,j)=Q(i,j)+1; 
                    tempResult =  tempResult + Z(i,j,k);                        
             end   
             Result(i,j) = tempResult/Q(i,j);      %计算均值存入最终的结果矩阵Result中
             tempResult = 0;
        end
    end
 filename=strcat(FilePath,'\','avg.mat');
    save(filename,'Result')
end