function sim = ACT( net )
%% ���ܣ�����ACTָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    D = sparse(eye(size(net,1)));   
    % ����ϡ��ĵ�λ����
    D(logical(D)) = sum(net,2);   
    % ���ɶȾ��󣨶Խ���Ԫ��Ϊͬ�±�ڵ�Ķȣ�
    pinvL = sparse(pinv( full(D - net) ));   clear D;
    % ������˹�����α��
    Lxx = diag(pinvL);     
    % ȡ�Խ���Ԫ��
    Lxx = repmat(Lxx, [1,size(net,1)]);   
    % ���Խ���Ԫ��������չΪn��n�׾���
    sim = 1./(Lxx + Lxx' - 2*pinvL);               
    % �����ƶȾ���
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim=full(sim);
    
end
