function sparsity_all(oinputdata,ooutputdata,number)
%���ܣ�ģ����������(ȥ��һ��)
%��ڲ�����
% oinputdata ��ʾ���ģ��������ļ���·��
% ooutputdata ��ʾ��Ž�����ļ���·��
% number ��ʾ����ڵ�ĸ���

%���ߣ�ţ����
%���ڣ�2014.05.27

%�����ȡÿ�����Ե�ģ������
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
 display(FolderName);
 if FolderName ~= '.'
mkdir(strcat(ooutputdata,'\',FolderName));
dataPath=strcat(oinputdata,'\',FolderName);
newname=strcat(ooutputdata,'\',FolderName);

%�����ȡһ�������µ�ÿ��ϡ����µ�ģ������
FolderNamelist_sparsity=dir(dataPath);
[Fm_s Fn_s]=size(FolderNamelist_sparsity);
for FolderNum_sparsity=1:Fm_s
FolderName_sparsity= FolderNamelist_sparsity(FolderNum_sparsity,1).name;
 display(FolderName_sparsity);
 if FolderName_sparsity ~= '.'
mkdir(strcat(newname,'\',FolderName_sparsity));
dataPath_sparsity=strcat(dataPath,'\',FolderName_sparsity);
newname_sparsity=strcat(newname,'\',FolderName_sparsity);

%�����ȡһ�������µ�һ��ϡ����µ�����rȷ��ʱ��ģ������
FolderNamelist_r=dir(dataPath_sparsity);
[Fm_r Fn_r]=size(FolderNamelist_r);
for FolderNum_r=1:Fm_r
FolderName_r= FolderNamelist_r(FolderNum_r,1).name;
 display(FolderName_r);
 if FolderName_r ~= '.'
mkdir(strcat(newname_sparsity,'\',FolderName_r));
dataPath_r=strcat(dataPath_sparsity,'\',FolderName_r);
newname_r=strcat(newname_sparsity,'\',FolderName_r);

%�����ȡģ�������������
readlist=dir(strcat(dataPath_r,'\*.mat'));
[m n]=size(readlist);

for filenum=1:m    
fileName=readlist(filenum,1).name;
file=strcat(dataPath_r,'\',fileName);
 display(file);
 F=importdata(file);
arnum=1;
for rnum=2:number
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
    sortb=sortrows(a,-3);
    
    %Ϊ����������������pֵ����rֵ����
if strfind(fileName,'_P')
filename=strcat(newname_r,'\','Psort',fileName)
else if strfind(fileName,'_R')
  filename=strcat(newname_r,'\','Rsort',fileName)
    else 
     filename=strcat(newname_r,'\','sort',fileName)   
    end
end
save(filename,'sortb');

end
 end
end
 end
end
 end
end
end