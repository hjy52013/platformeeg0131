function template=ROITemplate_forAVG(template)
%说明 ROI为脑区模板中所有ROI包含的体素
%ROICount=200;% 需要根据选取的模板修改
% 命令执行格式 template=ROITemplate_forAVG('Fun_200_3mm.nii');


%    读取模板
[Outdata,voxdim, Header] = rest_readfile(template);
ROICount=max(max(max(Outdata)));
template=cell(2,ROICount);
for i=1:ROICount
    temp=zeros(61,73,61);
    temp(find(Outdata==i))=1; 
    template{1,i}=temp;
    template{2,i}=[sum(sum(sum(temp)))];    
end
end
