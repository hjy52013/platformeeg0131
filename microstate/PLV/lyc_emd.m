function new_x = lyc_emd(raw_x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
imfs=emd(raw_x);

[m,n]=size(imfs);
for i=1:m
   %corrcoef�����Ǽ����������ݵ����ϵ����corrcoef(x,y)��ʾx���к�y���е����ϵ�����õ�����2*2���󣬶Խ�Ԫ��Ϊ�����ϵ�����ǶԽ�Ԫ��Ϊ�����ϵ�� 
    a=corrcoef(imfs(i,:),raw_x);
    xg(i)=a(1,2);
end
xg;
for i=1:m-1;
    %�����IMF�ķ������
    %���壺����=ƽ���ľ�ֵ-��ֵ��ƽ������D(x)=E(x^2)-[E(x)]^2
    %ƽ���ľ�ֵ imf2p=mean(c(i,:).^2,2)
    %��ֵ��ƽ�� imfp2=mean(c(i,:),2).^2
%��IMF�ķ���
mse(i)=mean(imfs(i,:).^2,2)-mean(imfs(i,:),2).^2;
end
mmse=sum(mse);%mmseΪ���еķ����
for i=1:m-1;
    mse(i)=mean(imfs(i,:).^2,2)-mean(imfs(i,:),2).^2;
    %����ٷֱȣ�Ҳ���Ƿ������
    mseb(i)=mse(i)/mmse*100;
end
flag=[];
for   f=1:m
    if xg(f)>0.8
       flag=[flag; f];
    end   
end
[o,p]=size(flag);
if   o>0
    
    temp_x=[];
        for   g=1:o
            label=flag(g,1);
            temp=imfs(label,:);
              temp_x=[temp_x;temp];
        end
         %���õ�IMF�ź��ع�
         new_x=sum(temp_x);
else
 max_xg=max(xg);   
 flag_xg=0;
for  d=1:m
    if   xg(d)==max_xg
        flag_xg=d;
    end
end
   %     new_x=x;
    new_x=imfs(flag_xg,:);
    disp('��ʱ������EMD�ֽ�û�з���Ҫ��ģ����ѡ�����ģ�');
end

disp(new_x);



end

