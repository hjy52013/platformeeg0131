function  geshi_trans(a,newname)
%���ܣ���90*90�ľ���ת����4005*1�ľ���
%�Ƚ�����1������89�������Ķ�Ӧ��ϵд��
%�ٽ��ڶ�������������88��������ȥ������1,2���Ķ�Ӧ��ϵд��
%�������ƣ���д����89��������90�����Ķ�Ӧ��ϵ
k=1;
for fi=1:89
    j=fi+1;
    for i=j:90
       geshi(k,1)=a(fi,i);
       k=k+1;
    end
 end
 save(strcat(newname,'\geshi.mat'),'geshi'); 
end
