function plv = PLV_only_new(x,y,mu,nit)
%PLV Summary of this function goes here

%����������ʱ�����������Ӧ��PLVֵ
% Detailed explanation goes here
%���� x y  :ͨ�����źţ�ʱ�����У�
%mu��ʱ�䴰����
%�任��Ĭ��ʹ�õ���hilbert�任
%nit:(Ŀǰ��֪����������ĺ���)

%%  �µĴ��뿼����EMD�ֽ⣬��ԭʼ���ź��ȴӽϿ��Ƶ���ֽ⵽��խ��Ƶ����
%����ѡ����ӦƵ������ԭʼ���źŵ���س̶ȴ���0.5���ϵ�����խ���źŵ���������Ϊ�µ�ʱ������
 new_x=lyc_emd(x);
 new_y=lyc_emd(y);

%%
mu_l = mu;
 u = mu_l*new_y+(1-mu_l)*new_x;
 v = mu_l*new_x+(1-mu_l)*new_y;
% u = mu_l*y+(1-mu_l)*x;
%  v = mu_l*x+(1-mu_l)*y;
h1=hilbert(u);   %���ʹ�õĲ������ֺ��������Ըı�
h2=hilbert(v);
%
%h11=morlet()
   

%�Բ�ǰ��Ϣ����У����unwrap���ܼ���������λ���䣬���������䣬����ʹ�õ��ǹ��еĺ���������ֻ��ʵ�ֵ��ǶԾ�����а��л��в���
%�����ĸ�ʽunwrap(pha,tol,dim)   
%angle������������������λ�������޷��ǵ�


[phase1]=unwrap(angle(h1));
[phase2]=unwrap(angle(h2));
% since the calculation of the hilbert transform requires integration over
% infinite time; 10% of the calculated instantaneous values are discarded
% on each side of every window
% discard 10%
nit_l=10;        % �������ʲô��˼�� 
nit_l=nit;
perc10w =  floor(nit_l/10);
phase1 = phase1(perc10w:end-perc10w);
phase2 = phase2(perc10w:end-perc10w);


n = 1;
m = 1;
RP=n*phase1-m*phase2; % relative phase
plv=abs(sum(exp(i*RP))/length(RP));

end

