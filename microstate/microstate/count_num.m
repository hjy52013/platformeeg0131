%统计每个微状态出现的次数  最终结果放在count当中
clear;
read_path='E:\实验数据\微状态网络\微状态时间段\微状态序列';
save_path='E:\实验数据\微状态网络\微状态时间段\微状态次数';
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
            count=zeros(10,4);
            for p=1:10
                read_path4=fullfile(read_path3,num2str(p));
                data=importdata([read_path4 '.mat']);   
                count(p,1)=size(find(data(:,1)==1),1);
                count(p,2)=size(find(data(:,1)==2),1);
                count(p,3)=size(find(data(:,1)==3),1);
                count(p,4)=size(find(data(:,1)==4),1);
                   
            end
            save([save_path3],'count');
        end
    end
end



