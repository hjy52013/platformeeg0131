function  mode3_pz(dataPath,newname)
   golbal=zeros(351);
   j=1;
 for fi=0:2:700
    fi1=num2str(fi);
    file=strcat(dataPath,'\modet',fi1,'\global\Global efficiency.mat');
    F=importdata(file);
    for i=1:351
       golbal(j,i)=F(1,i);
    end
    j=j+1;
 end
 save(strcat(newname,'\modesgolbal.mat'),'golbal'); 
end
