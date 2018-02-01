function EDmodel(oinputdata1,oinputdata2,ooutputdata,number,first,last,step,filename,pfirst,plast,pstep)
%���ܣ�����ŷʽ����ͽڵ�����ָ�깹��ģ������
%��ڲ�����
% oinputdata1 ��ʾ���ŷʽ������ļ���·�����ļ���
% oinputdata2 ��ʾ��Žӵذ�������ָ����ļ���·��
% ooutputdata ��ʾ��Ž�����ļ���·��
% number ��ʾ����ڵ�ĸ���
% first ��ʾ��ʼ��ϡ���ֵ
% last ��ʾ������ϡ���ֵ
% step  ��ʾϡ��ȵĲ���ֵ
%filename ��ʾ���ƶ�ָ����ļ��������������֣�
% pfirst��ʾģ�Ͳ�������ʼֵ
% plast��ʾģ�Ͳ����Ľ���ֵ
% pstep��ʾģ�Ͳ����ı仯����ֵ

%���ߣ�ţ����
%���ڣ�2014.05.27

%��ȡŷʽ������ļ�
nodeed=importdata(oinputdata1)

%�����ȡÿ�����ԵĽڵ����ƶ��ļ�
FolderNamelist=dir(oinputdata2);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(ooutputdata,'\',FolderName));
        dataPath=strcat(oinputdata2,'\',FolderName);
        newname=strcat(ooutputdata,'\',FolderName);
        
        %��һ�������������ȡÿ��ϡ����µ����ƶ�ָ�깹��ģ��
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %�������ÿ��ϡ����µ�ģ�������·��
            mkdir(strcat(ooutputdata,'\',FolderName,'\sparsity',sparsity_str));
            newname1=strcat(ooutputdata,'\',FolderName,'\sparsity',sparsity_str)
            
            %��ȡÿ��ϡ����µ����ƶ�ָ�����
            file=strcat(dataPath,'\',filename,sparsity_str,'.mat');
            smatrix=importdata(file);
            
            %����ģ������
            %����r��pfirst��plast����Ϊpstep
            for r=pfirst:pstep:plast
                r1=num2str(r*100);
                mkdir(strcat(newname1,'\model',r1));
                %����n��pfirst��plast����Ϊpstep
                for n=pfirst:pstep:plast
                    n1=num2str(n*100);
                    model=zeros(number);
                    for i=1:number
                        for j=1:number
                            %if i==j
                            %modes(i,j) = 1;
                            %else
                            k = smatrix(i,j).^r;
                            d = nodeed(i,j).^-n;
                            model(i,j) = k*d;
                            % end
                            
                        end
                    end
                    save(strcat(newname1,'\model',r1,'\model',n1,'.mat'),'model');
                end
            end
        end
    end
end