function ptob = PtoB(dataPath,sparsitysta,sparsityend,step,newname,prefix,num)
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
h = waitbar(0,'Please wait...');
for fileNum=1:m
matName=readlist(fileNum,1).name;
matPath=strcat(dataPath,'\',matName); 
 le=strfind(matName,'.')
FolderName=matName(1:(le-1));
%FolderName=matName;
for p=sparsitysta:step:sparsityend
    knum=p*num*(num-1)*0.01/2;
%knum=p*19900*0.01;
knum=round(knum)
b=load(matPath);
for i=1:knum
    b.sortb(i,3)=1;
    a(i,:)=b.sortb(i,:);
end
%fileName=strcat('BSortCon',num2str(p))
fileName=strcat('BSort',prefix,num2str(p))
filePath=mkdir(strcat(newname,'\','B',FolderName))
save(strcat(newname,'\','B',FolderName,'/',fileName),'a')
a=[]
end
waitbar(i/m,h,'Please wait...',h);
end 
ptob = dataPath;
close(h);
end


