%统计微状态序列出现的次数，找出最频繁出现的序列
%count(1)为123序列 count(2)为124序列 count(3)为132序列 count(4)为134序列 .。。。
clear;
read_path='E:\实验数据\微状态网络\微状态时间段\微状态序列';
save_path='E:\实验数据\微状态网络\微状态时间段\微状态频繁序列';
for i=1:2
    if i==1 class='normal';
    else class='patient';
    end
    read_path1=fullfile(read_path,class);
    save_path1=fullfile(save_path,class);
    mkdir(save_path1);
    for j=1:3
        if j==1 stage='encoding';
        elseif j==2 stage='maintenance';
        elseif j==3 stage='retrieval';
        end
        read_path2=fullfile(read_path1,stage);
        save_path2=fullfile(save_path1,stage);
        mkdir(save_path2);
        for m=1:2
            if m==1 bond='alpha';
            elseif m==2 bond='theta';
            end
            read_path3=fullfile(read_path2,bond);
            save_path3=fullfile(save_path2,bond);
            count=zeros(10,24);
            for p=1:10
                read_path4=fullfile(read_path3,num2str(p));
                data=importdata([read_path4 '.mat']);   
                data1=data(:,1);
                for q=1:size(data,1)-3
                    if data(q)==1&&data(q+1)==2&&data(q+2)==3
                        count(p,1)=count(p,1)+1;
                    elseif data(q)==1&&data(q+1)==2&&data(q+2)==4
                        count(p,2)=count(p,2)+1;
                    elseif data(q)==1&&data(q+1)==3&&data(q+2)==2
                        count(p,3)=count(p,3)+1;
                    elseif data(q)==1&&data(q+1)==3&&data(q+2)==4
                        count(p,4)=count(p,4)+1;
                    elseif data(q)==1&&data(q+1)==4&&data(q+2)==2
                        count(p,5)=count(p,5)+1;
                    elseif data(q)==1&&data(q+1)==4&&data(q+2)==3
                        count(p,6)=count(p,6)+1;
                    elseif data(q)==2&&data(q+1)==1&&data(q+2)==3
                        count(p,7)=count(p,7)+1;
                    elseif data(q)==2&&data(q+1)==1&&data(q+2)==4
                        count(p,8)=count(p,8)+1;
                    elseif data(q)==2&&data(q+1)==3&&data(q+2)==1
                        count(p,9)=count(p,9)+1;
                    elseif data(q)==2&&data(q+1)==3&&data(q+2)==4
                        count(p,10)=count(p,10)+1;
                    elseif data(q)==2&&data(q+1)==4&&data(q+2)==1
                        count(p,11)=count(p,11)+1;
                    elseif data(q)==2&&data(q+1)==4&&data(q+2)==3
                        count(p,12)=count(p,12)+1;
                    elseif data(q)==3&&data(q+1)==1&&data(q+2)==2
                        count(p,13)=count(p,13)+1;
                    elseif data(q)==3&&data(q+1)==1&&data(q+2)==4
                        count(p,14)=count(p,14)+1;
                    elseif data(q)==3&&data(q+1)==2&&data(q+2)==1
                        count(p,15)=count(p,15)+1;
                    elseif data(q)==3&&data(q+1)==2&&data(q+2)==4
                        count(p,16)=count(p,16)+1;
                    elseif data(q)==3&&data(q+1)==4&&data(q+2)==1
                        count(p,17)=count(p,17)+1;
                    elseif data(q)==3&&data(q+1)==4&&data(q+2)==2
                        count(p,18)=count(p,18)+1;
                    elseif data(q)==4&&data(q+1)==1&&data(q+2)==2
                        count(p,19)=count(p,19)+1;
                    elseif data(q)==4&&data(q+1)==1&&data(q+2)==3
                        count(p,20)=count(p,20)+1;
                    elseif data(q)==4&&data(q+1)==2&&data(q+2)==1
                        count(p,21)=count(p,21)+1;
                    elseif data(q)==4&&data(q+1)==2&&data(q+2)==3
                        count(p,22)=count(p,22)+1;
                    elseif data(q)==4&&data(q+1)==3&&data(q+2)==1
                        count(p,23)=count(p,23)+1;
                    elseif data(q)==4&&data(q+1)==3&&data(q+2)==2
                        count(p,24)=count(p,24)+1;
                    end
                    
                end
                   
            end
            save([save_path3],'count');
        end
    end
end



