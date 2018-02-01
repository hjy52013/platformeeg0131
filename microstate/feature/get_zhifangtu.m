path='E:\实验数据\微状态网络\特征\全局\normal\encoding\alpha\40'
path1=fullfile(path,'global_effcient.mat');
feature=importdata(path1);
figure;
bar([1:10],feature');
title('normal-mean-local-efficient.mat');