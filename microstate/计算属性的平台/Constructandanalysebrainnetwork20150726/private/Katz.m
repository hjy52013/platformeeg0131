function sim = Katz ( net ,lambda)
%% ���ܣ�����katzָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
	%lambda ȡ0.01��0.001
%���ߣ���ϣ
%���ڣ�2014.06.11
    sim = inv( sparse(eye(size(net,1))) - lambda * net);   
    % �����Ծ���ļ���
    sim = sim - sparse(eye(size(net,1)));
    sim=full(sim);
    
end
