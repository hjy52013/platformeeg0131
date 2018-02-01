clear;
eeglab;
EEG = pop_loadset('filename','1001.set','filepath','E:\\原始数据\\第一次处理\\正常\\');
path='E:\实验数据\微状态网络\微状态时间段\特征\局部\normal\maintenance\alpha\30\1';
path1=[path '\' 'node_effcient.mat'];
%    data=importdata(path1);

path='E:\实验数据\微状态网络\特征\局部\normal\encoding\alpha\30';
for i=1:10
    path1=fullfile(path,num2str(i));
    path1=[path1 '\' 'node_effcient.mat'];
    data=importdata(path1);
    data1(i,:)=data(1,:);
    data2(i,:)=data(2,:);
    data3(i,:)=data(3,:);
    data4(i,:)=data(4,:);
end
data=[mean(data1);mean(data2);mean(data3);mean(data4)];

figure;
title('degree');
subplot(2,4,1);
topoplot(data(1,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);
subplot(2,4,2);
topoplot(data(2,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);
subplot(2,4,3);
topoplot(data(3,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);
subplot(2,4,4);
topoplot(data(4,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);

path='E:\实验数据\微状态网络\特征\局部\patient\encoding\alpha\30';
for i=1:10
    path1=fullfile(path,num2str(i));
    path1=[path1 '\' 'node_effcient.mat'];
    data5=importdata(path1);
    data1(i,:)=data5(1,:);
    data2(i,:)=data5(2,:);
    data3(i,:)=data5(3,:);
    data4(i,:)=data5(4,:);
end
data1=[mean(data1);mean(data2);mean(data3);mean(data4)];

hold on
subplot(2,4,5);
topoplot(data1(1,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);
subplot(2,4,6);
topoplot(data1(2,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);
subplot(2,4,7);
topoplot(data1(3,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);
subplot(2,4,8);
topoplot(data1(4,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);