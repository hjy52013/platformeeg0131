
function yidong(dataPath,FilePath)    
    % FilePath��ʾ�����·��
    readlist  = dir(dataPath)  %dir��������һ��M-by-1�Ľṹ����󣬸ýṹ�����name,date,bytes,isdir
    [m n] = size(readlist)  %����readlist���������������
    
    P=0;
    Q=zeros(38,24);   %�޳���ı��Ե�ʵ�ʸ���  
  
    %1.��N�����ԣ�����28����90*90�ľ���ת��Ϊ��ά����
    for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
             P=P+1;
             imgPath=strcat(dataPath,'\',subFolderName);
             display(imgPath)
             load(imgPath);                 
             for i=1:38 
                for j=8:32
                    Q(i,j-7) = B(i,j);
                     filename=strcat(FilePath,'\',subFolderName);
                     save(filename,'Q')
                end
             end             
         end       
    end

 
  
   

end