function EDmodelcalpro(shortpath,glo,local,as,cc,datapath,SPLMDD,gallDegrees,lallDegrees,B,CCMDD)
mkdir(datapath);
 calglobal=zeros(71);
 callocal=zeros(71);
 calshortpath=zeros(71);
 calas=zeros(71);
 calcc=zeros(71);
for i=1:71
    for j=1:71
        calshortpath(i,j)=1/(shortpath(i,j)+SPLMDD(25,1))^2;
        calglobal(i,j)=1/(glo(i,j)+gallDegrees(25,1))^2;
        callocal(i,j)=1/(local(i,j)+lallDegrees(25,1))^2;
        calas(i,j)=1/(as(i,j)+B(25,1))^2;
        calcc(i,j)=1/(cc(i,j)+CCMDD(25,1))^2;
    end
end
save(strcat(datapath,'\calas.mat'),'calas'); 
save(strcat(datapath,'\calshortpath.mat'),'calshortpath'); 
save(strcat(datapath,'\calglobal.mat'),'calglobal'); 
save(strcat(datapath,'\callocal.mat'),'callocal'); 
save(strcat(datapath,'\calcc.mat'),'calcc'); 
end
