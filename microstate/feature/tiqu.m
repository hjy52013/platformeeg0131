clear;
path='E:\实验数据\微状态网络\平台\Col_property';
global_path='E:\实验数据\微状态网络\特征\全局';
local_path='E:\实验数据\微状态网络\特征\局部';
for i=1:2
    if i==1 ii='normal';
    elseif i==2 ii='patient';
    end
    path1=fullfile(path,ii);
    global_path1=fullfile(global_path,ii);
    local_path1=fullfile(local_path,ii);
    for j=1:3
        if j==1 jj='encoding';
        elseif j==2 jj='maintenance';
        elseif j==3 jj='retrieval';
        end
        path2=fullfile(path1,jj);
        global_path2=fullfile(global_path1,jj);
        local_path2=fullfile(local_path1,jj);
        for m=1:2
            if m==1 mm='alpha';
            elseif m==2 mm='theta';
            end
            path3=fullfile(path2,mm);
            path4=fullfile(path3,'conproperty');
            global_path3=fullfile(global_path2,mm);
            local_path3=fullfile(local_path2,mm);
            for n=1:4
                folder_name=['BBsortPLV' num2str(n)];
                for p=1:10
                    name=[folder_name '_' num2str(p)];
                    path5=fullfile(path4,name);
                    for q=1:6
                        path6=fullfile(path5,['BBSort' num2str(28+2*q) '.mat']);
                        path7=fullfile(path6,'NetMesBin_f_con.mat');
                        feature=importdata(path7);
                        degree(p,q,n,:)=feature{1,1};
                        assortativity(q,n,p)=feature{5,1};
                        cluster(p,q,n,:)=feature{7,1}';
                        mean_cluster(q,n,p)=feature{8,1};
                        transitivity(q,n,p)=feature{9,1};
                        global_effcient(q,n,p)=feature{10,1};
                        local_effcient(p,q,n,:)=feature{11,1};
                        mean_local(q,n,p)=feature{12,1};
                        node_effcient(p,q,n,:)=feature{13,1};
                        modularity(q,n,p)=feature{14,1};
                        modularity_louvain(q,n,p)=feature{15,1};
                        characteristic_path_length(q,n,p)=feature{16,1};
                    end
                end
            end
            
            for q=1:6
                global_path4=fullfile(global_path3,num2str(28+2*q));
                assortativity1=squeeze(assortativity(q,:,:));
                save([global_path4 '\assortativity.mat'],'assortativity1');
                mean_cluster1=squeeze(mean_cluster(q,:,:));
                save([global_path4 '\mean_cluster.mat'],'mean_cluster1');
                transitivity1=squeeze(transitivity(q,:,:));
                save([global_path4 '\transitivity.mat'],'transitivity1');
                global_effcient1=squeeze(global_effcient(q,:,:));
                save([global_path4 '\global_effcient.mat'],'global_effcient1');
                mean_local_efficient1=squeeze(mean_local(q,:,:));
                save([global_path4 '\mean_local_efficient.mat'],'mean_local_efficient1');
                modularity1=squeeze(modularity(q,:,:));
                save([global_path4 '\modularity.mat'],'modularity1');
                modularity_louvain1=squeeze(modularity_louvain(q,:,:));
                save([global_path4 '\modularity_louvain.mat'],'modularity_louvain1');
                characteristic_path_length1=squeeze(characteristic_path_length(q,:,:));
                save([global_path4 '\characteristic_path_length.mat'],'characteristic_path_length1');
            end
            
            for q=1:6
                local_path4=fullfile(local_path3,num2str(28+2*q));
                for p=1:10
                local_path5=fullfile(local_path4,num2str(p));
                degree1=squeeze(degree(p,q,:,:));
                save([local_path5 '\degree.mat'],'degree1');
                cluster1=squeeze(cluster(p,q,:,:));
                save([local_path5 '\cluster_coef.mat'],'cluster1');
                local_effcient1=squeeze(local_effcient(p,q,:,:));
                save([local_path5 '\local_effcient.mat'],'local_effcient1');
                node_effcient1=squeeze(node_effcient(p,q,:,:));
                save([local_path5 '\node_effcient.mat'],'node_effcient1');
                end
            end
            
        end
    end
end


