function sim  = LocalPath( net, lambda )
%% ���ܣ�����LPָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
	%lambda ȡ0.0001
%���ߣ���ϣ
%���ڣ�2014.06.11
    sim = net*net;    
    % ����·��
    sim = sim + lambda * (net*net*net);   
    % ����·�� + ����������·��
     sim=full(sim);
    
 
end
