% extractStd('D:\Program Files\MATLAB71\work\R-constructBrainNetwork\jiqingpengpai2\cg-pearson\cg-pearson',2);

%ʵ�ֹ��ܣ���ȡ������n����׼��֮�ڵ����ݼ���ȥ����n����׼��֮�������,�������޳�֮��ľ�ֵ

%������岽�裺
%1.��ȡĳ�����б��Ե�90*90���ϵ�������ĳ�����������ݣ����һ��ά��Ϊ ĳ�� ���� ������Z
%����ĳ����28�����ԣ������ȡ28��������λ�ã�NodeI��NodeJ�����������һ��28ά��������Ϊ��90*90����
%��������ά����Z��90*90*28
%3.�����������ľ�ֵ
%4.������90*90�������ľ�ֵ����һ�����ľ����з��ء�

%�÷�����Ҫ��������1.Ҫ���� �� �����б��Ե�.mat�ļ���2.����
function avg=extractStd(dataPath,FilePath)    
    % FilePath��ʾ�����·��
    readlist  = dir(dataPath)  %dir��������һ��M-by-1�Ľṹ����󣬸ýṹ�����name,date,bytes,isdir
    [m n] = size(readlist)  %����readlist���������������
    
    Z = zeros(90,90,1);   %Z����ά����90*90*m   
    P=0;  %ʵ�ʵĺ�׺��Ϊ.mat�ļ�������Ҳ���Ǳ��Ե�ʵ�ʸ���
    Q=zeros(90,90);   %�޳���ı��Ե�ʵ�ʸ���  
  
    %1.��N�����ԣ�����28����90*90�ľ���ת��Ϊ��ά����
    for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
             P=P+1;
             imgPath=strcat(dataPath,'\',subFolderName);
             display(imgPath)
             load(imgPath);                 
             for i=1:90 
                for j=1:90 
                    Z(i,j,P) = R(i,j);
                end
             end             
         end       
    end

 
    %3.�����������ľ�ֵ
    %4.������90*90�������ľ�ֵ����һ�����Ľ������Result�С�





    [m n P] = size(Z) 
    Result = zeros(90,90);
    tempResult = 0
    for i=1:m 
        for j=1:n
             for k=1:P
                    Q(i,j)=Q(i,j)+1; 
                    tempResult =  tempResult + Z(i,j,k);                        
             end   
             Result(i,j) = tempResult/Q(i,j);      %�����ֵ�������յĽ������Result��
             tempResult = 0;
        end
    end
 filename=strcat(FilePath,'\','avg.mat');
    save(filename,'Result')
end