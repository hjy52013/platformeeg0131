function template=ROITemplate_forAVG(template)
%˵�� ROIΪ����ģ��������ROI����������
%ROICount=200;% ��Ҫ����ѡȡ��ģ���޸�
% ����ִ�и�ʽ template=ROITemplate_forAVG('Fun_200_3mm.nii');


%    ��ȡģ��
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
