function All_Attribute(indataPath,onewname)

%将8%-32%稀疏度下的属性合并到一个文件夹中
%先将31*31转化为1*961，再整合为25*961的文件
%参数为：整合过的属性路径，输出路径
%牛会兰，2014-5-15

a1=dir(indataPath);
b1 = length(a1);%得到其中文件的个数
for i=1:b1
    filename1=[a1(i).name];
    str1='.';str2='..';
    if strcmp(filename1,str1)==1       
    elseif strcmp(filename1,str2)==1 
 %elseif (filename1=='BRsortCon_Sub001_R')|(filename1=='BRsortCon_Sub003_R')|(filename1=='BRsortCon_Sub004_R')|(filename1=='BRsortCon_Sub005_R')
    else   
        Allas=zeros(25,961);
        Allcc=zeros(25,961);
        Allglo=zeros(25,961);
        Alllocal=zeros(25,961);
        Allshortpath=zeros(25,961);
        i=1;
        dataPath0 = strcat(indataPath,'\',filename1); 
        outPath=strcat(onewname,'\',filename1,'\modet8-32');
        mkdir(outPath);
        
        for density=8:32
            dataPath = strcat(dataPath0,'\modet',num2str(density)); 
            file1 = strcat(dataPath,'\assortativity.mat'); 
            file2 = strcat(dataPath,'\Cluster_cofficient.mat');
            file3 = strcat(dataPath,'\Global efficiency.mat');
            file4 = strcat(dataPath,'\local efficiency.mat');
            file5 = strcat(dataPath,'\shortpath.mat');

            a=load(file1);
            b=a.as;            
            for row=1:31
                for col=1:31  
                    Allas(density-7,i)=b(row,col);  
                    i=i+1;
                end
            end            
            i=1;
            
            a=load(file2);
            b=a.cc;
            for row=1:31
                 for col=1:31  
                      Allcc(density-7,i)=b(row,col);  
                      i=i+1;
                 end
            end
            i=1;



            a=load(file3);
            b=a.glo;
            for row=1:31
                 for col=1:31  
                    Allglo(density-7,i)=b(row,col);  
                    i=i+1;
                 end
            end
            i=1;



            a=load(file4);
            b=a.local;
            for row=1:31
                for col=1:31  
                    Alllocal(density-7,i)=b(row,col);  
                    i=i+1;
                end
            end
            i=1;

    
            a=load(file5);
            b=a.shortpath;
            for row=1:31
                 for col=1:31  

                      Allshortpath(density-7,i)=b(row,col);  
                      i=i+1;
                 end
            end
            i=1;
        end

        save(strcat(outPath,'\','Allassort.mat'),'Allas');
        save(strcat(outPath,'\','AllCluster.mat'),'Allcc');
        save(strcat(outPath,'\','AllGlobal.mat'),'Allglo');
        save(strcat(outPath,'\','Alllocal.mat'),'Alllocal');
        save(strcat(outPath,'\','Allshortpath.mat'),'Allshortpath');
    end
end
end


  




