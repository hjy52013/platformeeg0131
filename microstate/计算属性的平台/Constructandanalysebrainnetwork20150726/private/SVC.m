function SVC (inputdatapath,outputdatapath,num,S,filename,M,L,W)
%����M��SVM���࣬�������ȷ�ʵľ�ֵ

%��ڲ���:
%inputdatapath�Ǵ����ڲ�����·��
% num��ʾr��n��ȡֵ����
%outputdatapath��ʾ�����ŵ�·��
%S��ʾ����SVM�Ĵ���
%filename��ʾSVM�����ڲ���������ļ����ļ��������������֣�
%M��ʾʵ����ı��Ը���
%L��ʾ������ı��Ը���
%W��ʾ�����������ѡ���Ĳ��Լ��ĸ���

%���ߣ�ţ������ţ����
%���ڣ�2014.06.03

%�������Ĵ�ž���
Att_Precision=zeros(num,num);

%����M��SVM����
for times=1:S
    for k=1:num
        k1=num2str(k);
        for p=1:num
            p1=num2str(p);
            filename1=strcat(filename,k1,'-',p1,'.mat');
            indataPath=strcat(inputdatapath,'\',filename1);
            attb=importdata(indataPath);
            
            %SVM
       data = [attb(:,1), attb(:,2),attb(:,3), attb(:,4),attb(:,5)];
       [m,n] =size(data);
        groups=ismember(attb(:,6),1);
        [train, test] = crossvalind('LeaveMOut', (M+L),W);
        cp = classperf(groups);
        svmStruct = svmtrain(data(train,:),groups(train));
        classes = svmclassify(svmStruct,data(test,:));
        classperf(cp,classes,test);
        precision= cp.CorrectRate;
        Att_Precision(k,p)= Att_Precision(k,p)+precision;
        end
    end
end
%��SVM��ȷ�ʵľ�ֵ
 for k=1:num
     for p=1:num
         Att_Precision(k,p)= Att_Precision(k,p)/S;
     end
 end
 save(strcat(outputdatapath,'\mean_Att_Precision.mat'),'Att_Precision');
end