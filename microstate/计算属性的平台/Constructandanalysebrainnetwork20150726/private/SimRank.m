function sim = SimRank( net,lambda)
%% ���ܣ�����SimRankָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
	%lambda ȡ0.8
%���ߣ���ϣ
%���ڣ�2014.06.11
    deg = sum(net,1);     
    % ��ڵ����ȣ�������������������
    lastsim = sparse(size(net,1), size(net,2)); 
    % �洢ǰһ���ĵ����������ʼ��Ϊȫ0����
    sim = sparse(eye(size(net,1))); 
    % �洢��ǰ���ĵ����������ʼ��Ϊ��λ����
    while(sum(sum(abs(sim-lastsim)))>0.0000001)    
    % ��������̬���ж�����
        lastsim = sim;  sim = sparse(size(net,1), size(net,2));                                           
        for nodex = 1:size(net,1)-1      
        %��ÿһ�Խڵ��ֵ���и���
            if deg(nodex) == 0
                continue;
            end
            for nodey = nodex+1:size(net,1)                    
            %-----����x���ھӺ͵�y���ھ�����ɵ����нڵ�Ե�ǰһ������������
                if deg(nodey) == 0
                    continue;
                end
                sim(nodex,nodey) = lambda * sum(sum(lastsim(net(:,nodex)==1,net(:,nodey)==1))) / (deg(nodex)*deg(nodey));
            end
        end
        sim = sim+sim'+ sparse(eye(size(net,1)));
    end
    sim=full(sim);
    
end
