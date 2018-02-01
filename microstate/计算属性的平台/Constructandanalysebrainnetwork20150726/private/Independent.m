%实现的功能：
%1.提取某组所有被试的90*90相关系数矩阵的某个交叉点的数据，组成一个维数为 某组 个数 的向量Z
%比如某组有28例被试，则会提取28例相关阵的位置（NodeI，NodeJ）的数据组成一个28维向量。因为有90*90个，
%所以是三维数组Z：90*90*28
%2.将28维向量中的每一个值求ln值，然后求和，最后乘以-2，得到最后的值
%3.将所有值存在矩阵中形成一个90*90的矩阵


function Independent(dataPath,FilePath)  
   readlist  = dir(dataPath)  %dir函数返回一个M-by-1的结构体矩阵，该结构体包含name,date,bytes,isdir
    [m n] = size(readlist)  %返回readlist矩阵的行数和列数
    Z = zeros(90,90,1);   %Z是三维数组90*90*m   
    Y=0;  %实际的后缀名为.mat文件个数，也就是被试的实际个数
    Q=zeros(90,90);   %剔除后的被试的实际个数  
  
    %1.把N例被试（比如28例）90*90的矩阵转化为三维数组
     for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
             Y=Y+1;
             imgPath=strcat(dataPath,'\',subFolderName);
             display(imgPath)
             %load(imgPath);
             R=importdata(imgPath);
             for i=1:90 
                for j=1:90 
                    Z(i,j,Y) = R(i,j);
                end
             end             
         end       
     end
   %2.将28维向量中的每一个值求ln值，然后求和，最后乘以-2，得到最后的值
     [m n Y] = size(Z) 
     Result = zeros(90,90);
    tempResult = 0
    for i=1:m 
        for j=1:n
             for k=1:Y
                    le=log(Z(i,j,k));
                    tempResult =  tempResult + le;                  
             end  
             Result(i,j) = -2*tempResult;    %计算值存入最终的结果矩阵Result中
             tempResult = 0;
        end
    end
    filename=strcat(FilePath,'\','independent.mat');
    save(filename,'Result')
end