function sim = RA( net )
%% ����RAָ�겢�������ƾ���
    net1 = net ./ repmat(sum(net,2),[1,size(net,1)]); 
    % ����ÿ���ڵ��Ȩ�أ�1/k_i,�����ģ����ʱ��Ҫ�ֿ鴦��
    net1(isnan(net1)) = 0; 
    net1(isinf(net1)) = 0;
    sim = net * net1;  clear net1; 
    % ʵ�����ƶȾ���ļ���


    
end
