%clear;
%eeglab;
%EEG = pop_loadset('filename','1001.set','filepath','E:\\ԭʼ����\\��һ�δ���\\����\\');
path='E:\ʵ������\΢״̬����\΢״̬\encoding\alpha';
for i=1:20
    path1=[path '\' num2str(i) '.mat'];
    data=importdata(path1);
    figure;
    title(num2str(i));
    subplot(1,4,1);
    topoplot(data(1,:),EEG.chanlocs,'maplimits',[min(data(1,:)) max(data(1,:))]);
    subplot(1,4,2);
    topoplot(data(2,:),EEG.chanlocs,'maplimits',[min(data(2,:)) max(data(2,:))]);
    subplot(1,4,3);
    topoplot(data(3,:),EEG.chanlocs,'maplimits',[min(data(3,:)) max(data(3,:))]);
    subplot(1,4,4);
    topoplot(data(4,:),EEG.chanlocs,'maplimits',[min(data(4,:)) max(data(4,:))]);
end