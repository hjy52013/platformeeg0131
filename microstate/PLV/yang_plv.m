clear;
read_folder_path='E:\ʵ������\΢״̬����\΢״̬ʱ���\΢״̬��ʱ������';
reserve_folder_path='E:\ʵ������\΢״̬����\΢״̬ʱ���\PLV';
folder_class_read=dir(read_folder_path);
for n=3:length(folder_class_read)%classΪ�����������
    folder_class_name{n-2}=folder_class_read(n).name;
    folder_task_path=fullfile(read_folder_path,folder_class_name{n-2});
    reserve_class_path=fullfile(reserve_folder_path,folder_class_name{n-2});
    mkdir(reserve_class_path);
    folder_task_read=dir(folder_task_path);
    for m=3:length(folder_task_read)%taskΪ�׶Σ���encoding,maintenance��
        folder_task_name{m-2}=folder_task_read(m).name;
        folder_bond_path=fullfile(folder_task_path,folder_task_name{m-2});
        reserve_task_path=fullfile(reserve_class_path,folder_task_name{m-2});
        mkdir(reserve_task_path);
        folder_bond_read=dir(folder_bond_path);
        for l=3:length(folder_bond_read)%bondΪƵ��
            folder_bond_name{l-2}= folder_bond_read(l).name;
            folder_person_path=fullfile(folder_bond_path,folder_bond_name{l-2});
            reserve_bond_path=fullfile(reserve_task_path,folder_bond_name{l-2});
            mkdir(reserve_bond_path);
            folder_person_read=dir(folder_person_path);
%       ��һ���Ǽ���ÿһ��΢״̬����������Ҫ��      
%                 for k=3:length(folder_state_read)
%                 folder_state_name{k-2}=folder_state_read(k).name;
%                 folder_person_path=fullfile(folder_state_path,folder_state_name{k-2});
%                 
%                 folder_person_read=dir(folder_person_path)
                for l=3:length(folder_person_read)
                    folder_file_name{l-2}=folder_person_read(l).name;
                    folder_file_path=fullfile(folder_person_path,folder_file_name{l-2});
                    data=importdata(folder_file_path);
                    mu=0.12;%ʱ�䴰�ĳ���
                    nit=10;%��֪������ʲô���壬����Ҫ��10 ���������嶨��μ�PLV.m��
                    % for  mu=0.04:0.04:0.48
                    [time,channel]=size(data);
                    P=PLV_one(channel, data,mu,nit);%�ؼ�����������PLV����
                    save([reserve_bond_path '\PLV' num2str(k-2) '_' num2str(l-2) '.mat'], 'P');
                end
%            end
            
            
        end
    end
end

