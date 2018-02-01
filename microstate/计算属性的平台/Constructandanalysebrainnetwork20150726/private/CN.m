function sim = CN( net )
%% 计算CN指标并返回相似矩阵
    sim = net * net;        
    % 相似度矩阵的计算
     % sim = triu(sim - sim.*net);
    % 只保留测试集和不存在边集合中的边的相似度（自环除外）
  %  non = 1 - net - eye(max(size(net,1),size(net,2)));
    sim=full(sim);
    
end
