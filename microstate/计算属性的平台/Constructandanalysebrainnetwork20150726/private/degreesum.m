function degreesum( FolderPath,OutPath,number )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
numbe=str2num(number)
FolderNamelist=dir(FolderPath);
[Fm Fn]=size(FolderNamelist);
for FolderNum=1:Fm
    FolderName= FolderNamelist(FolderNum,1).name
    if FolderName ~= '.'
        dataPath=strcat(FolderPath,'\',FolderName)
        %mkdir(strcat(OutPath,'\',FolderName))
        readlist=dir(strcat(dataPath,'\*.mat'));
        [m n]=size(readlist);
        
        for i=1:m
            matName=readlist(i,1).name;
            matPath=strcat(dataPath,'\',matName);
            NetworkProp = importdata(matPath);
            %display(NetworkProp);
            % temp= NetworkProp;
           % temp=zeros(200,3);
           temp=zeros(numbe,3);
            %            fistnum=1;
            for num=1:numbe
                %                 if(NetworkProp(fistnum,1)==num)
                %                    temp(num,:) =NetworkProp(fistnum,:)
                %                    fistnum=fistnum+1;
                %                 else
                %                     temp(num,1) =num;
                %                     temp(num,2) =0;
                %                     temp(num,3) =0;
                %                 end
                [m,n]=find(NetworkProp(:,1)== num);
                if (size(m,1)==0 )
                    temp(num,:)=[num, 0 ,0];
                else
                    temp(num,:)=NetworkProp(m,:);
                end
            end
            NetworkProp=temp;
            for rnum=1:numbe
                display(NetworkProp(rnum,2));
                if(NetworkProp(rnum,1)==rnum)
                    NetworkProp(rnum,4)=NetworkProp(rnum,2)+ NetworkProp(rnum,3);
                else NetworkProp=[NetworkProp(1:rnum-1,:);[0,0,0,0];NetworkProp(rnum:end,:);]
                    %201234 矩阵的第一列是节点数，所以不可以为0
                    %else NetworkProp=[NetworkProp(1:rnum-1,:);[rnum,0,0,0];NetworkProp(rnum:end,:);]
                    display(NetworkProp)
                    %    save(strcat(strcat('E:\p\P_modify\R\R_DegreeSum\R_DegreeSum_MDD','\','Sum',FolderName),'\',matName),'NetworkProp')
                end
            end
            %  save(strcat(OutPath,'\Degree\',FolderName,'\',matName),'NetworkProp')
            save(strcat(OutPath,'\',FolderName,'\',matName),'NetworkProp')
            NetworkProp=[];
        end
        
    end
end
end

