function sim = TSCN( net,lambda )
%% ���ܣ�����TSCNָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
	%lambda ȡ0.01
%���ߣ���ϣ
%���ڣ�2014.06.11
    sim = net * net;                       
    % ���㹲ͬ�ھ����ƶȾ���
    I = sparse(eye(size(net,1)));
    sim = inv(I - lambda*sim) * sim;
    % ���ƶ�ת��
    sim=full(sim);
    
end
