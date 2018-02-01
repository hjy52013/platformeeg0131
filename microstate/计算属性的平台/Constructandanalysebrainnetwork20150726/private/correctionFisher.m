function part=correctionFisher(dataPath,newname,c,prefix)
%partialcorrectionFisher('E:\Conn',0.015)
% c='p'表示构建person
% c='s'表示构建sparman
readlist=dir(dataPath);
%le=length(prefix)+10;
[m n]=size(readlist);
% load('C:\Users\Administrator\Desktop\meantimes1.mat');
if c=='p'
mkdir(strcat(newname,'\person\','P'));
mkdir(strcat(newname,'\person\','R'));
end
if  c=='s'
mkdir(strcat(newname,'\sparman\','R'));
    end
%把p和R值放在两个不同的子文件夹中
h = waitbar(0,'Please wait...');
for t=1:m
    subFolderName=readlist(t,1).name
    if strfind(subFolderName,'mat')
      imgPath=strcat(dataPath,'\',subFolderName);
     le=strfind(subFolderName,'.')
     %subFolderName1 = subFolderName(4:le);
      subFolderName1 = subFolderName(1:(le-1));
      imgPath1=strcat(newname,'\person\p\',subFolderName1);
      imgPath2=strcat(newname,'\person\R\',subFolderName1);
      imgPath3=strcat(newname,'\sparman\R\',subFolderName1);
      %作用 将结果单独存放在用户定义的路径下
      display(imgPath);
      %load(imgPath);
       % N=AllTimes;
       %N=result1;
        N=importdata(imgPath);
        M=N;
        if c=='p'
           [r,p]=pearson(M');
            P=p;
          R=r;
       cd(dataPath);
       fileName1=strcat(imgPath1,'_P','.mat');
       fileName2=strcat(imgPath2,'_R','.mat');
       save(fileName1,'P');
       save(fileName2,'R');
        waitbar(t/m,h,'Please wait...',h);
       %waitbar(t/m,h,strcat('person Complete ',num2str(t),'/ ',num2str(m)),h);
        else if c=='s'
           r=spearman(M');  
           R=r;
      cd(dataPath);
      fileName2=strcat(imgPath3,'_R','.mat');
       save(fileName2,'R');
        waitbar(t/m,h,'Please wait...',h);
       %waitbar(t/m,h,strcat('spearman Complete ',num2str(t),'/ ',num2str(m)),h);
            end
        end
      part = newname;
    end

end
 close(h);
