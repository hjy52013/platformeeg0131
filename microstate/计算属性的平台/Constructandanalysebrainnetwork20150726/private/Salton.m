function sim = Salton( net )
%%���ܣ� ����Saltonָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    tempdeg = repmat((sum(net,2)).^0.5,[1,size(net,1)]);       
    % �����������ģ��Ļ���Ҫ�ֿ顣
    tempdeg = tempdeg .* tempdeg';            
    % ��ĸ�ļ���
    sim = net * net;              
    % ���ӵļ���
    sim = sim./tempdeg;  
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
    sim=full(sim);
    
end
