function sim = LHN( net )
%% ���ܣ�����LHN1ָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    sim = net * net;     
    % ��ɷ��ӵļ��㣬����ͬ��ͬ�ھ��㷨
    deg = sum(net,2);
    deg = deg*deg';                                         
    %��ɷ�ĸ�ļ���
    sim = sim ./ deg;                                      
    %���ƶȾ���ļ���
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim = full(sim);
    
end
