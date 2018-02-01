function E=effciency_node(FolderPath,OutPath,prefix,filename1,first,last,step,number)
num=str2num(number);

b=load(file)
%A=importdata(file)
D=all_shortest_paths(b.Bmatrix);
for i=1:num
sum=0; 
aver=0;
for j=1:num
    if i~=j
    sum=sum+1/D(i,j);
    end
end
aver=sum/(num-1);
B(i,1)=aver;
end
%file=strcat('E:\aa\EffciencyNodeConn','\',FolderName);
file=strcat(strcat(OutPath,'\',prefix,'effciency_node','\',prefix,'EN',FolderName),'\',fileName);
save(file,'B');
E = B;
end
end
end


  