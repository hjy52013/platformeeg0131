%获取最终的微状态模型

clear;
path='E:\实验数据\微状态网络\微状态';%每个被试微状态的保存路径，也即get_microstate_series.m的保存路径
ii=1;
    
    for j=1:3
        if j==1 stage='encoding';
        elseif j==2 stage='maintenance';
        elseif j==3 stage='retrieval';
        end
        read_path2=fullfile(path,stage);
        for m=1:5
            if m==1 bond='alpha';
            elseif m==2 bond='beta1';
            elseif m==3 bond='beta2';
            elseif m==4 bond='theta';
            elseif m==5 bond='gamma';
            end
            read_path3=fullfile(read_path2,bond);
            for p=1:20
                read_path4=fullfile(read_path3,num2str(p));
                data(((ii-1)*4+1):ii*4,:)=importdata([read_path4 '.mat']);%读取每个被试的初步微状态。
                ii=ii+1;
            end
            
        end
    end
            gfp=[1:(ii-1)*4];
            k=4;
            [newsig,tal,Label,energy]=getmicrostate(gfp',k,data);%tal即为最终微状态，保存在当前路径下，为tal.mat
            save('tal');%保存在当前路径下