function spar = sparsity(dataPath,flag,newname,number)
%2011.10.9 wenhong
%flag=1 or 0
readlist=dir(strcat(dataPath,'\*.mat'));
[m n]=size(readlist);
 %mkdir(strcat('C:\Users\niulimin\Documents\MATLAB\',newname));
k = str2num (number);
h = waitbar(0,'Please wait...');
for filenum=1:m
fileName=readlist(filenum,1).name;
file=strcat(dataPath,'\',fileName)
%b=load(file);
 display(file)
 F=importdata(file);
% display(b);
% if strfind(fileName,'_P')
%     F=b.P;
% else if strfind(fileName,'_R')
%         F=b.R;
%     end
% end
arnum=1;
for rnum=2:k
    cnum=rnum-1;
    for i=1:cnum
        a(arnum,1)=rnum;
        a(arnum,2)=i;
        display(F(rnum,i));
        %display(b.R(rnum,i));
        a(arnum,3)=F(rnum,i);
        %a(arnum,3)=abs(b.R(rnum,i));
        
        arnum=arnum+1;
        
    end
end
dataPath1 = newname ;
%dataPath1 = strcat('C:\Users\niulimin\Documents\MATLAB\',newname);
if flag == '1'
    sortb=sortrows(a,3);
else
    sortb=sortrows(a,-3);
end
if strfind(fileName,'_P')
filename=strcat(dataPath1,'\','Psort',fileName)
else if strfind(fileName,'_R')
  filename=strcat(dataPath1,'\','Rsort',fileName)
    else 
     filename=strcat(dataPath1,'\','sort',fileName)   
    end
end
save(filename,'sortb'); 
waitbar(i/m,h,'Please wait...',h);
end 
dataPath = newname;
%dataPath =strcat('C:\Users\niulimin\Documents\MATLAB\',newname);
spar = dataPath; 
close(h);
end

