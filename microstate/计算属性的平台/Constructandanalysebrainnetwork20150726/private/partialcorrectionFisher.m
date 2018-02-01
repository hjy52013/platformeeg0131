function part=partialcorrectionFisher(dataPath,newname,c,prefix,str1)
%partialcorrectionFisher('E:\Conn',0.015)
% c='pp'表示构建偏相关person
% c='ps'表示构建偏相关sparman
readlist=dir(dataPath);
%le=length(prefix)+10;
[m n]=size(readlist);
num=str2num(str1);
% load('C:\Users\Administrator\Desktop\meantimes1.mat');
if c == 'pp'
mkdir(strcat(newname,'\partialperson\','P'));
mkdir(strcat(newname,'\partialperson\','R'));
end
if c == 'ps'
mkdir(strcat(newname,'\partialsparman\','P'));
mkdir(strcat(newname,'\partialsparman\','R'));
end
h = waitbar(0,'Please wait...');
for t=1:m
    subFolderName=readlist(t,1).name
    if strfind(subFolderName,'mat')
      imgPath=strcat(dataPath,'\',subFolderName);
        le=strfind(subFolderName,'.')
     %subFolderName1 = subFolderName(4:le);
      subFolderName1 = subFolderName(1:(le-1));
      imgPath1=strcat(newname,'\partialperson\p\',subFolderName1);
      imgPath2=strcat(newname,'\partialperson\R\',subFolderName1);
      imgPath3=strcat(newname,'\partialsparman\P\',subFolderName1);
      imgPath4=strcat(newname,'\partialsparman\R\',subFolderName1);
      %作用 将结果单独存放在用户定义的路径下
      display(imgPath);
      %load(imgPath);
      for i=1:num
        for j=1:num
        %N=AllTimes;
       % N=result;
       N=importdata(imgPath);
        M=N;
        X=M(:,i);
        Y=M(:,j);
        if  i==j
            M(:,i)=[];
        elseif i>j
            M(:,i)=[];
            M(:,j)=[];
        else
            M(:,j)=[];
            M(:,i)=[];
        end
        Z=M;
        if c == 'ps'
           [r,p]=partialcorr(X,Y,Z,'type','Spearman');
           P(i,j)=p;
           R(i,j)=r;
           cd(dataPath);
           fileName1=strcat(imgPath3,'_P','.mat')
           fileName4=strcat(imgPath4,'_R','.mat')
           save(fileName1,'P')
           save(fileName4,'R');
        else if c=='pp'
           [r,p]=partialcorr(X,Y,Z);
           P(i,j)=p;
           R(i,j)=r;
           cd(dataPath);
           fileName1=strcat(imgPath1,'_P','.mat')
           fileName4=strcat(imgPath2,'_R','.mat')
           save(fileName1,'P')
           save(fileName4,'R');
            end
        end
        %r=spearman(X);
        %p=0;
        
        %P(i,j)=p;
        %a=[log(1+p)-log(1-p)]/2;
        %FisherP(i,j)=a;
%         if (F(i,j)<c&&(i<j))
%             H(i,j)=1;
%         else 
%             H(i,j)=0;
%         end
       % R(i,j)=r;
        %b=[log(1+r)-log(1-r)]/2;
       % FisherR(i,j)=b;
        end
    
      end
      %cd(dataPath);
       %fileName3=strcat(imgPath,'FisherR_','.mat')
%       fileName=strcat(imgPath,subFolderName,'.net'); 
      % fileName1=strcat(imgPath1,'_P','.mat')
      % fileName4=strcat(imgPath2,'_R','.mat')
      % fileName5=strcat(imgPath,'FisherP_','.mat')
%       fileName2=strcat(imgPath,subFolderName,'01','.mat')
%       save(fileName2,'H');
       %save(fileName1,'P')
       part = newname;
     %  save(fileName3,'FisherR');
       %save(fileName5,'FisherP');
       %save(fileName4,'R');
%       fid = fopen(fileName,'wt');
%       fprintf(fid,'%c','*Vertices      90');
%       fprintf(fid,'%c\n',' ');
%       load('E:\thesis\new1009\doug\regionName.mat');
%       %load('C:\Users\Administrator\Desktop\123.mat');
%       for k=1:90;   
%     p=num2str(H(k,i));
%         fprintf(fid,'      %d ',k);
%         fprintf(fid,'"%s"',b{k,1});
%         fprintf(fid,'%c\n',' ');
%       end
%      fprintf(fid,'%c','*Edges');
%      fprintf(fid,'%c\n',' ');
% %       for k=1:90;
% %         for i=1:90;
% % %       p=num2str(H(k,i));
% %           if(H(k,i)~=0)
% %         %      if k==90
% %          %         k='Thalamus_R';
% %           %    end
% %           fprintf(fid,'      %d      %d',k,i);
% %           fprintf(fid,'%c\n',' ');
% %           end
% %        end
% %       end
%       fclose(fid);

%       fileName=strcat(imgPath,subFolderName);
%       save(subFolderName,'H');
    end
    if c == 'ps'
    waitbar(t/m,h,'Please wait...',h);
   %waitbar(t/m,h,strcat('partialspearman Complete ',num2str(t),'/ ',num2str(m)),h);
    else if c=='pp'
     waitbar(t/m,h,'Please wait...',h);        
    %waitbar(t/m,h,strcat('partialperson Complete ',num2str(t),'/ ',num2str(m)),h);
         end
    end
end
close(h);
