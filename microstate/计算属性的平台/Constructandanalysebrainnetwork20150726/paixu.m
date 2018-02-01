function  paixu(onewpath,odatapath)
%功能介绍：
%对n*n的网络进行排序
for k=8:32
    k1=num2str(k);
    newpath=strcat(onewpath,'\modet',k1);
    datapath=strcat(odatapath,'\modet',k1);
    mkdir(strcat(datapath,'\排序'));
    file=strcat(newpath,'\fene.mat');
  a=importdata(file);
 inum=0;
 jnum=0;
for i=1:71
    for j=1:71
     result1((i-1)*71+j,1)=inum;
     result1((i-1)*71+j,2)=jnum;
     result1((i-1)*71+j,3)=a(i,j);
     jnum=jnum+0.1;
    end
    inum=inum+0.1;
    jnum=0;
end
 orderresult1=sortrows(result1,-3);
save(strcat(datapath,'\排序\calfene.mat'),'orderresult1'); 
end
end
