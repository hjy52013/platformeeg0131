function sim = LNBAA( net )
%% 功能：计算局部朴素贝叶斯模型性AA指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    s = size(net,1)*(size(net,1)-1) / nnz(net) -1;  
    % 计算每个网络中的常量s
    tri = diag(net*net*net)/2;     
    % 计算每个点所在的三角形个数
    tri_max = sum(net,2).*(sum(net,2)-1)/2;  
    % 每个点最大可能所在的三角形个数
    R_w = (tri+1)./(tri_max+1); clear tri tri_max; 
    % 接下来几步是按照公式度量每个点的角色  
    SR_w = (log(s)+log(R_w))./log(sum(net,2)); clear s R_w;
    SR_w(isnan(SR_w)) = 0; SR_w(isinf(SR_w)) = 0;
    SR_w = repmat(SR_w,[1,size(net,1)]) .* net;   
    % 节点的角色计算完毕
    sim = spones(net) * SR_w;   clear SR_w;                       
    % 将节点对（x,y）的共同邻居的角色量化值相加即可
    sim=full(sim);
    
end
