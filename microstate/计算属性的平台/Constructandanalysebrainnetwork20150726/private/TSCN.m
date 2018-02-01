function sim = TSCN( net,lambda )
%% 功能：计算TSCN指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
	%lambda 取0.01
%作者：王希
%日期：2014.06.11
    sim = net * net;                       
    % 计算共同邻居相似度矩阵
    I = sparse(eye(size(net,1)));
    sim = inv(I - lambda*sim) * sim;
    % 相似度转移
    sim=full(sim);
    
end
