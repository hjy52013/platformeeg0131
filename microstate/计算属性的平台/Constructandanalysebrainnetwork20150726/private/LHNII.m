function sim = LHNII( net,lambda )
%% ���ܣ�����LHNIIָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
	%lambda ȡ0.9��0.95��0.99
%���ߣ���ϣ
%���ڣ�2014.06.11    M = nnz(net)/2;
    % �����еı���
    D = sparse(eye(size(net,1)));                                 
    D(logical(D)) = sum(net,2);   
    % ���ɶȾ��� ���Խ���Ԫ��Ϊͬ�±�ڵ�Ķȣ�
    D = inv(D);  
    % ��Ⱦ���������
    maxeig = max(eig(net));  
    % ���ڽӾ�����������ֵ
    tempmatrix = (sparse(eye(size(net,1))) - lambda/maxeig * net); 
    tempmatrix = inv(tempmatrix);
    sim = 2 * M * maxeig * D * tempmatrix * D;   clear D tempmatrix;
    % ������ƶȾ���ļ���
    sim=full(sim);
    
end
