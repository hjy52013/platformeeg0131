function plv = PLV_only(x,y,mu,nit)
%PLV Summary of this function goes here

%单独的两个时间序列求解相应的PLV值
% Detailed explanation goes here
%参数 x y  :通道的信号（时间序列）
%mu：时间窗长度
%变换：默认使用的是hilbert变换
%nit:(目前不知道这个参数的含义)


mu_l = mu;
u = mu_l*y+(1-mu_l)*x;
v = mu_l*x+(1-mu_l)*y;


h1=hilbert(u);   %如果使用的不是这种函数，可以改变
h2=hilbert(v);
%
%h11=morlet()
   

%对波前信息进行校正，unwrap功能检查出数据相位跳变，并纠正跳变，这里使用的是固有的函数，但是只能实现的是对矩阵进行按行或按列操作
%完整的格式unwrap(pha,tol,dim)   
%angle函数是用来求输入相位的四象限幅角的


[phase1]=unwrap(angle(h1));
[phase2]=unwrap(angle(h2));
% since the calculation of the hilbert transform requires integration over
% infinite time; 10% of the calculated instantaneous values are discarded
% on each side of every window
% discard 10%
nit_l=10;        % 这个参数什么意思？ 
nit_l=nit;
perc10w =  floor(nit_l/10);
phase1 = phase1(perc10w:end-perc10w);
phase2 = phase2(perc10w:end-perc10w);


n = 1;
m = 1;
RP=n*phase1-m*phase2; % relative phase
plv=abs(sum(exp(i*RP))/length(RP));

end

