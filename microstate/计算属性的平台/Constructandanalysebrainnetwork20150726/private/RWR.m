function sim = RWR( net,lambda )
%% ���ܣ�����RWRָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
	%lambda ȡ0.85��0.95
%���ߣ���ϣ
%���ڣ�2014.06.11
    deg = repmat(sum(net,2),[1,size(net,2)]);
    net = net ./ deg; 	clear deg;
    % ��ת�ƾ���
    I = sparse(eye(size(net,1)));                                
    % ���ɵ�λ����
    sim = (1 - lambda) * inv(I- lambda * net') * I;
    sim = sim+sim';                           
    % ���ƶȾ���������
    sim=full(sim);
    
end
