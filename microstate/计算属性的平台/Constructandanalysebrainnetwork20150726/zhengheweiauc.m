function  zhengheweiauc(dataPath,zhengchang)
 
 for fi=8:32
    fi1=num2str(fi);
    glo=importdata(strcat(dataPath,'\modet',fi1,'\Global efficiency.mat'));
    loc=importdata(strcat(dataPath,'\modet',fi1,'\local efficiency.mat'));
    as=importdata(strcat(dataPath,'\modet',fi1,'\assortativity.mat'));
    cc=importdata(strcat(dataPath,'\modet',fi1,'\Cluster_cofficient.mat'));
    short=importdata(strcat(dataPath,'\modet',fi1,'\shortpath.mat'));
    zhengchang((fi-7),3)=as(1,2);
    zhengchang((fi-7),7)=cc(1,2);
    zhengchang((fi-7),11)=short(1,2);
    zhengchang((fi-7),15)=glo(1,2);
    zhengchang((fi-7),19)=loc(1,2);
 end
 save(strcat('F:\解剖领域的功能网络\pearson\zhengchang.mat'),'zhengchang'); 
end
