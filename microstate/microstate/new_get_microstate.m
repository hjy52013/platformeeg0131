%ÿ�����Ե�����΢״̬ʱ������
clear;
read_path='E:\ʵ������\������10��\���ý�';%ԭʼ���ݶ��룬��ΪҪ����΢״̬
save_path='E:\ʵ������\΢״̬����\΢״̬ʱ���\΢״̬����';%΢״̬ʱ�����еı���·��
tal=importdata('E:\ʵ������\΢״̬����\tal.mat');%���յ�΢״̬��ȡ
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
        for m=1:2%����ֻ����alpha ��thetaƵ�����ݣ�ʵ���ϻ�Ҫbeta1��beta2��gammaƵ���µ�����
                        %ֻ��Ҫ�������elseif�����С�
            if m==1 bond='alpha';
            elseif m==2 bond='theta';
            end
            read_path3=fullfile(read_path2,bond);
            save_path3=fullfile(save_path2,bond);
            mkdir(save_path3);
            for p=1:10
                read_path4=fullfile(read_path3,num2str(p));
                data=importdata(read_path4);
                [gfp,maxgfp,number,t,channel]=getGFP(data);%����ԭʼ���ݵ�GFP
                k=4;
                label=finnal(data,maxgfp,k,tal);%������GFP��ǣ�������һ��΢״̬
                [count,new_num]=is_stable(label,maxgfp);%�ж��Ƿ��ȶ���new_numΪһ�����о��󣬵�һ��Ϊ΢״̬���
                                                                                       %�ڶ���Ϊ��GFP����ֵ��ԭʼ�����е�λ��
                                                                                       %������ΪGFPֵ
                
%                 for n=1:4  %%%��ע�Ͷ���Ϊ�˼���ÿһ��΢״̬��ʱ������
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
            microstate_label=zeros(channel,1);%����Ϊͨ��������Ϊʱ�̵�
            for i=1:count-1
                microstate_label(:,i)=data(new_num(i,2),:);
            end
            save([save_path3 '\' num2str(p)],'new_num');   %��������΢״̬���С�
                                                                                          %��Ҫ���������磬����PLV����Ӧ�ñ���microstate_label��
            end
        end
    end
end



