function part=getAllTimes(FolderPath,newname,number,prefix)
%UNTITLED Summary of this function goes here
%   2011.10.17  wenhong
readlist=dir(strcat(FolderPath,'\*.mat'))
%readlist=dir(dataPath);
[m n]=size(readlist);
k = str2num (number);
h = waitbar(0,'Please wait...');
for FileNum=1:m
    fileName=readlist(FileNum,1).name;
    dataPath=strcat(FolderPath,'\',fileName);
    b=load(dataPath)
for i = 1:9
    matrixName=strcat('AAL0',num2str(i),'TC')
    display(matrixName);
    Timematrix=strcat('b.',matrixName)
    %b.AAL01TC
    test = strcat('a=',Timematrix);
    eval([test])
    AllTimes(:,i) =a(:,1);
end 
for i = 10:k
    matrixName=strcat('AAL',num2str(i),'TC')
    display(matrixName);
    Timematrix=strcat('b.',matrixName)
    %b.AAL01TC
    test = strcat('a=',Timematrix);
    eval([test]);
    AllTimes(:,i) =a(:,1);
end 
 save(strcat(newname,'\','All',prefix,fileName),'AllTimes')       
 AllTimes=[];
 waitbar(i/m,h,'Please wait...',h);
 %waitbar(i/m,h,strcat('Complete ',num2str(FileNum),'/ ',num2str(m)),h);
end 
 close(h);
 part = newname;
end
