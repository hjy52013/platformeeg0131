%�����õ�΢״̬��ʱ������

clear;
read_path='E:\ʵ������\������10��\���ý�';%��ȡ·��
save_path='E:\ʵ������\΢״̬����\����ֵ';%����ֵ����·��
tal_path='E:\ʵ������\΢״̬����\TEXT';%΢״̬����·��
for i=1:2
    if i==1 class='normal';
    else class='patient';
    end
    read_path1=fullfile(read_path,class);
    save_path1=fullfile(save_path,class);
    
    for j=1:3
        if j==1 stage='encoding';
        elseif j==2 stage='maintenance';
        elseif j==3 stage='retrieval';
        end
        read_path2=fullfile(read_path1,stage);
        save_path2=fullfile(save_path1,stage);
        tal_path2=fullfile(tal_path,stage);
        for m=1:2
            if m==1 bond='alpha';
            elseif m==2 bond='theta';
            end
            read_path3=fullfile(read_path2,bond);
            save_path3=fullfile(save_path2,bond);
            tal_path3=fullfile(tal_path2,bond);
            for p=1:10
                read_path4=fullfile(read_path3,num2str(p));
                data=importdata(read_path4);%��ȡ����
                [gfp,maxgfp,number,t,channel]=getGFP(data);%��GFP���伫��ֵ��tΪ����������channelΪͨ����
                k=4;
                %label=zeros(channel/2,number);
                [newsig(1,1),tal,label,energy]=getmicrostate(maxgfp,k,data);%��ȡ΢״̬��tal������ʾ΢״̬
%               max_data=data(maxgfp(:,1),:);  %����ֵ��ʱ���
%                save([save_path3 '\' num2str(p) '.mat'],'max_data')
                save([tal_path3 '\' num2str((i-1)*10+p)],'tal');

            end
        end
    end
end

        