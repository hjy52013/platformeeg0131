function P = PLV_one( number_channel,A ,mu,nit)
%PLV_ONE Summary of this function goes here
%   Detailed explanation goes here
%����һ�����Ե�ʱ�����о��������Ӧ�ı��Ե�PLV����
num_channel=number_channel;
%path='C:\Users\lyc\Desktop\test1\1_001.mat';    %�޸Ķ�ȡ·��
%path=readpath;    %�޸Ķ�ȡ·��
%save=savepath;  %���ñ���·��
disp('*************************  PLV read file starting  ********************* ');
%mkdir(savepath);     %������Ҫ�����·��

B=A;
%disp('ԭʼ��ʱ�����Ϊ��');
%disp(B);

P=zeros(num_channel,num_channel);
%disp(MI);
for  i=1:num_channel
%    for   j=i+1:num_channel
    for   j=i:num_channel      %��ʱ�޸ģ�����2016-03-16
      C_x =B(:,i)';% ���Ȼ�õ�һ��ͨ����ȫ��ʱ�����У�������ת��
 %disp('��ǰ��iֵ');
 
       C_y=B(:,j)';% �ֱ�ȡ����ͨ����ȫ��ʱ�����У�������ת��

%mi=information(C_x,C_y,descriptor);

% plv=  PLV_only(C_x,C_y,mu,nit);
% disp(plv);
%%   ԭʼ
% plv=  PLV_only(C_x,C_y,mu,nit);

%%   �Ľ�----16.7.11
plv=  PLV_only(C_x,C_y,mu,nit);  %ʹ���µĴ���--û�����EMD,ͬʱ�޸�����Ӧ�Ĵ��룬�Ľ�-----PLV��ʽ��
P(i,j)=plv;

%%   �Ľ�
%���ﳢ��ʹ���µĸĽ�����������HHT���������EMD������ʹ�õĺ�����PLV_only_new
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

