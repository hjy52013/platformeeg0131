function guiyi(oinputdata,ooutputdata,filename,first,last,step)
%���ܣ�ʵ�ֶ����ƶ�ָ��Ĺ�һ��������Զ�����Ե�������

%�洢��ʽ����oinputdata\filename_file(�����ļ�������\filename.mat��

%��ڲ�����
% oinputdata��ʾ���ŷʽ������ļ���·�����ļ���
% ooutputdata ��ʾ��Ž�����ļ���·��
% first ��ʾ��ʼ��ϡ���ֵ
% last ��ʾ������ϡ���ֵ
% step  ��ʾϡ��ȵĲ���ֵ
%filename ��ʾ���ƶ�ָ����ļ��������������֣�

%���ߣ�ţ����
%���ڣ�2014.05.27

%�����ȡÿ�����ԵĽڵ����ƶ��ļ�
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(ooutputdata,'\',FolderName));
        dataPath=strcat(oinputdata,'\',FolderName);
        newname=strcat(ooutputdata,'\',FolderName);
        
         %��һ�������������ȡÿ��ϡ����µ����ƶ�ָ��
         for sparsity= first:step:last
             sparsity_str=num2str(sparsity);
             
             file=strcat(dataPath,'\',filename,sparsity_str,'.mat');
             gy=importdata(file);
             [m,n]=size(gy);
             sim=zeros(m);
            
             %�Ծ�����й�һ��
             minva=min(gy);
             minvalue=min(minva);
             maxva=max(gy);
             maxvalue=max(maxva);
             for i=1:m
                 for j=1:m
                     v=gy(i,j);
                     %guiyi=(v-min)*(max-min);
                     sim(i,j)=(v-minvalue)/(maxvalue-minvalue);
                 end
             end
            save(strcat(newname,'\gy',filename,sparsity_str,'.mat'),'sim');  
         end
    end
end
end