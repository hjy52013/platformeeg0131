function sim = Jaccard( net )
%% ���ܣ�����jaccardָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    sim = net * net;               
    % ��ɷ��ӵļ��㣬����ͬ��ͬ�ھ��㷨
    deg_row = repmat(sum(net,1), [size(net,1),1]);
    deg_row = deg_row .* spones(sim);                               
    % ֻ�豣�����Ӳ�Ϊ0��Ӧ��Ԫ��
    deg_row = triu(deg_row) + triu(deg_row');                      
    % ����ڵ��(x,y)�����ڵ�Ķ�֮��
    sim = sim./(deg_row.*spones(sim)-sim); clear deg_row;           
    % �������ƶȾ��� �ڵ�x��y������Ԫ����Ŀ = x��y�Ķ�֮�� - ������Ԫ����Ŀ
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim=full(sim);
    
end
