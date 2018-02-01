%clear;
%eeglab;
%EEG = pop_loadset('filename','1001.set','filepath','E:\\ԭʼ����\\��һ�δ���\\����\\');
%EEG = eeg_checkset( EEG );
a=importdata('E:\ʵ������\������10��\network\local_feature_combine\normal\maintenance\alpha\clustering-coefs.mat');
a1=importdata('E:\ʵ������\������10��\network\local_feature_combine\patient\maintenance\alpha\clustering-coefs.mat');
b=importdata('E:\ʵ������\������10��\��ͳ\�ֲ����Ժϲ�\normal\encoding\alpha\clustering-coefs.mat');
b1=importdata('E:\ʵ������\������10��\��ͳ\�ֲ����Ժϲ�\patient\encoding\alpha\clustering-coefs.mat');
figure('Name','mean_normal_local-efficiency');
subplot(3,3,1);
topoplot(mean(a),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('΢״̬-������');%����ͼ��Ҫ���������
subplot(3,3,2);
topoplot(mean(b),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('��ͳ-������');
c=abs(mean(a)-mean(b));
subplot(3,3,3);
topoplot(c,EEG.chanlocs,'maplimits',[0 max(c)]);title('΢״̬-��ͳ');

subplot(3,3,4);
topoplot(mean(a1),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('΢״̬-����');
subplot(3,3,5);
topoplot(mean(b1),EEG.chanlocs,'maplimits',[min(mean(a)) max(mean(a))]);title('��ͳ-����');
c=abs(mean(a1)-mean(b1));
subplot(3,3,6);
topoplot(c,EEG.chanlocs,'maplimits',[0 max(c)]);title('΢״̬-��ͳ');

c1=mean(a)-mean(a1);
subplot(3,3,7);
topoplot(c1,EEG.chanlocs,'maplimits',[min(c2) max(c2)]);title('΢״̬');
c2=mean(b)-mean(b1);
subplot(3,3,8);
topoplot(c2,EEG.chanlocs,'maplimits',[min(c2) max(c2)]);title('��ͳ');