function  Fisher_z(inputPath,outPath,numb )
%����˵�������ϵ������������̬�ֲ�����ϵ��С��0.5ʱ��Լ������̬�ֲ�
%��ϵ������0.5ʱ����б(skew to the left)
%Fisher���һ�����ڱ���֮Ϊ��Fisher��s z transformation����ת����ʽ
%���Խ����ϵ��rת��Ϊ��̬�ֲ�����z. 
%��ʽ���£� z = .5[ln(1+r) - ln(1-r)] ֮��Ϳ���ʹ�ó��õ�t������бȽ���
%������n*n����ؾ������Fisher_zת����number����n�ĸ���

%������ڲ���
 number=str2num(numb)
result=zeros(number,number);  %�����Ž���ľ���
  readlist  = dir(inputPath)  
    [m n] = size(readlist)
    for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
              imgPath=strcat(inputPath,'\',subFolderName);
              b=importdata(imgPath);
              for num=1:number %��ȡÿ��ֵ����Fisher_zת��
                  for cow = 1:number
                      score=b(num,cow);
                      result(num,cow)=0.5*(log(1+score)-log(1-score));
                  end
              end
              filename=strcat(outPath,'\',subFolderName)  ;
              save(filename,'result'); 
         end
    end
end