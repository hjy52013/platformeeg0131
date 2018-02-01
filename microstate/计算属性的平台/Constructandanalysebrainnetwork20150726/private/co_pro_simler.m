function co_pro_simler(inputdatapath,outputdatapath,num,pro)
%���ܣ� ����CosPlusָ�겢�������ƶȾ���
% ���ܣ�����HDIָ�겢�������ƶȾ���
% ���ܣ�����HPIָ�겢�������ƶȾ���
% ���ܣ�����jaccardָ�겢�������ƶȾ���
% ���ܣ�����katz0.01ָ�겢�������ƶȾ���
% ���ܣ�����katz0.001ָ�겢�������ƶȾ���
% ���ܣ�����LHN1ָ�겢�������ƶȾ���
% ���ܣ�����LHNII0.9ָ�겢�������ƾ���
% ���ܣ�����LHNII0.95ָ�겢�������ƾ���
% ���ܣ�����LHNII0.95ָ�겢�������ƾ���
% ���ܣ�����ֲ����ر�Ҷ˹ģ����AAָ�겢�������ƾ���
% ���ܣ�����ֲ����ر�Ҷ˹ģ����CNָ�겢�������ƾ���
% ���ܣ�����ֲ����ر�Ҷ˹ģ����RAָ�겢�������ƾ���
% ���ܣ�����LPָ�겢�������ƶȾ���,�ڶ�����ȡ0.0001
% ���ܣ�����MFIָ�겢�������ƾ���
% ���ܣ�����PAָ�겢�������ƾ���
% ���ܣ�����RWR0.85ָ�겢�������ƾ���
% ���ܣ�����RWR0.95ָ�겢�������ƾ���
%���ܣ� ����Saltonָ�겢�������ƾ���
% ���ܣ�����SimRankָ�겢�������ƶȾ���,�ڶ�����ȡ0.8
% ���ܣ�����Sorensonָ�겢�������ƾ���
% ���ܣ�����TSCNָ�겢�������ƾ���,�ڶ�����ȡ0.01
% ���ܣ�����RAָ�겢�������ƾ���

%ţ����,2014-6-19

%��ڲ���:
%(1)inputdatapath�Ǵ����ڲ�����·������ڲ����Ƕ�����Ծ�ϡ���ѡ������ʵ����
% (2)num��ʾ�ڵ�ĸ���
% ��3��outputdatapath��ʾ�����ŵ�·��

%�����ȡÿ�����Ե��ļ�
display(pro);
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
            %��ʽת��
            net = FormNet(b.a,num);
            %����CosPlusָ��
            if pro=='Cos'
            sim = CosPlus( net );
            %������
            save(strcat(newname,'\',matName),'sim');
            end
            
            %����HDIָ��
            if pro == 'HDI'
             sim = HDI( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����HPIָ��
            if pro == 'HPI'
             sim = HPI( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����jaccardָ��
            if pro=='jac'
             sim = Jaccard( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����katz0.01ָ��
            if pro=='ka1'
             sim = Katz ( net ,0.01);
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����katz0.001ָ��
            if pro=='ka2'
             sim = Katz ( net ,0.001);
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����LHN1ָ��
            if pro=='LHN'
            sim = LHN( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����LHNII0.9ָ��
            if pro=='LH0'
            sim = LHNII( net,0.9 );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����LHNII0.95ָ��
            if pro=='LH5'
            sim = LHNII( net,0.95 );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����LHNII0.99ָ��
            if pro=='LH9'
            sim = LHNII( net,0.99 );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����ֲ����ر�Ҷ˹ģ����AAָ��
            if pro=='LNB'
            sim = LNBAA( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����ֲ����ر�Ҷ˹ģ����CNָ��
            if pro=='LNC'
            sim = LNBCN( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����ֲ����ر�Ҷ˹ģ����RAָ��
            if pro=='LNR'
            sim = LNBRA( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����LPָ��
            if pro=='Loc'
             sim  = LocalPath( net, 0.0001 );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����MFIָ��
            if pro=='MFI'
             sim = MFI( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����PAָ��
            if pro=='PA1'
             sim = PA( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����RWR0.85ָ��
            if pro=='RWR'
            sim = RWR( net,0.85 );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����RWR0.95ָ��
            if pro=='RW9'
            sim = RWR( net,0.95 );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            %����Saltonָ��
            if pro=='Sal'
             sim = Salton( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����SimRankָ��
            if pro=='Sim'
             sim = SimRank( net,0.8);
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����Sorensonָ��
            if pro=='Sor'
             sim = Sorenson( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����TSCNָ��
            if pro=='TSC'
             sim = TSCN( net,0.01 );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
             %����RAָ��
             
            if pro=='RA1'
             sim = RA( net );
            %������
            save(strcat(newname,'\',matName),'sim');  
            end
            
            waitbar(i/m,h,'Please wait...',h);
        end
        close(h);
    end
end