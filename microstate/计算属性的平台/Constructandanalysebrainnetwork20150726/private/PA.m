function sim = PA( net )
%% 功能：计算PA指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    deg_row = sum(net,2);       
    % 所有节点的度构成列向量，将它乘以它的转置即可
    sim = deg_row * deg_row';  
    clear deg_row deg_col;       
    % 相似度矩阵计算完成
    sim=full(sim);
    
end
