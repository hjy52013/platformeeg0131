function sim = AA( net )
%%���ܣ� ����AAָ�겢�������ƶȾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    net1 = net ./ repmat(log(sum(net,2)),[1,size(net,1)]); 
    % ����ÿ���ڵ��Ȩ�أ�1/log(k_i),�����ģ����ʱ��Ҫ�ֿ鴦��
    net1(isnan(net)) = 0; 
    net1(isinf(net1)) = 0;  
    % ������Ϊ0�õ����쳣ֵ��Ϊ0
    sim = net * net1;   clear net1;  
    % ʵ�����ƶȾ���ļ���
    sim=full(sim);
     sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
