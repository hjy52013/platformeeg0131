function result=ReadTimeCourse(path,template,outputPath)
% ˵����pathΪ��Ҫ������ʱ���������ڵ�·�����ϼ�����·����ÿ�����Ե��ļ����а�����Ҫ������ʱ������
% templateΪROIģ����������ļ�
% outputPathΪ����ļ��У�������Զ��ڸ�·���´���ÿ�����Ե�ʱ������mat�ļ� ÿ��mat�ļ��ĸ�ʽ��Ϊ200��ROI�ĸ�����*532��ʱ�����е������ľ���
% ����ִ�и�ʽ result=ReadTimeCourse('D:\analysis\FunImgNormalizedSmoothed',template,'D:\analysis\matTEST');
h = waitbar(0,'Please wait...');
%mkdir(outputPath);

%��ʱ�ĳ�90
%ROI_count=size(template,2);%ROI�ĸ���
ROI_count=90;%ROI�ĸ���

list=dir(path);
count_PS=size(list,1)-2;%���Եĸ���

ps_path =list(1+2).name;
readlist=dir(strcat(path ,'\' ,ps_path ,'\*.img'));
%cd ([path '\' ps_path '\']);
%ps_dir=dir( '*.img');
%timepoint =size(ps_dir,1);%ʱ�����е�ĸ���
[m n]=size(readlist);;%ʱ�����е�ĸ���
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