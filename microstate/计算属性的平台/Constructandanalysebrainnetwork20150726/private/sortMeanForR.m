% sortMeanForR('d:\Program Files\MATLAB71\work\R-constructBrainNetwork\relevanceProcess\extractStd.mat')
function sortb=sortMeanForR(dataPath,output)
%功能：排序，现已经弃用此函数
    readlist  = dir(dataPath)  
    [m n] = size(readlist)
    for t = 1:m
         subFolderName=readlist(t,1).name;    
         if strfind(subFolderName,'mat')
             imgPath=strcat(dataPath,'\',subFolderName);
    b=load(imgPath);
    display(b)
    arnum=1;
    for rnum=2:90
        cnum=rnum-1;
        for i=1:cnum
            a(arnum,1)=rnum;
            a(arnum,2)=i;
            %display(b.Result(rnum,i));
            a(arnum,3)=b.Result(rnum,i);
            arnum=arnum+1;
        end
end 
         end
         end
    sortb=sortrows(a,-3);
    filename=strcat(output,'\','sortb.mat');
    save(filename,'sortb');
end