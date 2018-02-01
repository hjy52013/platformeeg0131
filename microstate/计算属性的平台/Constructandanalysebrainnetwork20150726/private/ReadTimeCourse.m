function result=ReadTimeCourse(path,template,outputPath)
% 说明：path为需要分析的时间序列所在的路径的上级，该路径下每个被试的文件夹中包含需要分析的时间序列
% template为ROI模板包含体素文件
% outputPath为输出文件夹，程序会自动在该路径下创建每个被试的时间序列mat文件 每个mat文件的格式均为200（ROI的个数）*532（时间序列点数）的矩阵
% 命令执行格式 result=ReadTimeCourse('D:\analysis\FunImgNormalizedSmoothed',template,'D:\analysis\matTEST');
h = waitbar(0,'Please wait...');
%mkdir(outputPath);

%暂时改成90
%ROI_count=size(template,2);%ROI的个数
ROI_count=90;%ROI的个数

list=dir(path);
count_PS=size(list,1)-2;%被试的个数

ps_path =list(1+2).name;
readlist=dir(strcat(path ,'\' ,ps_path ,'\*.img'));
%cd ([path '\' ps_path '\']);
%ps_dir=dir( '*.img');
%timepoint =size(ps_dir,1);%时间序列点的个数
[m n]=size(readlist);;%时间序列点的个数
result= zeros(ROI_count,m);

for i=1:count_PS
    ps_path =list(i+2).name;
   % cd ([path '\' ps_path '\']);
    %ps_dir=dir( '*.img');
  readlist=dir(strcat(path ,'\' ,ps_path ,'\*.img'));
    for j=1:m
        matName=readlist(j,1).name;
        fileName=strcat(path,'\',ps_path,'\',matName);
        %[Outdata,voxdim, Header] = rest_readfile((ps_dir(j).name));
        [Outdata,voxdim, Header] = rest_readfile(fileName);
        roi_timecourse_avg=[];
        for k=1:ROI_count
            roi_template = template{1,k};
            voxel_count = template{2,k};
            roi_timecourse_avg = [roi_timecourse_avg sum(sum(sum(Outdata .* roi_template)))/voxel_count];
        end
        result(:,j)=roi_timecourse_avg';
    end
    
    matFile=[list(i+2).name '.mat'];
   % cd (outputPath);
    result1=result';
    save(strcat(outputPath,'\',matFile),'result1');
 waitbar(i/count_PS,h,'Please wait...',h);
end
close(h);
end