function  Fisher_z(inputPath,outPath,numb )
%功能说明：相关系数并不服从正态分布，当系数小于0.5时大约服从正态分布
%当系数大于0.5时有倾斜(skew to the left)
%Fisher提出一个现在被称之为“Fisher’s z transformation”的转换公式
%可以将相关系数r转换为正态分布变量z. 
%公式如下： z = .5[ln(1+r) - ln(1-r)] 之后就可以使用常用的t检验进行比较了
%本程序将n*n的相关矩阵进行Fisher_z转换，number代表n的个数

%导入入口参数
 number=str2num(numb)
result=zeros(number,number);  %定义存放结果的矩阵
  readlist  = dir(inputPath)  
    [m n] = size(readlist)
    for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
              imgPath=strcat(inputPath,'\',subFolderName);
              b=importdata(imgPath);
              for num=1:number %提取每个值进行Fisher_z转换
                  for cow = 1:number
                      score=b(num,cow);
                      result(num,cow)=0.5*(log(1+score)-log(1-score));
                  end
              end
              filename=strcat(outPath,'\',subFolderName)  ;
              save(filename,'result'); 
         end
    end
end