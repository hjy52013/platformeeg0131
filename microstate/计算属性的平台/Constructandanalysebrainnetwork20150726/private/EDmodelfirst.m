function EDmodelfirst(nodeed)
for k=0.06:0.02:0.24
    k1=num2str(k*100);
    modefirst=zeros(90);
for i=1:90
    for j=1:90
     w=-k*nodeed(i,j);
     modefirst(i,j)=exp(w);
    end
end
save(strcat('C:\Users\niulimin\Desktop\nodeed\modefirst',k1,'.mat'),'modefirst'); 
end
end