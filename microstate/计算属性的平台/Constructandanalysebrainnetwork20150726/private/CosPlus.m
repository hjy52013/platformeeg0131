function sim = CosPlus( net )
%% 功能：计算CosPlus指标并返回相似度矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    D = sparse(eye(size(net,1)));                        
    % 生成稀疏的单位矩阵
    D(logical(D)) = sum(net,2);  
    % 生成度矩阵 （对角线元素为同下标节点的度）
    pinvL = sparse(pinv( full(D - net) ));      clear D;
    % 拉普拉斯矩阵的伪逆  
    Lxx = diag(pinvL);   
    % 取对角线元素
    sim = pinvL ./ (Lxx*Lxx').^0.5;                         
    % 求相似度矩阵
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim=full(sim);
    
end
