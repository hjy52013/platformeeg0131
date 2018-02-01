%批处理PLV,全部的被试405，除了delta段的数据
set1=1:1:152;
set2=1:1:103;
set3=1:1:80;
set4=1:1:70;
num=length(set1)+length(set2)+length(set3)+length(set4);
%增加的测试语句：
disp('总的数据长度：'+num);
%修改前的代码：channel_num=32;
channel_num=32;    %可以用于修改通道数量
disp('通道个数：'+channel_num);
%修改路径path='D:\work\deap';
path='D:\EEG_data\wzdeep_data_Brain_all';
save='F:\work\deap_PLV\network';



mu=0.12;%时间窗的长度
nit=10;%不知道具体什么含义，至少要被10 整除？具体定义参见PLV.m中
% for  mu=0.04:0.04:0.48

file=num2str(mu);
save1=[save,'_',file,'_modify_4'];
for k=1:4
    if k==1 boduan='alpha';
    elseif k==2 boduan='beta1';
    elseif k==3 boduan='beta2';
  %  elseif k==4 boduan='delta';
    else  boduan='theta';
    end;
  for p=2:2
        if p==1
            taskname='0-20';
        elseif p==2
            taskname='21-40';
        else taskname='41-60';
        end;   
        readpath=[path '\' boduan '\' taskname '\format_row'];
        savepath=[save1 '\' boduan '\' taskname '\PLV'];
        mkdir(savepath);
        
        num_s=1;
        num_e=152;
%          num_e=15;
        fix='1';
       PLV_one_fix(readpath,savepath,channel_num,num_s,num_e,fix,mu,nit);
        
        num_s=153;
        num_e=255;
%         num_e=162;
        fix='2';
        PLV_one_fix(readpath,savepath,channel_num,num_s,num_e,fix,mu,nit);
        
        
        num_s=256;
         num_e=335;
%         num_e=263;
        fix='3';
        PLV_one_fix(readpath,savepath,channel_num,num_s,num_e,fix,mu,nit);
        
        
         num_s=336;
          num_e=405;
%           num_e=342;
         fix='4';
         PLV_one_fix(readpath,savepath,channel_num,num_s,num_e,fix,mu,nit);
   
  end
end
  
% end    %时间窗循环
