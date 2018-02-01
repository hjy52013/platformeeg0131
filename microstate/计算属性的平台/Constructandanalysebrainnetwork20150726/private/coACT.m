function coACT(inputdatapath,outputdatapath,num)
%���ܣ� ����ACTָ�겢�������ƶȾ���
%ţ����,2014-6-19

%��ڲ���:
%(1)inputdatapath�Ǵ����ڲ�����·������ڲ����Ƕ�����Ծ�ϡ���ѡ������ʵ����
% (2)num��ʾ�ڵ�ĸ���
% ��3��outputdatapath��ʾ�����ŵ�·��

%�����ȡÿ�����Ե��ļ�
FolderNamelist=dir(inputdatapath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdatapath,'\',FolderName));
        dataPath=strcat(inputdatapath,'\',FolderName);
        newname=strcat(outputdatapath,'\',FolderName);
        readlist=dir(strcat(dataPath,'\*.mat'));
        [m n]=size(readlist);
        h = waitbar(0,'Please wait...');
        %��һ�������������ȡ�ļ����м���
        for fileNum=1:m
            matName=readlist(fileNum,1).name;
            matPath=strcat(dataPath,'\',matName);
            le=strfind(matName,'.')
            FolderName=matName(1:(le-1));
            %FolderName=matName;
            b=load(matPath);
            %����ACTָ��
            net = FormNet(b.a,num);
            sim = ACT( net );
            %������
            save(strcat(newname,'\',matName),'sim')
            waitbar(i/m,h,'Please wait...',h);
        end
        close(h);
    end
end