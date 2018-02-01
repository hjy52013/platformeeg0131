function sim = Katz ( net ,lambda)
%% 功能：计算katz指标并返回相似度矩阵
%%数据： net 90*90的0、1矩阵
	%lambda 取0.01和0.001
%作者：王希
%日期：2014.06.11
    sim = inv( sparse(eye(size(net,1))) - lambda * net);   
    % 相似性矩阵的计算
    sim = sim - sparse(eye(size(net,1)));
    sim=full(sim);
    
end
