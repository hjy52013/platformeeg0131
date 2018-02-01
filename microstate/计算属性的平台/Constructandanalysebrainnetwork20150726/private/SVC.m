function SVC (inputdatapath,outputdatapath,num,S,filename,M,L,W)
%进行M次SVM分类，并求出正确率的均值

%入口参数:
%inputdatapath是存放入口参数的路径
% num表示r或n的取值个数
%outputdatapath表示结果存放的路径
%S表示进行SVM的次数
%filename表示SVM存放入口参数矩阵的文件的文件名（不包含数字）
%M表示实验组的被试个数
%L表示对照组的被试个数
%W表示从样本中随机选出的测试集的个数

%作者：牛会兰、牛力敏
%日期：2014.06.03

%定义结果的存放矩阵
Att_Precision=zeros(num,num);

%进行M次SVM分类
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
%求SVM正确率的均值
 for k=1:num
     for p=1:num
         Att_Precision(k,p)= Att_Precision(k,p)/S;
     end
 end
 save(strcat(outputdatapath,'\mean_Att_Precision.mat'),'Att_Precision');
end