function sim = PA( net )
%% ���ܣ�����PAָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    deg_row = sum(net,2);       
    % ���нڵ�Ķȹ�����������������������ת�ü���
    sim = deg_row * deg_row';  
    clear deg_row deg_col;       
    % ���ƶȾ���������
    sim=full(sim);
    
end
