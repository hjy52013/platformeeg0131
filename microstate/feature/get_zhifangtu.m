path='E:\ʵ������\΢״̬����\����\ȫ��\normal\encoding\alpha\40'
path1=fullfile(path,'global_effcient.mat');
feature=importdata(path1);
figure;
bar([1:10],feature');
title('normal-mean-local-efficient.mat');