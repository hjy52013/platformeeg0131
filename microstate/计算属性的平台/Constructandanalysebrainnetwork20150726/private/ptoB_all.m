function ptoB_all(oinputdata,ooutputdata,number,first,last,step,filename1)
%���ܣ�ģ������ϡ���ѡ��
%��ڲ�����
% oinputdata ��ʾ��������ģ��������ļ���·��
% ooutputdata ��ʾ��Ž�����ļ���·��
% number ��ʾ����ڵ�ĸ���
% number ��ʾ����ڵ�ĸ���
% first ��ʾ��ʼ��ϡ���ֵ
% last ��ʾ������ϡ���ֵ
% step  ��ʾϡ��ȵĲ���ֵ
%filename1��ʾһ�������¸�ϡ���������ŵ��ļ����������������֣�

%���ߣ�ţ����
%���ڣ�2014.05.27

%�����ȡÿ�����Եľ���������������
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
FolderName= FolderNamelist(FolderNum,1).name;
 display(FolderName);
 if FolderName ~= '.'
mkdir(strcat(ooutputdata,'\',FolderName));
dataPath=strcat(oinputdata,'\',FolderName);
newname=strcat(ooutputdata,'\',FolderName);

%��һ�������������ȡÿ��ϡ����µľ���������������
for sparsity= first:step:last
    sparsity_str=num2str(sparsity);
    %��ȡһ������ÿ��ϡ����¾���������������Ĵ��·��
    dataPath1=strcat(dataPath,'\',filename1,sparsity_str);
    
     %�������ÿ��ϡ����µ�ϡ��Ƚ�ȡ���������·��
  mkdir(strcat(newname,'\',filename1,sparsity_str));  
  newname1=strcat(newname,'\',filename1,sparsity_str)
  
  %�����ȡһ�������µ�ÿ��ϡ����µľ���������������
FolderNamelist_sparsity=dir(dataPath1);
[Fm_s Fn_s]=size(FolderNamelist_sparsity);
for FolderNum_sparsity=1:Fm_s
FolderName_sparsity= FolderNamelist_sparsity(FolderNum_sparsity,1).name;
 display(FolderName_sparsity);
 if FolderName_sparsity ~= '.'
mkdir(strcat(newname1,'\',FolderName_sparsity));
dataPath_sparsity=strcat(dataPath1,'\',FolderName_sparsity);
newname_sparsity=strcat(newname1,'\',FolderName_sparsity);

%�����ȡģ���������ϡ���ѡ��
readlist=dir(strcat(dataPath_sparsity,'\*.mat'));
[m n]=size(readlist);
for filenum=1:m    
fileName=readlist(filenum,1).name;
file=strcat(dataPath_sparsity,'\',fileName);
 display(file);
 F=importdata(file);
 knum=sparsity*number*(number-1)*0.01/2;
 knum=round(knum)
for i=1:knum
    F(i,3)=1;
    a(i,:)=F(i,:);
end 
filename=strcat(newname_sparsity,'\',fileName) 
save(filename,'a')
a=[]
end
 
 end
end
 end
end
end