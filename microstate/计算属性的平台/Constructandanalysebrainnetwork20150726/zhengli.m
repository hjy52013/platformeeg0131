function zhengli(a,b,c,d)
for m=1:25
    x(1,:)=a(m,:);
    x(2,:)=b(m,:);
    x(3,:)=c(m,:);
    x(4,:)=d(m,:);
    %x(5,:)=e(m,:);
    x1=x';
    y=anova1(x1);
    z(m,1)=y; 
end
save('D:\研\郭老师\多尺度data\多因素方差检验结果\不含90\shortpath\md.mat','z');
end