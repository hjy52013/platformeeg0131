function EDmodelcalpro1(newpath,datapath)
B=importdata(strcat('F:\解剖领域的功能网络\pearson\pearson均值\Control\稀疏度9-32属性\assortativity\assortativity.mat'));
CCMDD=importdata(strcat('F:\解剖领域的功能网络\pearson\pearson均值\Control\稀疏度9-32属性\Cluster cofficient\Cluster_cofficient.mat'));
gallDegrees=importdata(strcat('F:\解剖领域的功能网络\pearson\pearson均值\Control\稀疏度9-32属性\global\Global efficiency.mat'));
lallDegrees=importdata(strcat('F:\解剖领域的功能网络\pearson\pearson均值\Control\稀疏度9-32属性\local\local efficiency.mat'));
SPLMDD=importdata(strcat('F:\解剖领域的功能网络\pearson\pearson均值\Control\稀疏度9-32属性\shortpath\shortpath.mat'));
for i=8:32
    i1=num2str(i);
    newpath1=strcat(newpath,'\modet',i1);
    shortpath=importdata(strcat(newpath1,'\shortpath.mat'));
    glo=importdata(strcat(newpath1,'\Global efficiency.mat'));
    local=importdata(strcat(newpath1,'\local efficiency.mat'));
    as=importdata(strcat(newpath1,'\assortativity.mat'));
    cc=importdata(strcat(newpath1,'\Cluster_cofficient.mat'));
mkdir(strcat(datapath,'\sparsity',i1));
datapath1=strcat(datapath,'\sparsity',i1);
%  calglobal=zeros(71);
%  callocal=zeros(71);
%  calshortpath=zeros(71);
%  calas=zeros(71);
%  calcc=zeros(71);
%for i=1:71
    for j=1:71
        calshortpath(1,j)=1/(shortpath(1,j)+SPLMDD((i-7),1))^2;
        calglobal(1,j)=1/(glo(1,j)+gallDegrees((i-7),1))^2;
        callocal(1,j)=1/(local(1,j)+lallDegrees((i-7),1))^2;
        calas(1,j)=1/(as(1,j)+B((i-7),1))^2;
        calcc(1,j)=1/(cc(1,j)+CCMDD((i-7),1))^2;
    end
%end
save(strcat(datapath1,'\calas.mat'),'calas'); 
save(strcat(datapath1,'\calshortpath.mat'),'calshortpath'); 
save(strcat(datapath1,'\calglobal.mat'),'calglobal'); 
save(strcat(datapath1,'\callocal.mat'),'callocal'); 
save(strcat(datapath1,'\calcc.mat'),'calcc'); 
end
end