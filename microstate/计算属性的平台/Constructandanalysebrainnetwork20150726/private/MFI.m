function sim = MFI( net )
%% ���ܣ�����MFIָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    I = sparse(eye(size(net,1)));                                 
    % ���ɵ�λ����
    D = I;
    D(logical(D)) = sum(net,2);         
    % ���ɶȾ��󣨶Խ���Ԫ��Ϊͬ�±�ڵ�Ķȣ�
    L = D - net;          
    clear D;              
    % ������˹����
    sim = inv(I + L);      
    clear I L;       
    % ���ƶȾ���ļ���
    sim=full(sim);
    
end
