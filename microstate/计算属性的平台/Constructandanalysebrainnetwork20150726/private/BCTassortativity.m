function BCTassortativity(inputdatapath,outPath,filename,first,last,step)
FolderNamelist=dir(inputdatapath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name
if FolderName ~= '.'
dataPath=strcat(inputdatapath,'\',FolderName);
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
j=1;
for i = first:step:last
    % filenum=1:m
       matName  =  strcat('B',filename,num2str(i),'.mat');
        matPath=strcat(dataPath,'\',matName);
%fileName=readlist(filenum,1).name;
%matPath=strcat(dataPath,'\',fileName);
A=importdata(matPath);
r = assortativity(A,0);
%B((i-first+1),FolderNum-2)=r;
B(j,FolderNum-2)=r;
j=j+1;
end
save(strcat(outPath,'\assortativity.mat'),'B')
end

end
