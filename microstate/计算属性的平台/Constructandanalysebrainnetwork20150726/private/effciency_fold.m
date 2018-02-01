function effciency_fold(dataPath,newname,c)
%if c==G then  Global efficiency
%if c==l then  local efficiency
FolderNamelist=dir(dataPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
if FolderName ~= '.'
mkdir(strcat(newname,'\',c,FolderName));
dataPath1=strcat(dataPath,'\',FolderName);
readlist=dir(dataPath1);
[m n]=size(readlist);
for t=1:m
    subFolderName=readlist(t,1).name
    if strfind(subFolderName,'mat')
      imgPath=strcat(dataPath1,'\',subFolderName);
      imgPath2=strcat(newname,'\',c,FolderName,'\',subFolderName);
      display(imgPath);
      b=importdata(imgPath);
      if c == 'G'
      E=efficiency(b);
      save(imgPath2,'E');
      end
      if  c=='l'
      E=efficiency(b,1);
      save(imgPath2,'E');
      end 
    end
end
end
end