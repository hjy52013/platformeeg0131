function sim = Sorenson( net )
%% ���ܣ�����Sorensonָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    sim = net * net;                                            
    % �������
    sim = triu(sim,1);
    deg_col = repmat(sum(net,2), [1 size(net,1)]);              
    % �����ĸ
    deg_col = triu(deg_col' + deg_col);
    sim = 2 * sim ./ deg_col;                             
    % ���ƶȾ���������
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;

    sim=full(sim);
    
end
