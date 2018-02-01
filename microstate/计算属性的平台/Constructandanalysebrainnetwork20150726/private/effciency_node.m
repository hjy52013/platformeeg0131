function E=effciency_node(FolderPath,OutPath,prefix,filename1,first,last,step,number)
num=str2num(number);
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name
if FolderName ~= '.'
  
dataPath=strcat(FolderPath,'\',FolderName)
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
for filenum=first:step:last
      fileName=strcat(filename1,num2str(filenum));
    %filenum=1:m
%fileName=readlist(filenum,1).name;
file=strcat(dataPath,'\',fileName)
b=load(file)
%A=importdata(file)
D=all_shortest_paths(b.Bmatrix);
for i=1:num
sum=0; 
aver=0;
for j=1:num
    if i~=j
    sum=sum+1/D(i,j);
    end
end
aver=sum/(num-1);
B(i,1)=aver;
end

FolderName1=strcat('B',FolderName);
mkdir(strcat(OutPath,'\',prefix,'effciency_node','\',prefix,'EN',FolderName1));
fileName=strcat('B',fileName);
file=strcat(strcat(OutPath,'\',prefix,'effciency_node','\',prefix,'EN',FolderName1),'\',fileName);
save(file,'B');
E = B;
end
end
end


  