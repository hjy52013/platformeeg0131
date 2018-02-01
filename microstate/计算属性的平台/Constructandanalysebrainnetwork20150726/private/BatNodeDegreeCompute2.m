%�ú�������������������ڵ�Ķȡ�ģ���ڶȡ��Լ������ڵ�������ģ��֮�������������
% ��ڲ�����1.dataPath���ܰ�����ֵ������ļ��У�
%     2.FileNodeOfMod����90���ڵ�������ģ����ļ��У�
%     3.CGorMDָ�����������黹�������飨Ϊ�˸��������ļ���һ��ǰ׺������
%     4.CGorMDNumָ�����������������ı��Ը�����
% ��ڲ���1���ļ������'BinaryMartrix(ǰ׺��)'  +  '1,2...�����Ա�ţ�' + '-' +  'ϡ��ȣ��������ߣ�'
% ���类�Ա��Ϊ5��ϡ���Ϊ340�ߣ����ļ�����Ϊ��BinaryMartrix5-340
function BatNodeDegreeCompute2(dataPathFile,FileNodeOfMod)

readlist  = dir(dataPathFile);
readlistNM  = dir(FileNodeOfMod);
[m n] = size(readlist);  %����readlist���������������
[mm nn] = size(readlistNM);

%--����һ���ļ���---
tempPath=strcat(dataPathFile,'\','nodeOfDegree');
mkdir(tempPath);
%    \ -----end------


for t = 1:m
    subFolderName=readlist(t,1).name;
    if strfind(subFolderName,'mat')
        imgPath=strcat(dataPathFile,'\',subFolderName);
        display(imgPath);
        BinaryMartrix1 = load(imgPath);   %BinaryMartrix ��Ŷ�ֵ�ڽӾ���
        BinaryMartrix = BinaryMartrix1.Z;

        [token, remain] = strtok(subFolderName,'-');
        
        %------------------------------------------------------------------
        for tt = 1:mm
            subFolderNameNM=readlistNM(tt,1).name;
            if strfind(subFolderNameNM,'mat')

                [token2, remain2] = strtok(subFolderNameNM,'-');
                if strcmp(remain,remain2)
                    
                imgPathNM=strcat(FileNodeOfMod,'\',subFolderNameNM); 
    %-----------------------------------------------------------------------
        
        NodeOfModule1 = load(imgPathNM);
        NodeOfModule = NodeOfModule1.NodeOfModule;
        %ע�⣺NodeOfModule  �ǽڵ��Ŵ�С���������ĵľ���
        [m1,n1] = size(BinaryMartrix);
        [m2,n2] = size(NodeOfModule);
        %��һά��Ŷȣ��ڶ�ά��Žڵ��Ӧ��ģ���
        nodeIntroDegree=zeros(m1,3);        %���ÿ���ڵ��ģ���ڶ�
        nodeDegree=zeros(m1,3);             %���ÿ���ڵ���ܶ�

        %----��NodeOfMod�Խڵ��Ŵ�С��������-------%
        NodeOfModule=sortrows(NodeOfModule,1);


        %����һ�����ֳ����м���ģ��
        flag = 0;
        ModuleType = [];
        for i = 1:m2
            if i==1
                ModuleType(1) = NodeOfModule(1,2);
            else
                for j = 1:length(ModuleType)
                    if NodeOfModule(i,2) == ModuleType(j)
                        flag =1;
                    end
                end
                if flag ==0
                    ModuleType(length(ModuleType)+1) = NodeOfModule(i,2);
                end
            end
            flag = 0;
        end
        ModuleNumber = length(ModuleType);

        PKni = zeros(m2,ModuleNumber);
        nodeModulePk = 0;
        %����ÿ���ڵ��ģ���ڶ�nodeIntroDegree �� �ܶ�nodeDegree
        for i=1:m1
            nodeDegree(i,1) = i;
            nodeIntroDegree(i,1) = i;
            NodeModule = NodeOfModule(i,2);               %��NodeOfModule���ҳ��ڵ�i�����ĸ�ģ��
            nodeDegree(i,3) = NodeModule;                  %�ѽڵ�i������ģ��Ŵ���nodeDegree�ڶ�ά
            nodeIntroDegree(i,3) = NodeModule;             %�ѽڵ�i������ģ��Ŵ���nodeIntroDegree�ڶ�ά
            for j=1:n1
                if i~=j
                    if BinaryMartrix(i,j)~=0                          %������0��֤���ڵ�i�ͽڵ�j֮����ڱ�
                        nodeDegree(i,2) = nodeDegree(i,2)+1;          %����ڵ�i���ܶȴ�������nodeDegree��

                        nodeModulePk = NodeOfModule(j,2);
                        PKni(i,nodeModulePk) =  PKni(i,nodeModulePk) + 1;  %����ڵ�i�����ģ��֮������ӵ��ܱ�����
                        if NodeOfModule(j,2) == NodeModule            %�����i�е�ĳ���ڵ����i���ڵ�����ͬһģ�顣����
                            nodeIntroDegree(i,2) = nodeIntroDegree(i,2)+1;  %�����i���ڵ��ģ���ڶ�
                        end
                    end
                end
            end
        end

        fileName=strcat('nodeOfDegree-',subFolderName);
        savePath = strcat(tempPath,'\',fileName);
        save(savePath,'nodeIntroDegree','nodeDegree','ModuleNumber','PKni');

                  
                    break;
                end
            end
        end

        %//////----------------------------/////----------------------------------

    end
end




% ������õ��Ľ����������ļ���

readlist  = dir(tempPath);
[m n] = size(readlist);


 %--����һ���ļ���---
participationPath=strcat(dataPathFile,'\','participation');
mkdir(participationPath);
%  -----end------


for t = 1:m       %Ѱ�������ļ���������.mat�ļ�
    subFolderName=readlist(t,1).name;
    if strfind(subFolderName,'mat')
        imgPath=strcat(tempPath,'\',subFolderName);
        display(imgPath);
        nodeDegreeTemp = load(imgPath);  
        
        nodeDegree=nodeDegreeTemp.nodeDegree;     %���ÿ���ڵ���ܶ�
        nodeIntroDegree=nodeDegreeTemp.nodeIntroDegree; %���ÿ���ڵ��ģ���ڶ�
        moduleNumber = nodeDegreeTemp.ModuleNumber;%���ģ��ĸ���
        PKni = nodeDegreeTemp.PKni;  %���ÿ���ڵ�Ը���ģ��Ĳ������
        [m1,n1] = size(nodeDegree);
        [m3,n3] = size(PKni);
        Zi = [];          %���ÿ���ڵ��--1.�ڵ�ţ�2.����ģ��.3.����ϵ��
        Pi = [];
        NodeModule =  0;   %��ŵ�i���ڵ��Ӧ��ģ���

        for i = 1:m1   %ÿ���ڵ㶼Ҫ��Zֵ��Pֵ
            NodeModule = nodeIntroDegree(i,3) ;   %�ѽڵ�i������ģ��Ÿ�ֵ��NodeModule
            Zi(i,1) = i; %�ѽڵ�Ŵ���Zi��һ��
            Zi(i,2) = NodeModule ;%�ѽڵ�������ģ��Ŵ���Zi�ڶ���
            %-------------------------����Pi-����ϵ��--------------------------------%
            KniTemp = 0;
            for k =1:n3
                KniTemp = KniTemp + (PKni(i,k)/nodeDegree(i,2))^2;
            end
            Pi(i) = 1-KniTemp;
            Zi(i,3) =Pi(i);
            %-----end---Pi----------------------------------------------------
        end

        fileName=strcat('P-',subFolderName);
        savePath = strcat(participationPath,'\',fileName);
        save(savePath,'Zi');     
    end
end

end
