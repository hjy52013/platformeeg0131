function sim = CN( net )
%% ����CNָ�겢�������ƾ���
    sim = net * net;        
    % ���ƶȾ���ļ���
     % sim = triu(sim - sim.*net);
    % ֻ�������Լ��Ͳ����ڱ߼����еıߵ����ƶȣ��Ի����⣩
  %  non = 1 - net - eye(max(size(net,1),size(net,2)));
    sim=full(sim);
    
end
