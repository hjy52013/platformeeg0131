function sim = LNBAA( net )
%% ���ܣ�����ֲ����ر�Ҷ˹ģ����AAָ�겢�������ƾ���
%%���ݣ� net 90*90��0��1����
%���ߣ���ϣ
%���ڣ�2014.06.11
    s = size(net,1)*(size(net,1)-1) / nnz(net) -1;  
    % ����ÿ�������еĳ���s
    tri = diag(net*net*net)/2;     
    % ����ÿ�������ڵ������θ���
    tri_max = sum(net,2).*(sum(net,2)-1)/2;  
    % ÿ�������������ڵ������θ���
    R_w = (tri+1)./(tri_max+1); clear tri tri_max; 
    % �����������ǰ��չ�ʽ����ÿ����Ľ�ɫ  
    SR_w = (log(s)+log(R_w))./log(sum(net,2)); clear s R_w;
    SR_w(isnan(SR_w)) = 0; SR_w(isinf(SR_w)) = 0;
    SR_w = repmat(SR_w,[1,size(net,1)]) .* net;   
    % �ڵ�Ľ�ɫ�������
    sim = spones(net) * SR_w;   clear SR_w;                       
    % ���ڵ�ԣ�x,y���Ĺ�ͬ�ھӵĽ�ɫ����ֵ��Ӽ���
    sim=full(sim);
    
end
