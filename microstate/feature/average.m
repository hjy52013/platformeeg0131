path='E:\实验数据\微状态网络\微状态时间段\特征\局部\normal\maintenance\theta\40';
for i=1:10
    path1=fullfile(path,num2str(i));
    path1=[path1 '\' 'degree.mat'];
    data=importdata(path1);
    data1(i,:)=data(1,:);
    data2(i,:)=data(2,:);
    data3(i,:)=data(3,:);
    data4(i,:)=data(4,:);
end
data=[mean(data1);mean(data2);mean(data3);mean(data4)];
