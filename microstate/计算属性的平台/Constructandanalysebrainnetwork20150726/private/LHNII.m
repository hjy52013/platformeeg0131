function sim = LHNII( net,lambda )
%% 功能：计算LHNII指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
	%lambda 取0.9和0.95和0.99
%作者：王希
%日期：2014.06.11    M = nnz(net)/2;
    % 网络中的边数
    D = sparse(eye(size(net,1)));                                 
    D(logical(D)) = sum(net,2);   
    % 生成度矩阵 （对角线元素为同下标节点的度）
    D = inv(D);  
    % 求度矩阵的逆矩阵
    maxeig = max(eig(net));  
    % 求邻接矩阵的最大特征值
    tempmatrix = (sparse(eye(size(net,1))) - lambda/maxeig * net); 
    tempmatrix = inv(tempmatrix);
    sim = 2 * M * maxeig * D * tempmatrix * D;   clear D tempmatrix;
    % 完成相似度矩阵的计算
    sim=full(sim);
    
end
