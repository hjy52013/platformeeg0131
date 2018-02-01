%�ú�������������������ڵ�Ķȡ�ģ���ڶȡ��Լ������ڵ�������ģ��֮�������������
% ��ڲ���dataPath���ܰ�����ֵ������ļ��У�NodeOfMod����90���ڵ�������ģ����ļ�
% CGorMDNum��ʾ���Ե�����

% һ��һ�����һ��  ���������ֵ����    ��Ӧ     һ���ڵ�����ģ���ļ�
function BatNodeDegreeCompute(dataPathFile,NodeOfMod)

readlist  = dir(dataPathFile);
[m n] = size(readlist);
NodeOfModule1 = load(NodeOfMod);
NodeOfModule = NodeOfModule1.NodeOfModule;

 %--����һ���ļ���---
tempPath=strcat(dataPathFile,'\','nodeOfDegree');
mkdir(tempPath);
%  -----end------


for t = 1:m       %Ѱ�������ļ���������.mat�ļ�
    subFolderName=readlist(t,1).name;
    if strfind(subFolderName,'mat')
        imgPath=strcat(dataPathFile,'\',subFolderName);
%         display(imgPath);

        %-----------------------------------------------------------------------
        %�ҵ�.mat�ļ���load������
        BinaryMartrix1 = load(imgPath);   %BinaryMartrix ��Ŷ�ֵ�ڽӾ���
        BinaryMartrix = BinaryMartrix1.Z;

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
            nodeDegree(i,3) = NodeModule;                 %�ѽڵ�i������ģ��Ŵ���nodeDegree�ڶ�ά
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
%         display(imgPath)
        nodeDegreeTemp = load(imgPath);  
        
        nodeDegree=nodeDegreeTemp.nodeDegree;     %���ÿ���ڵ���ܶ�
        nodeIntroDegree=nodeDegreeTemp.nodeIntroDegree; %���ÿ���ڵ��ģ���ڶ�
        moduleNumber = nodeDegreeTemp.ModuleNumber;%���ģ��ĸ���
        PKni = nodeDegreeTemp.PKni;  %���ÿ���ڵ�Ը���ģ��Ĳ������
        [m1,n1] = size(nodeDegree);
        [m3,n3] = size(PKni);
        Zi = [];             %���ÿ���ڵ��--1.�ڵ�ţ�2.����ģ��.3.����ϵ��
        Pi = [];
        NodeModule =  0;    %��ŵ�i���ڵ��Ӧ��ģ���

        for i = 1:m1   %ÿ���ڵ㶼Ҫ��Zֵ��Pֵ
            NodeModule = nodeIntroDegree(i,3);    %�ѽڵ�i������ģ��Ÿ�ֵ��NodeModule
            Zi(i,1) = i; %�ѽڵ�Ŵ���Zi��һ��
            Zi(i,2) = NodeModule; %�ѽڵ�������ģ��Ŵ���Zi�ڶ���
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
