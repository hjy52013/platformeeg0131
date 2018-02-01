function sim = SimRank( net,lambda)
%% 功能：计算SimRank指标并返回相似度矩阵
%%数据： net 90*90的0、1矩阵
	%lambda 取0.8
%作者：王希
%日期：2014.06.11
    deg = sum(net,1);     
    % 求节点的入度，构成行向量，供调用
    lastsim = sparse(size(net,1), size(net,2)); 
    % 存储前一步的迭代结果，初始化为全0矩阵
    sim = sparse(eye(size(net,1))); 
    % 存储当前步的迭代结果，初始化为单位矩阵
    while(sum(sum(abs(sim-lastsim)))>0.0000001)    
    % 迭代至稳态的判定条件
        lastsim = sim;  sim = sparse(size(net,1), size(net,2));                                           
        for nodex = 1:size(net,1)-1      
        %对每一对节点的值进行更新
            if deg(nodex) == 0
                continue;
            end
            for nodey = nodex+1:size(net,1)                    
            %-----将点x的邻居和点y的邻居所组成的所有节点对的前一步迭代结果相加
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
