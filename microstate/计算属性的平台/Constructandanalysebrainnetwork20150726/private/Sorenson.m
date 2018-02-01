function sim = Sorenson( net )
%% 功能：计算Sorenson指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    sim = net * net;                                            
    % 计算分子
    sim = triu(sim,1);
    deg_col = repmat(sum(net,2), [1 size(net,1)]);              
    % 计算分母
    deg_col = triu(deg_col' + deg_col);
    sim = 2 * sim ./ deg_col;                             
    % 相似度矩阵计算完成
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;

    sim=full(sim);
    
end
