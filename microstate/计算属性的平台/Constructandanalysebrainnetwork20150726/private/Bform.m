function bform=Bform(FolderPath,FilePath,number )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
num=str2num(number);
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
%h = waitbar(0,'Please wait...');
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
if FolderName ~= '.'
mkdir(strcat(FilePath,'\',FolderName));
dataPath=strcat(FolderPath,'\',FolderName);
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
for filenum=1:m
fileName=readlist(filenum,1).name;
matPath=strcat(dataPath,'\',fileName);
%Bmatrix=sparse(90,90);
Bmatrix=sparse(num,num);
A=importdata(matPath);
[row col]= size(A);
for rownum=1:row
    Bmatrix(A(rownum,1),A(rownum,2))=1;
    Bmatrix(A(rownum,2),A(rownum,1))=1;
    
end
filename=strcat(strcat(FilePath,'\',FolderName),'\',fileName)
%bformpath=strcat(FilePath);
save(filename,'Bmatrix'); 
end
end
bform = FilePath ;
%waitbar(FolderNum/Fm,h,'Please wait...',h);
end

%close(h);
end


