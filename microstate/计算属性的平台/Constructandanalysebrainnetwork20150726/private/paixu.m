function  paixu(oinputdata,ooutputdata,num,pfirst,pstep)
%���ܽ��ܣ�
%��n*n�������������
%��ڲ���
%oinputdata��ʾ���Eֵ������ļ��е�·��
%odatapath��ʾ�����ŵ�·��
%num��ʾr��n��ȡֵ����
% pfirst��ʾģ�Ͳ�������ʼֵ
% pstep��ʾģ�Ͳ����ı仯����ֵ

%���ߣ�ţ����
%���ڣ�2014.05.28

%�����ȡÿ�����Ե�Eֵ����
FolderNamelist=dir(oinputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(ooutputdata,'\',FolderName));
        dataPath=strcat(oinputdata,'\',FolderName);
        newname=strcat(ooutputdata,'\',FolderName);
        
        %�����ȡһ�������µ�ÿ��ϡ����µ�Eֵ����
        FolderNamelist_sparsity=dir(dataPath);
        [Fm_s Fn_s]=size(FolderNamelist_sparsity);
        for FolderNum_sparsity=1:Fm_s
            FolderName_sparsity= FolderNamelist_sparsity(FolderNum_sparsity,1).name;
            display(FolderName_sparsity);
            if FolderName_sparsity ~= '.'
                mkdir(strcat(newname,'\',FolderName_sparsity));
                dataPath_sparsity=strcat(dataPath,'\',FolderName_sparsity);
                newname_sparsity=strcat(newname,'\',FolderName_sparsity);
                
                %�����ȡEֵ�����������
                readlist=dir(strcat(dataPath_sparsity,'\*.mat'));
                [m n]=size(readlist);
                for filenum=1:m
                    fileName=readlist(filenum,1).name;
                    file=strcat(dataPath_sparsity,'\',fileName);
                    display(file);
                    a=importdata(file);
                    inum=pfirst;
                    jnum=pfirst;
                    for i=1:num
                        for j=1:num
                            result((i-1)*num+j,1)=inum;
                            result((i-1)*num+j,2)=jnum;
                            result((i-1)*num+j,3)=a(i,j);
                            jnum=jnum+pstep;
                        end
                        inum=inum+pstep;
                        jnum=pfirst;
                    end
                    orderresult=sortrows(result,-3);
                    save(strcat(newname_sparsity,'\',fileName),'orderresult');
                end
            end
        end
    end
end
end