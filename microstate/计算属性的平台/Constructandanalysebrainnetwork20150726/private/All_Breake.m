function All_Breake(inputdata,outputdata,num)
%���ܣ���1�У�N*N���еľ����磨1�У�961�еľ��󣩱��N*N��31*31���ľ���

%��ʽҪ��
%��ؾ���Ĵ����ʽ�ǣ���oinputdata1\filename_file(�����ļ��У�\filename�����Ծ���.mat��

%��ڲ���
%inputdata��ʾ���Ծ���Ĵ��·��
%outputdata��ʾ����Ĵ��·��
%num��ʾr��n��ȡֵ����

%���ߣ�ţ������ţ����
%���ڣ�2014.06.3

%�����ȡÿ�����Ե����Ծ���
FolderNamelist=dir(inputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %ȡһ�����Ե����Ծ�����·��
        dataPath1=strcat(inputdata,'\',FolderName);
        %ȡһ�����Խ���Ĵ��·��
        newname=strcat(outputdata,'\',FolderName);
        
        %��ȡһ�����Ե��������Ծ���
        readlist=dir(strcat(dataPath1,'\*.mat'));
        [m n]=size(readlist);
        
        %����ĸ�ʽת��
        for fileNum=1:m
            matName=readlist(fileNum,1).name;
            matPath=strcat(dataPath1,'\',matName);
            b=importdata( matPath);
             col=1;
            for i=1:num
                for j=1:num
                    %s=sprintf('Simulation in process:%d',ceil(i/10));
                    if col<(num*num+1)
                        AUC_pro(i,j)=b(1,col);
                        col=col+1;
                    end
                    
                end
            end
            
            %������
            save(strcat(newname,'\',matName),'AUC_pro')
        end
    end
end

end