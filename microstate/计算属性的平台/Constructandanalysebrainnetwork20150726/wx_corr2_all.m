function wx_corr2_all(ioa,geshi,oodataPath)

%功能：构建的模型90*90矩阵与R值矩阵进行相似度比较
%geshi:90*90的R值矩阵
%dataPath：模型矩阵的地址
%newname:存储的路径
%2014.02.25 wangxi
for in = 1:25
   indicator = ioa{1,in}
   % indicator = dicator{1,in};
    odataPath = strcat(oodataPath,indicator,'\模型网络\modet8-32');
    newname = strcat(oodataPath,indicator,'\corr2');

for al=8:32
    similarJZ=zeros(31,31);
    al1=num2str(al);
   dataPath=strcat(odataPath,'\modet',al1);
for fi=0:10:300
    i = fi/10+1;
    fi1=num2str(fi);
readlist=dir(strcat(dataPath,'\modet',fi1,'\*.mat'));
[m n]=size(readlist);
 %mkdir(strcat('C:\Users\niulimin\Documents\MATLAB\',newname));
%k = str2num (number);

for filenum =0:10:300  
    j = filenum/10+1;
   
    j1=num2str(filenum);
%fileName=readlist(filenum,1).name;
file=strcat(dataPath,'\modet',fi1,'\modet',j1,'.mat');
%b=load(file);
 display(file);
 F=importdata(file);
 for ffi = 1:90
 
          F(ffi,ffi) = 0;
 
end
 P = corr2(geshi,F);
 similarJZ(i,j) = P
 
% a = load(file);
% display(b);
% if strfind(fileName,'_P')
%     F=b.P;
% else if strfind(fileName,'_R')
%         F=b.R;
%     end
% end
% arnum=1;
% for rnum=2:k
%     cnum=rnum-1;
%     for i=1:cnum
%         a(arnum,1)=rnum;
%         a(arnum,2)=i;
%         display(F(rnum,i));
%         %display(b.R(rnum,i));
%         a(arnum,3)=F(rnum,i);
%         %a(arnum,3)=abs(b.R(rnum,i));
%         
%         arnum=arnum+1;
%         
%     end
% end
% dataPath1 = strcat(newname,'\modet',fi1) ;
% %dataPath1 = strcat('C:\Users\niulimin\Documents\MATLAB\',newname);
% %if flag == '1'
%     sortb=sortrows(a,-3);
%else
   % sortb=sortrows(a,-3);
%end
% if strfind(fileName,'_P')
% filename=strcat(dataPath1,'\','Psort',fileName)
% else if strfind(fileName,'_R')
%   filename=strcat(dataPath1,'\','Rsort',fileName)
%     else 
%      filename=strcat(dataPath1,'\','sort',fileName)   
%     end
% end
% save(filename,'sortb'); 
% waitbar(i/m,h,'Please wait...',h);
end 
%dataPath = newname;
%dataPath =strcat('C:\Users\niulimin\Documents\MATLAB\',newname);
%spar = dataPath; 

end
mkdir(strcat(newname,'\modet',al1));
save(strcat(newname,'\modet',al1,'\similarJZ.mat'),'similarJZ');

end

end

end