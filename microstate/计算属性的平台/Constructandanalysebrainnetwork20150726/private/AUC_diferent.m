function AUC_diferent(inputdata,outputdata,sparsity_number,filename_file,filename,first,last,step,num,bs_num)
%���ܣ������������¶������µĶ�������ĳ�����Ե�AUCֵ��
%ע����Ҫ��Ϊ�Ĵ󲿷�
%һ������������ĳ�����Եľ������б�ʾ��ʽ�����磺����ϡ���8��32��ģ�����磬��һ��ϡ����»�õ�һ��ĳ�����Եľ�����8��32����25������
%    ����25������ϳ�һ�������ºϳɵľ����һ��Ϊԭ����һ������һ������25�У���ϡ���8��ϡ���32.
%    ��ÿ��ϡ��������ϵ���ľ���Ϊ31*31�����ºϳɵľ���Ϊ25�У�961��
%��������һ���ϳɵľ������AUC���㡣���磺�ϳɵľ���Ϊ25�У�961�У���ÿһ�зֱ����AUC���㣬Ȼ��õ�һ��1�У�961�еľ���
%����ת�����㡣��Ϊ����һ�������ͳһ�����磺��1*961�ľ���ת�ó�961*1�ľ���
%�ģ���һ�鱻�ԣ���28����38������961*1�ľ������һ���������γ�961*28��962*38�ľ���

%��ʽҪ��
%��ؾ���Ĵ����ʽ�ǣ���oinputdata1\filename_file(�����ļ��У�\filename_file2��ϡ����ļ��У�\shuxing_file�������ļ��У�\filename_m�����Ծ���.mat��

%���ߣ�ţ����
%���ڣ�2014.06.01

%��ڲ���
%inputdata��ʾ��ؾ���Ĵ��·��
%outputdata��ʾ����Ĵ��·��
%sparsity_number��ʾϡ��ȵĸ���
%num��ʾr��n��ȡֵ����
%first��ʾ��Ҫѡȡ��ϡ��ȵ���ʼ��ֵ
%last��ʾ��Ҫѡȡ��ϡ��ȵĽ�����ֵ
%step��ʾ��Ҫѡȡ��ϡ��ȵı仯����
%filename_file��ʾϡ��ȼ�����ļ�������
%filename��ʾĳ������
%num��ʾr��n��ȡֵ����
%bs_num��ʾһ�鱻���б��Եĸ���

%�����ȡÿ�����Ե������������ؾ���
FolderNamelist=dir(inputdata);
[Fm Fn]=size(FolderNamelist);

%����һ�鱻�ԵĶ�������ĳ������AUCֵ�Ĵ�ž���
AUC_pro=zeros((num*num),bs_num);
bs_col=1;
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name;
    display(FolderName);
    if FolderName ~= '.'
        mkdir(strcat(outputdata,'\',FolderName));
        %ȡģ��������һ�����ԵĶ�������ĳ������AUCֵ�Ĵ�ž���Ĵ��·��
        dataPath1=strcat(inputdata,'\',FolderName);
        %ȡһ�����Խ���Ĵ��·��
        newname=strcat(outputdata,'\',FolderName);
        
        %һ������������ĳ�����Եľ������б�ʾ��ʽ��
        %��һ�������������ȡÿ��ϡ����µĶ�������ĳ�����Եľ���
        
        %������һ�����ԵĶ�������ĳ�����Եľ���
        AllTC=zeros(sparsity_number,(num*num));
        for sparsity= first:step:last
            sparsity_str=num2str(sparsity);
            
            %ȡģ��������һ������һ��ϡ����µĶ�������ĳ������AUCֵ�Ĵ�ž���
            file=strcat(dataPath1,'\',filename_file,sparsity_str,'\',filename,'\',filename,'.mat');
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
        
        %����ת�����㡣
        AUCecompare=PROAUC';
       save(strcat(newname,'\auc',filename,'.mat'),'PROAUC');
        %�ģ���һ�鱻�ԣ���28����38������961*1�ľ������һ��������
        AUC_pro(:,bs_col)=AUCecompare(:,1);
        bs_col=bs_col+1;
    end
     mkdir(strcat(outputdata,'\',filename));
     save(strcat(outputdata,'\',filename,'\AUC',filename,'.mat'),'AUC_pro');
end
end