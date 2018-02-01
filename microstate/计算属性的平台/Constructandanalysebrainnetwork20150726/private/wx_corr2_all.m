function wx_corr2_all(inputdata1,inputdata2,outputdata,filename_file,filename_file1,filename_r,filename_m,first,last,step,pfirst,plast,pstep,num)
%���ܣ�������ģ��N*N������Rֵ����������ƶȱȽ�(Ƥ��ѷ������
%ע�������������ֱ�ӹ�����Rֵ��ʵ�����ģ�;���model

%��ʽҪ��
%ģ������Ĵ����ʽ�ǣ���oinputdata1\filename_file\filename_file2\filename_m.mat��
%��ʵ����Ĵ����ʽ�ǣ���inputdata2\filename_file\filename.mat��
%Ҫ����ʵ�����ÿ�����Ե�Rֵ����ֱ𵥶�����һ���ļ�����ļ������Ʋ�ͬ����ģ�������Ӧ���Դ�ŵ��ļ��е�������ͬ��
%�������Ե�Rֵ�ļ�����Ҫ����ȫһ��

%��ڲ���
%inputdata1��ʾһ��Ҫ�Ƚϵ����磨ģ�����磩�Ĵ��·��
%inputdata2��ʾ��һ��Ҫ�Ƚϵ����磨��ʵ���磩�Ĵ��·��
%outputdata��ʾ����Ĵ��·��
%filename_file ��ʾһ��������ϡ��Ȳ���ļ��е����ƣ���������׺���ֵĲ���
%filename_file1��ʾ����r���ļ��е����ƣ���������׺���ֵĲ���
%filename_r��ʾҪ�������ʵ������ļ����в�������׺���ֵĲ���
%filename_m��ʾҪ�����ģ��������ļ����в�������׺���ֵĲ���
%first1��ʾ��Ҫѡȡ��ϡ��ȵ���ʼ��ֵ
%last1��ʾ��Ҫѡȡ��ϡ��ȵĽ�����ֵ
%step1��ʾ��Ҫѡȡ��ϡ��ȵı仯����
% pfirst��ʾģ�Ͳ�������ʼֵ
% plast��ʾģ�Ͳ����Ľ���ֵ
% pstep��ʾģ�Ͳ����ı仯����ֵ
%num��ʾr��n��ȡֵ����

%���ߣ�ţ����
%���ڣ�2014.05.29

%�����ȡÿ�����Ե�����
FolderNamelist=dir(inputdata1);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %ȡģ��������һ�����Ե�������·��
        dataPath1=strcat(inputdata1,'\',FolderName);
        %ȡ��ʵ������һ�����Ե�������·��
        dataPath2=strcat(inputdata2,'\',FolderName);
        %ȡ�����һ�����Ե�����Ĵ��·��
        newname=strcat(outputdata,'\',FolderName);
        
        %��һ�������������ȡÿ��ϡ����µ�����
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
             %ȡģ��������һ������һ��ϡ����µ�������·��
            dataPath_sparsity=strcat(dataPath1,'\',filename_file,sparsity_str);
            %ȡ�����һ������һ��ϡ����µ�������·��
            mkdir(strcat(newname,'\',filename_file,sparsity_str));
            newname_sparsity=strcat(newname,'\',filename_file,sparsity_str);
            
            %�Ƚ����������Ƥ��ѷ��ض�
                result=zeros(num,num);
                %ȡ��ʵ������Ҫ�Ƚϵ�����
                file1=strcat(dataPath2,'\',filename_r,'.mat');
                b=importdata(file1);
                h=1;
                %ȡģ��������Ҫ�Ƚϵ�����
                for fi=pfirst:pstep:plast
                    l=1;
                    fi1=num2str(fi*100);
                    inputdata=strcat(dataPath_sparsity,'\',filename_file1,fi1);
                    for fil=pfirst:pstep:plast
                        fil1=num2str(fil*100);
                        file=strcat(inputdata,'\',filename_m,fil1,'.mat');
                        a=importdata(file);
                        [m,n]=size(a);
                        for i = 1:m
                            
                            a(i,i) = 0;
                            
                        end
                        P = corr2(b,a);
                        result(h,l)=P;
                        l=l+1;
                    end
                    h=h+1;
                end
                save(strcat(newname_sparsity,'\similarJZ',sparsity_str,'.mat'),'result');
        end
    end
end
end