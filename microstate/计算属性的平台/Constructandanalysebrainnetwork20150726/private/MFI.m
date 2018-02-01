function sim = MFI( net )
%% 功能：计算MFI指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    I = sparse(eye(size(net,1)));                                 
    % 生成单位矩阵
    D = I;
    D(logical(D)) = sum(net,2);         
    % 生成度矩阵（对角线元素为同下标节点的度）
    L = D - net;          
    clear D;              
    % 拉普拉斯矩阵
    sim = inv(I + L);      
    clear I L;       
    % 相似度矩阵的计算
    sim=full(sim);
    
end
