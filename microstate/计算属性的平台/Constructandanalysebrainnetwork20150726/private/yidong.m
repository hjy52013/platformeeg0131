
function yidong(dataPath,FilePath)    
    % FilePath表示输出的路径
    readlist  = dir(dataPath)  %dir函数返回一个M-by-1的结构体矩阵，该结构体包含name,date,bytes,isdir
    [m n] = size(readlist)  %返回readlist矩阵的行数和列数
    
    P=0;
    Q=zeros(38,24);   %剔除后的被试的实际个数  
  
    %1.把N例被试（比如28例）90*90的矩阵转化为三维数组
    for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
             P=P+1;
             imgPath=strcat(dataPath,'\',subFolderName);
             display(imgPath)
             load(imgPath);                 
             for i=1:38 
                for j=8:32
                    Q(i,j-7) = B(i,j);
                     filename=strcat(FilePath,'\',subFolderName);
                     save(filename,'Q')
                end
             end             
         end       
    end

 
  
   

end