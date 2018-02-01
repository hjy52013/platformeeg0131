%每个被试的最终微状态时间序列
clear;
read_path='E:\实验数据\回龙观10人\丽婷姐';%原始数据读入，因为要计算微状态
save_path='E:\实验数据\微状态网络\微状态时间段\微状态序列';%微状态时间序列的保存路径
tal=importdata('E:\实验数据\微状态网络\tal.mat');%最终的微状态读取
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
        for m=1:2%这里只用了alpha 与theta频段数据，实际上还要beta1，beta2与gamma频段下的数据
                        %只需要继续添加elseif语句就行。
            if m==1 bond='alpha';
            elseif m==2 bond='theta';
            end
            read_path3=fullfile(read_path2,bond);
            save_path3=fullfile(save_path2,bond);
            mkdir(save_path3);
            for p=1:10
                read_path4=fullfile(read_path3,num2str(p));
                data=importdata(read_path4);
                [gfp,maxgfp,number,t,channel]=getGFP(data);%计算原始数据的GFP
                k=4;
                label=finnal(data,maxgfp,k,tal);%将极大GFP标记，属于哪一类微状态
                [count,new_num]=is_stable(label,maxgfp);%判断是否稳定，new_num为一个三列矩阵，第一列为微状态标记
                                                                                       %第二列为该GFP极大值在原始数据中的位置
                                                                                       %第三列为GFP值
                
%                 for n=1:4  %%%该注释段是为了计算每一类微状态的时间序列
%                     save_path4=fullfile(save_path3,num2str(n));
%                     microstate=new_num(find(new_num(:,1)==n),2);
%                     for q=2:length(microstate)
%                         data1(((q-2)*40+1):((q-1)*40))=[(microstate(q)-20):(microstate(q)+19)];
%                     end
%                     data2=data(data1',:);
% %                    data1=data(microstate,:);
%                     save([save_path4 '\' num2str(p)],'data2');
%                     clear microstate;
%                     clear data1;
%                     clear data2;
%                 end
            microstate_label=zeros(channel,1);%行数为通道数，列为时刻点
            for i=1:count-1
                microstate_label(:,i)=data(new_num(i,2),:);
            end
            save([save_path3 '\' num2str(p)],'new_num');   %保存结果，微状态序列。
                                                                                          %若要构建脑网络，计算PLV，则应该保存microstate_label。
            end
        end
    end
end



