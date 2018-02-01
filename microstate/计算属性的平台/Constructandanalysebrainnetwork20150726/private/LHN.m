function sim = LHN( net )
%% 功能：计算LHN1指标并返回相似度矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    sim = net * net;     
    % 完成分子的计算，分子同共同邻居算法
    deg = sum(net,2);
    deg = deg*deg';                                         
    %完成分母的计算
    sim = sim ./ deg;                                      
    %相似度矩阵的计算
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim = full(sim);
    
end
