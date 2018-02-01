function guiyi(onewpath,odatapath)
for k=9:32
    k1=num2str(k);
    newpath=strcat(onewpath,'\modet',k1,'\参数检验');
    datapath=strcat(odatapath,'\modet',k1,'\参数检验');
mkdir(strcat(datapath,'\归一化'));
 result=zeros(71);
 file=strcat(newpath,'\calresult.mat');
 gy=importdata(file);
 minva=min(gy);
 minvalue=min(minva);
 maxva=max(gy);
 maxvalue=max(maxva);
 for i=1:71
    for j=1:71
        v=gy(i,j);
        result(i,j)=(v-minvalue)/(maxvalue-minvalue);
    end
end
save(strcat(datapath,'\归一化\result.mat'),'result'); 
end
end