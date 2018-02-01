function sim = HPI( net )
%% 功能：计算HPI指标并返回相似度矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    sim = net * net;       
    % 完成分子的计算，分子同共同邻居算法
    deg_row = repmat(sum(net,1), [size(net,1),1]);
    deg_row = deg_row .* spones(sim);
    deg_row = min(deg_row, deg_row'); 
    % 完成分母的计算，其中元素(i,j)表示取了节点i和节点j的度的最小值
    sim = sim ./ deg_row; clear deg_row;      
    % 完成相似度矩阵的计算
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim=full(sim);
    
end
