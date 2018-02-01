function EDmodelcalpro(inputdata1,inputdata2,outputdata,Enumber,filename_file,first,step,last)
%����������
%������ȫ�����Ե����Ʋв�ıȽ�
%Ҫ����ʵ����ı�����ģ������ı���һһ��Ӧ��������ȫһ��
%��ڲ�����
%inputdata1��ʾ���ģ�����������ֵ��·��
%datapath��ʾ�������Ĵ��·����·��
%inputdata2��ʾ��ž�ֵ���������ֵ��·��
%Enumber��ʾ��������������������r��n��ȡֵ����
%filename_file ��ʾ�洢һ��������һ��ϡ��������Ե��ļ��е�����
% first ��ʾ��ʼ��ϡ���ֵ
% last ��ʾ������ϡ���ֵ
% step  ��ʾϡ��ȵĲ���ֵ

%���ߣ�ţ����
%ʱ�䣺2014.5.28

%�����ȡÿ�����Ե����������ֵ
FolderNamelist=dir(inputdata1);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %ȡģ��������һ�����Ե����Դ��·��
        dataPath1=strcat(inputdata1,'\',FolderName);
        %ȡ��ʵ������һ�����Ե����Դ��·��
        dataPath2=strcat(inputdata2,'\',FolderName);
        %ȡ�����һ�����Ե����Դ��·��
        newname=strcat(outputdata,'\',FolderName);
        %��һ�������������ȡÿ��ϡ����µ����ƶ�ָ�깹��ģ��
        step_number=1;
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %ȡģ��������һ������һ��ϡ����µ����Դ��·��
            dataPath_sparsity=strcat(dataPath1,'\',filename_file,sparsity_str);
            %ȡ�����һ������һ��ϡ����µ����Դ��·��
            mkdir(strcat(newname,'\',filename_file,sparsity_str));
            newname_sparsity=strcat(newname,'\',filename_file,sparsity_str);
            
            %����Eֵ
            
            %��������ž���
%             mkdir(datapath);
            calglobal=zeros(Enumber);
            callocal=zeros(Enumber);
            calshortpath=zeros(Enumber);
            calas=zeros(Enumber);
            calcc=zeros(Enumber);
            calresult=zeros(Enumber);
            
            %��ȡģ���������Դ�ž���
            as=importdata(strcat(dataPath_sparsity,'\assortativity\assortativity.mat'));
            shortpath=importdata(strcat(dataPath_sparsity,'\shortpath\shortpath.mat'));
            glo=importdata(strcat(dataPath_sparsity,'\Global efficiency\Global efficiency.mat'));
            local=importdata(strcat(dataPath_sparsity,'\local efficiency\local efficiency.mat'));
            cc=importdata(strcat(dataPath_sparsity,'\Cluster cofficient\Cluster cofficient.mat'));
            
             %��ȡ��ʵ�������Դ�ž���
             SPLMDD=importdata(strcat(dataPath2,'\shortpath\shortpath.mat'));
             gallDegrees=importdata(strcat(dataPath2,'\global\Global efficiency.mat'));
             lallDegrees=importdata(strcat(dataPath2,'\local\local efficiency.mat'));
             B=importdata(strcat(dataPath2,'\assortativity\assortativity.mat'));
             CCMDD=importdata(strcat(dataPath2,'\Cluster cofficient\Cluster_cofficient.mat'));
             
            for i=1:Enumber
                for j=1:Enumber
                    calshortpath(i,j)=1/(shortpath(i,j)+SPLMDD(step_number,1))^2;
                    calglobal(i,j)=1/(glo(i,j)+gallDegrees(step_number,1))^2;
                    callocal(i,j)=1/(local(i,j)+lallDegrees(step_number,1))^2;
                    calas(i,j)=1/(as(i,j)+B(step_number,1))^2;
                    calcc(i,j)=1/(cc(i,j)+CCMDD(step_number,1))^2;
                    calresult(i,j)=calshortpath(i,j)*calglobal(i,j)*callocal(i,j)*calas(i,j)* calcc(i,j);
                end
            end
            % save(strcat(datapath,'\calas.mat'),'calas');
            % save(strcat(datapath,'\calshortpath.mat'),'calshortpath');
            % save(strcat(datapath,'\calglobal.mat'),'calglobal');
            % save(strcat(datapath,'\callocal.mat'),'callocal');
            % save(strcat(datapath,'\calcc.mat'),'calcc');
            save(strcat(newname_sparsity,'\calresult', sparsity_str,'.mat'),'calresult');
            step_number=step_number+1;
        end
    end
end
end
