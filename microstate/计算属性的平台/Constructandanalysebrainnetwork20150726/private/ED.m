function ED(s)
 i=1;
for k=1:5:351
    result1(i,:)=s(k,:);
    %result1(:,i)=s(:,k);
    i=i+1;
end
save('F:\��������Ĺ�������\pearson\���Է���\modet24\����Ƚ�\��һ��\result1.mat','result1'); 
end