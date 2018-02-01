function sim = HDI( net )
%% ���ܣ�����HDIָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    sim = net * net;      
    % ��ɷ��ӵļ��㣬����ͬ��ͬ�ھ��㷨
    deg_row = repmat(sum(net,1), [size(net,1),1]);
    deg_row = deg_row .* spones(sim);
    deg_row = max(deg_row, deg_row');  
    % ��ɷ�ĸ�ļ��㣬����Ԫ��(i,j)��ʾȡ�˽ڵ�i�ͽڵ�j�Ķȵ����ֵ
    sim = sim ./ deg_row; clear deg_row;     
    % ������ƶȾ���ļ���
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim=full(sim);
    
end
