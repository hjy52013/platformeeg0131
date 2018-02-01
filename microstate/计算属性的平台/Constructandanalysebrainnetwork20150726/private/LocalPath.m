function sim  = LocalPath( net, lambda )
%% 功能：计算LP指标并返回相似度矩阵
%%数据： net 90*90的0、1矩阵
	%lambda 取0.0001
%作者：王希
%日期：2014.06.11
    sim = net*net;    
    % 二阶路径
    sim = sim + lambda * (net*net*net);   
    % 二阶路径 + 参数×三节路径
     sim=full(sim);
    
 
end
