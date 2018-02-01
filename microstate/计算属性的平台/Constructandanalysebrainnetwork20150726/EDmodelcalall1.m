function EDmodelcalall1(newpath,datapath)
 for i=8:32
%for i=1:71
i1=num2str(i);
datapath1=strcat(datapath,'\sparsity',i1);
mkdir(datapath1);
newpath1=strcat(newpath,'\sparsity',i1);
calcc=importdata(strcat(newpath1,'\calcc.mat'));
calas=importdata(strcat(newpath1,'\calas.mat'));
calgolbal=importdata(strcat(newpath1,'\calglobal.mat'));
callocal=importdata(strcat(newpath1,'\callocal.mat'));
calshortpath=importdata(strcat(newpath1,'\calshortpath.mat'));
    for j=1:71
        cc=calcc(1,j);
        as=calas(1,j);
        golbal=calgolbal(1,j);
        local=callocal(1,j);
        shortpath=calshortpath(1,j);
    calresult(1,j)=cc*as*golbal*local*shortpath;
    end
%end
save(strcat(datapath1,'\calresult.mat'),'calresult'); 
 end
end