function BCTpropertydataform( inputdatapath ,outputdatapath,number)
%UNTITLED Summary of this function goes here
%   2012.02.22
num=str2num(number);
FolderNamelist=dir(inputdatapath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
 display(FolderName);
if FolderName ~= '.'
mkdir(strcat(outputdatapath,'\','B',FolderName));
dataPath=strcat(inputdatapath,'\',FolderName);
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
for filenum=1:m
fileName=readlist(filenum,1).name;
matPath=strcat(dataPath,'\',fileName);
Bmatrix=zeros(num);
A=importdata(matPath);
[row col]= size(A);
for rownum=1:row
    Bmatrix(A(rownum,1),A(rownum,2))=1;
    Bmatrix(A(rownum,2),A(rownum,1))=1;
    
end
filename=strcat(strcat(outputdatapath,'\','B',FolderName),'\','B',fileName)
save(filename,'Bmatrix'); 
end
end
end





end

