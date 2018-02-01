function sim = Salton( net )
%%功能： 计算Salton指标并返回相似矩阵
%%数据： net 90*90的0、1矩阵
%作者：王希
%日期：2014.06.11
    tempdeg = repmat((sum(net,2)).^0.5,[1,size(net,1)]);       
    % 可能溢出，规模大的话需要分块。
    tempdeg = tempdeg .* tempdeg';            
    % 分母的计算
    sim = net * net;              
    % 分子的计算
    sim = sim./tempdeg;  
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim=full(sim);
    
end
