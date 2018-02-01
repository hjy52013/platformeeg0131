function sim = RWR( net,lambda )
%% 功能：计算RWR指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
	%lambda 取0.85和0.95
%作者：王希
%日期：2014.06.11
    deg = repmat(sum(net,2),[1,size(net,2)]);
    net = net ./ deg; 	clear deg;
    % 求转移矩阵
    I = sparse(eye(size(net,1)));                                
    % 生成单位矩阵
    sim = (1 - lambda) * inv(I- lambda * net') * I;
    sim = sim+sim';                           
    % 相似度矩阵计算完成
    sim=full(sim);
    
end
