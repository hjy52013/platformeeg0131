function  geshi_trans2(a,newname)
%���ܣ���4005*1�ľ���ת����90*90�ľ���
geshi=zeros(90,90);
[m,n]=size(a);
for fi=1:m
       i=a(fi,1);
       j=a(fi,2);
       geshi(i,j)=a(fi,3);  
       geshi(j,i)=a(fi,3);   
 end
 save(strcat(newname,'\geshi.mat'),'geshi'); 
end