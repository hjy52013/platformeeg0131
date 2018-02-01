function  mean_fold(dataPath,newname)
FolderNamelist=dir(dataPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
if FolderName ~= '.'
mkdir(strcat(newname,'\',FolderName));
dataPath1=strcat(dataPath,'\',FolderName);
readlist=dir(dataPath1);
[m n]=size(readlist);
for t=1:m
    subFolderName=readlist(t,1).name
    if strfind(subFolderName,'mat')
      imgPath=strcat(dataPath1,'\',subFolderName);
      imgPath2=strcat(newname,'\',FolderName,'\',subFolderName);
      display(imgPath);
      b=importdata(imgPath);
      
      M= mean(b)
      save(imgPath2,'M');
    end
end
end
end