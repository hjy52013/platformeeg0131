function sim = RA( net )
%% 计算RA指标并返回相似矩阵
    net1 = net ./ repmat(sum(net,2),[1,size(net,1)]); 
    % 计算每个节点的权重，1/k_i,网络规模过大时需要分块处理
    net1(isnan(net1)) = 0; 
    net1(isinf(net1)) = 0;
    sim = net * net1;  clear net1; 
    % 实现相似度矩阵的计算


    
end
