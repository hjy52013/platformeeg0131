function  paixu1(onewpath,odatapath)
%���ܽ��ܣ�
%��n*n�������������
for k=8:32
    k1=num2str(k);
    newpath=strcat(onewpath,'\sparsity',k1);
    datapath=strcat(odatapath,'\sparsity',k1);
    mkdir(strcat(datapath,'\����'));
    file=strcat(newpath,'\calresult.mat');
  a=importdata(file);
 %inum=0;
 jnum=0;
%for i=1:71
    for j=1:71
     %result1(j,1)=inum;
     result1(j,1)=jnum;
     result1(j,2)=a(1,j);
     jnum=jnum+0.1;
    end
    %inum=inum+0.1;
    %jnum=0;
%end
 orderresult1=sortrows(result1,-2);
save(strcat(datapath,'\����\calfene.mat'),'orderresult1'); 
end
end
