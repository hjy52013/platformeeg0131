function sim = AA( net )
%%功能： 计算AA指标并返回相似度矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    net1 = net ./ repmat(log(sum(net,2)),[1,size(net,1)]); 
    % 计算每个节点的权重，1/log(k_i),网络规模过大时需要分块处理
    net1(isnan(net)) = 0; 
    net1(isinf(net1)) = 0;  
    % 将除数为0得到的异常值置为0
    sim = net * net1;   clear net1;  
    % 实现相似度矩阵的计算
    sim=full(sim);
     sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
