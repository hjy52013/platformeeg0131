function  PLV_one_fix( readpath,savepath,channel_num,num_s,num_e,fix,mu,nit)
%PLV_ONE Summary of this function goes here
%给定固定前缀的一批被试，求解PLV矩阵
%   Detailed explanation goes here
num=num_e-num_s+1;

  file=[fix,'_']; 

for i=1:num
    if i<10
    filename=[file,'00',num2str(i)];

    elseif i<100
        filename=[file,'0',num2str(i)];
      else
        filename=[file,num2str(i)];
     
     end

 load([readpath,'\',filename],'X');
  %eval(['B=X',file]);    
   B=X;    
   P= PLV_one(channel_num,B,mu,nit);
%     disp('得到的PLV');
%     disp(P);
  save([savepath '\PLV_' fix '_' num2str(i)],'P');
  
  
end   %for 

end   %function
