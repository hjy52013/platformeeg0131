%ʵ�ֵĹ��ܣ�
%1.��ȡĳ�����б��Ե�90*90���ϵ�������ĳ�����������ݣ����һ��ά��Ϊ ĳ�� ���� ������Z
%����ĳ����28�����ԣ������ȡ28��������λ�ã�NodeI��NodeJ�����������һ��28ά��������Ϊ��90*90����
%��������ά����Z��90*90*28
%2.��28ά�����е�ÿһ��ֵ��lnֵ��Ȼ����ͣ�������-2���õ�����ֵ
%3.������ֵ���ھ������γ�һ��90*90�ľ���


function Independent(dataPath,FilePath)  
   readlist  = dir(dataPath)  %dir��������һ��M-by-1�Ľṹ����󣬸ýṹ�����name,date,bytes,isdir
    [m n] = size(readlist)  %����readlist���������������
    Z = zeros(90,90,1);   %Z����ά����90*90*m   
    Y=0;  %ʵ�ʵĺ�׺��Ϊ.mat�ļ�������Ҳ���Ǳ��Ե�ʵ�ʸ���
    Q=zeros(90,90);   %�޳���ı��Ե�ʵ�ʸ���  
  
    %1.��N�����ԣ�����28����90*90�ľ���ת��Ϊ��ά����
     for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
             Y=Y+1;
             imgPath=strcat(dataPath,'\',subFolderName);
             display(imgPath)
             %load(imgPath);
             R=importdata(imgPath);
             for i=1:90 
                for j=1:90 
                    Z(i,j,Y) = R(i,j);
                end
             end             
         end       
     end
   %2.��28ά�����е�ÿһ��ֵ��lnֵ��Ȼ����ͣ�������-2���õ�����ֵ
     [m n Y] = size(Z) 
     Result = zeros(90,90);
    tempResult = 0
    for i=1:m 
        for j=1:n
             for k=1:Y
                    le=log(Z(i,j,k));
                    tempResult =  tempResult + le;                  
             end  
             Result(i,j) = -2*tempResult;    %����ֵ�������յĽ������Result��
             tempResult = 0;
        end
    end
    filename=strcat(FilePath,'\','independent.mat');
    save(filename,'Result')
end