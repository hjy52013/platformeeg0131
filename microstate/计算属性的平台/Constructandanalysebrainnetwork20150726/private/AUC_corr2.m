function AUC_corr2(inputdata,outputdata,sparsity_number,filename_file,filename,first,last,step,num)
%���ܣ�����һ�������¶��ϡ����µĸ�ģ������ʵ�������ϵ������Ƥ��ѷ��أ���AUCֵ
%ע����Ҫ��Ϊ���󲿷�
%һ�������ϵ���ľ������б�ʾ��ʽ�����磺����ϡ���8��32��ģ�����磬��һ��ϡ����»�õ�һ�����ϵ���ľ�����8��32����25������
%    ����25������ϳ�һ�������ºϳɵľ����һ��Ϊԭ����һ������һ������25�У���ϡ���8��ϡ���32.
%    ��ÿ��ϡ��������ϵ���ľ���Ϊ31*31�����ºϳɵľ���Ϊ25�У�961��
%��������һ���ϳɵľ������AUC���㡣���磺�ϳɵľ���Ϊ25�У�961�У���ÿһ�зֱ����AUC���㣬Ȼ��õ�һ��1�У�961�еľ���
%�������ڵ�һ��������̡����磺���ڶ����ϳɵ�1�У�961�еľ��󣬰��յ�һ��������̱��31*31�ľ���

%��ʽҪ��
%��ؾ���Ĵ����ʽ�ǣ���oinputdata1\filename_file(�����ļ��У�\filename_file2��ϡ����ļ��У�\filename_m����ؾ���.mat��

%���ߣ�ţ����
%���ڣ�2014.05.29

%��ڲ���
%inputdata��ʾ��ؾ���Ĵ��·��
%outputdata��ʾ����Ĵ��·��
%sparsity_number��ʾϡ��ȵĸ���
%num��ʾr��n��ȡֵ����
%first��ʾ��Ҫѡȡ��ϡ��ȵ���ʼ��ֵ
%last��ʾ��Ҫѡȡ��ϡ��ȵĽ�����ֵ
%step��ʾ��Ҫѡȡ��ϡ��ȵı仯����
%filename_file��ʾϡ��ȼ�����ļ�������
%filename��ʾ�����������ؾ�������ƣ�����������
%num��ʾr��n��ȡֵ����

%�����ȡÿ�����Ե������������ؾ���
FolderNamelist=dir(inputdata);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %ȡģ��������һ�����Ե������������ؾ�����·��
        dataPath1=strcat(inputdata,'\',FolderName);
        %ȡһ�����Խ���Ĵ��·��
        newname=strcat(outputdata,'\',FolderName);
        
        %һ�������ϵ���ľ������б�ʾ��ʽ��
        %��һ�������������ȡÿ��ϡ����µ������������ؾ���
        
        %������һ�����Ե�������������ϵ���ĵľ���
        AllTC=zeros(sparsity_number,(num*num));
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %ȡģ��������һ������һ��ϡ����µ������������ؾ���
            file=strcat(dataPath1,'\',filename_file,sparsity_str,'\',filename,sparsity_str,'.mat');
            b=importdata(file);
            [m,n]=size(b);
            i=1;
            for row_r=1:m
                for col_r=1:m
                    AllTC((sparsity-first+1),i)=b(row_r,col_r);
                    i=i+1;
                end
            end
        end
        
        %��������һ���ϳɵľ������AUC���㡣
         Degreemat= AllTC;  %����һ���Ľ������ֵ���ڶ���
         number=sparsity_number;  %��ϡ��ȵĸ�����ֵ������
         subCount=(num*num);  %����һ����������ֵ���ڶ���
        flag=zeros();
        s1flag=zeros();
        s2flag=zeros();
        for col=1:subCount
            AUCarea=0;%AUCarea�����
            s=0;s1=0;  %s1���������ε����    s�����������κ������ε����֮��
            s2=0%s2���������ε����
            for endj=1:(number-1)
                Degreemat(endj,col)
                Degreemat(endj+1,col)
                if(Degreemat(endj,col)>Degreemat(endj+1,col))
                    s1=Degreemat(endj,col)*0.1;
                    s2=(Degreemat(endj,col)-Degreemat(endj+1,col))*0.1/2;
                    s=s1-s2;
                    %s=s1+s2;
                    AUCarea=AUCarea+s;
                    flag(col,endj)=AUCarea;
                    s1flag(col,endj)=s1;
                    s2flag(col,endj)=s2;
                    
                    
                elseif (Degreemat(endj,col)<Degreemat(endj+1,col))
                    s1=Degreemat(endj,col)*0.1;
                    s2=(Degreemat(endj+1,col)-Degreemat(endj,col))*0.1/2;
                    s=s1+s2;
                    
                    AUCarea=AUCarea+s;
                    flag(col,endj)=AUCarea;
                    s1flag(col,endj)=s1;
                    s2flag(col,endj)=s2;
                else   s1=Degreemat(endj,col)*0.1;
                    %s2=(Degreemat(endj,col)-Degreemat(starti,col))*0.1/2;
                    %s=s1+s2;
                    AUCarea=AUCarea+s1;
                    flag(col,endj)=AUCarea;
                    s1flag(col,endj)=s1;
                    s2flag(col,endj)=s2;
                    
                    
                end
                
            end
            PROAUC(1,col)=AUCarea;
        end
        
        %�������ڵ�һ��������̣���ʽ����
        AUCecompare=zeros(num,num);
        col_P=1;
        for i=1:num
            for j=1:num
                if col_P<(num*num+1)
                    AUCecompare(i,j)=PROAUC(1,col_P);
                    col_P=col_P+1;
                end
                
            end
        end
             save(strcat(newname,'\AUC','.mat'),'AUCecompare');
    end
end
end