function EDmodelcalall(calcc,calas,calgolbal,callocal,calshortpath,datapath)
 calresult=zeros(71);
for i=1:71
    for j=1:71
        cc=calcc(i,j);
        as=calas(i,j);
        golbal=calgolbal(i,j);
        local=callocal(i,j);
        shortpath=calshortpath(i,j);
    calresult(i,j)=cc*as*golbal*local*shortpath;
    end
end
save(strcat(datapath,'\calresult.mat'),'calresult'); 
end