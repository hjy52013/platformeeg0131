%clear;
%eeglab;
%EEG = pop_loadset('filename','1001.set','filepath','E:\\原始数据\\第一次处理\\正常\\');
%EEG = eeg_checkset( EEG );
a=importdata('E:\实验数据\回龙观10人\network\local_feature_combine\normal\maintenance\alpha\clustering-coefs.mat');
a1=importdata('E:\实验数据\回龙观10人\network\local_feature_combine\patient\maintenance\alpha\clustering-coefs.mat');
b=importdata('E:\实验数据\回龙观10人\传统\局部属性合并\normal\encoding\alpha\clustering-coefs.mat');
b1=importdata('E:\实验数据\回龙观10人\传统\局部属性合并\patient\encoding\alpha\clustering-coefs.mat');
figure('Name','mean_normal_local-efficiency');
subplot(3,3,1);
topoplot(mean(a),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('微状态-正常人');%地形图主要用这个函数
subplot(3,3,2);
topoplot(mean(b),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('传统-正常人');
c=abs(mean(a)-mean(b));
subplot(3,3,3);
topoplot(c,EEG.chanlocs,'maplimits',[0 max(c)]);title('微状态-传统');

subplot(3,3,4);
topoplot(mean(a1),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('微状态-病人');
subplot(3,3,5);
topoplot(mean(b1),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('传统-病人');
c=abs(mean(a1)-mean(b1));
subplot(3,3,6);
topoplot(c,EEG.chanlocs,'maplimits',[0 max(c)]);title('微状态-传统');

c1=mean(a)-mean(a1);
subplot(3,3,7);
topoplot(c1,EEG.chanlocs,'maplimits',[min(c2) max(c2)]);title('微状态');
c2=mean(b)-mean(b1);
subplot(3,3,8);
topoplot(c2,EEG.chanlocs,'maplimits',[min(c2) max(c2)]);title('传统');