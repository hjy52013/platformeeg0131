function P = PLV_one( number_channel,A ,mu,nit)
%PLV_ONE Summary of this function goes here
%   Detailed explanation goes here
%给定一个被试的时间序列矩阵，求解相应的被试的PLV矩阵
num_channel=number_channel;
%path='C:\Users\lyc\Desktop\test1\1_001.mat';    %修改读取路径
%path=readpath;    %修改读取路径
%save=savepath;  %设置保存路径
disp('*************************  PLV read file starting  ********************* ');
%mkdir(savepath);     %创建将要保存的路径

B=A;
%disp('原始的时间矩阵为：');
%disp(B);

P=zeros(num_channel,num_channel);
%disp(MI);
for  i=1:num_channel
%    for   j=i+1:num_channel
    for   j=i:num_channel      %临时修改，日期2016-03-16
      C_x =B(:,i)';% 首先获得第一个通道的全部时间序列，并进行转置
 %disp('当前的i值');
 
       C_y=B(:,j)';% 分别取其他通道的全部时间序列，并进行转置

%mi=information(C_x,C_y,descriptor);

% plv=  PLV_only(C_x,C_y,mu,nit);
% disp(plv);
%%   原始
% plv=  PLV_only(C_x,C_y,mu,nit);

%%   改进----16.7.11
plv=  PLV_only(C_x,C_y,mu,nit);  %使用新的代码--没有添加EMD,同时修改了相应的代码，改进-----PLV公式，
P(i,j)=plv;

%%   改进
%这里尝试使用新的改进方法，采用HHT，即添加了EMD方法，使用的函数是PLV_only_new
% plv_new=  PLV_only_new(C_x,C_y,mu,nit);
% P(i,j)=plv_new;

   end
end


for  i=1:num_channel
for j=1:num_channel
    P(j,i)=P(i,j);
end

end


%disp(MI);
disp('*************************   plv  ending   ********************* ');
%save([save,'\MI_',fix,'_',number],'MI');
%disp(['**************    save    MI',fix,'_',number,'   *********************']);
disp('out');

end

