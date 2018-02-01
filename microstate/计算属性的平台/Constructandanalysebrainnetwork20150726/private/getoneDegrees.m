function getoneDegrees(FolderPath,OutPath,number,first,step,last,filename)
%UNTITLED2 Summary of this function goes here
%  2011.10.20
numbe=str2num(number)
h = waitbar(0,'Please wait...');
for rnum=1:numbe
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
if FolderName ~= '.'
dataPath=strcat(FolderPath,'\',FolderName);
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
 %for i=1:m
 j=1;
  for i = first:step:last
      matName  =  strcat(filename,num2str(i),'.mat');
        matPath=strcat(dataPath,'\',matName);
       %matName=readlist(i,1).name;
        %matPath=strcat(dataPath,'\',matName);
       NetworkDegree = importdata(matPath);
       [nm nn]=size(NetworkDegree);
       if nn==4
       %allDegrees((i-first+1),FolderNum-2)=NetworkDegree(rnum,4);
       allDegrees(j,FolderNum-2)=NetworkDegree(rnum,4);
       else if nn==1
        %allDegrees((i-first+1),FolderNum-2)=NetworkDegree(rnum,1);
        allDegrees(j,FolderNum-2)=NetworkDegree(rnum,1);
     
          end
       end
       j=j+1;
 end
 
end 

end
 display(rnum);
fileName=strcat('oneDegrees',num2str(rnum))
%save(strcat('D:\matlab current\onedegree','\',fileName),'allDegrees')
save(strcat(OutPath,'\',fileName),'allDegrees');
waitbar(rnum/numbe,h,'Please wait...',h);
end
close(h);
end

