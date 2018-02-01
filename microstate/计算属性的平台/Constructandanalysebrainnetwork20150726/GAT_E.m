function GAT_E()
%% 功能：载入简化后的矩阵，并且进行归一化（标准化）
% A=importdata(strcat('D:\研\链路预测','\GAT_Attribution_jianhua.mat'));
% B=A;
% for Hang=1:7
% a=A.R{Hang,2}
% %对矩阵进行归一化
%              minva=min(a);
%              minvalue=min(minva);
%              maxva=max(a);
%              maxvalue=max(maxva);
%              for i=1:28
%                  for j=1:8
%                      v=a(i,j);
%                      %guiyi=(v-min)*(max-min);
%                      B.R{Hang,2}(i,j)=(v-minvalue)/(maxvalue-minvalue);
%                  end
%              end
%              %只保留小数点后三位数字
%              B.R{Hang,2}=roundn(B.R{Hang,2},-3);
%               for i=1:28
%                  for j=1:8
%                      %将最小的0改为0.01，将最大的1改为0.999
%                        if B.R{Hang,2}(i,j)==1  B.R{Hang,2}(i,j)=0.001 
%                        else if B.R{Hang,2}(i,j)==0 B.R{Hang,2}(i,j)=0.999 
%                            end
%                        end
%                  end
%              end
% end
% 
% for Hang=1:7
% a=A.aa{Hang,2}
% %对矩阵进行归一化
%              minva=min(a);
%              minvalue=min(minva);
%              maxva=max(a);
%              maxvalue=max(maxva);
%              for i=1:28
%                  for j=1:8
%                      v=a(i,j);
%                      %guiyi=(v-min)*(max-min);
%                      B.aa{Hang,2}(i,j)=(v-minvalue)/(maxvalue-minvalue);
%                  end
%              end
%              %只保留小数点后三位数字
%              B.aa{Hang,2}=roundn(B.aa{Hang,2},-3);
%               for i=1:28
%                  for j=1:8
%                      if B.aa{Hang,2}(i,j)==1  B.aa{Hang,2}(i,j)=0.001 
%                      else if B.aa{Hang,2}(i,j)==0 B.aa{Hang,2}(i,j)=0.999 
%                          end
%                      end
%                  end
%               end
% end
% 
% for Hang=1:7
% a=A.cn{Hang,2}
% %对矩阵进行归一化
%              minva=min(a);
%              minvalue=min(minva);
%              maxva=max(a);
%              maxvalue=max(maxva);
%              for i=1:28
%                  for j=1:8
%                      v=a(i,j);
%                      %guiyi=(v-min)*(max-min);
%                      B.cn{Hang,2}(i,j)=(v-minvalue)/(maxvalue-minvalue);               
%                  end
%              end
%              %只保留小数点后三位数字
%              B.cn{Hang,2}=roundn(B.cn{Hang,2},-3);
%              for i=1:28
%                  for j=1:8
%                       %将最小的0改为0.01，将最大的1改为0.999
%                        if B.cn{Hang,2}(i,j)==1  B.cn{Hang,2}(i,j)=0.001 
%                        else if B.cn{Hang,2}(i,j)==0 B.cn{Hang,2}(i,j)=0.999 
%                            end
%                        end
%                  end
%              end
% end
% 
% for Hang=1:7
% a=A.hpi{Hang,2}
% %对矩阵进行归一化
%              minva=min(a);
%              minvalue=min(minva);
%              maxva=max(a);
%              maxvalue=max(maxva);
%              for i=1:28
%                  for j=1:8
%                      v=a(i,j);
%                      %guiyi=(v-min)*(max-min);
%                      B.hpi{Hang,2}(i,j)=(v-minvalue)/(maxvalue-minvalue);
%                  end
%              end
%              %只保留小数点后三位数字
%              B.hpi{Hang,2}=roundn(B.hpi{Hang,2},-3);
%              for i=1:28
%                  for j=1:8
%                       %将最小的0改为0.01，将最大的1改为0.999
%                        if B.hpi{Hang,2}(i,j)==1  B.hpi{Hang,2}(i,j)=0.001 
%                        else if B.hpi{Hang,2}(i,j)==0 B.hpi{Hang,2}(i,j)=0.999 
%                            end
%                        end
%                  end
%              end
% end
% 
% for Hang=1:7
% a=A.lhn{Hang,2}
% %对矩阵进行归一化
%              minva=min(a);
%              minvalue=min(minva);
%              maxva=max(a);
%              maxvalue=max(maxva);
%              for i=1:28
%                  for j=1:8
%                      v=a(i,j);
%                      %guiyi=(v-min)*(max-min);
%                      B.lhn{Hang,2}(i,j)=(v-minvalue)/(maxvalue-minvalue);
%                  end
%              end
%              %只保留小数点后三位数字
%              B.lhn{Hang,2}=roundn(B.lhn{Hang,2},-3);
%              for i=1:28
%                  for j=1:8
%                       %将最小的0改为0.01，将最大的1改为0.999
%                        if B.lhn{Hang,2}(i,j)==1  B.lhn{Hang,2}(i,j)=0.001 
%                        else if B.lhn{Hang,2}(i,j)==0 B.lhn{Hang,2}(i,j)=0.999 
%                            end
%                        end
%                  end
%              end
% end
% 
% for Hang=1:7
% a=A.pa{Hang,2}
% %对矩阵进行归一化
%              minva=min(a);
%              minvalue=min(minva);
%              maxva=max(a);
%              maxvalue=max(maxva);
%              for i=1:28
%                  for j=1:8
%                      v=a(i,j);
%                      %guiyi=(v-min)*(max-min);
%                      B.pa{Hang,2}(i,j)=(v-minvalue)/(maxvalue-minvalue);   
%                  end
%              end
%              %只保留小数点后三位数字
%              B.pa{Hang,2}=roundn(B.pa{Hang,2},-3);
%               for i=1:28
%                  for j=1:8
%                       %将最小的0改为0.01，将最大的1改为0.999
%                        if B.pa{Hang,2}(i,j)==1  B.pa{Hang,2}(i,j)=0.001 
%                        else if B.pa{Hang,2}(i,j)==0 B.pa{Hang,2}(i,j)=0.999 
%                            end
%                        end
%                  end
%              end
% end
% 
% for Hang=1:7
% a=A.ra{Hang,2}
% %对矩阵进行归一化
%              minva=min(a);
%              minvalue=min(minva);
%              maxva=max(a);
%              maxvalue=max(maxva);
%              for i=1:28
%                  for j=1:8
%                      v=a(i,j);
%                      %guiyi=(v-min)*(max-min);
%                      B.ra{Hang,2}(i,j)=(v-minvalue)/(maxvalue-minvalue);
%                  end
%              end
%              %只保留小数点后三位数字
%              B.ra{Hang,2}=roundn(B.ra{Hang,2},-3);
%              for i=1:28
%                  for j=1:8
%                       %将最小的0改为0.01，将最大的1改为0.999
%                        if B.ra{Hang,2}(i,j)==1  B.ra{Hang,2}(i,j)=0.001 
%                        else if B.ra{Hang,2}(i,j)==0 B.ra{Hang,2}(i,j)=0.999 
%                            end
%                        end
%                  end
%              end
% end
% 
% save(strcat('D:\研\链路预测','\GAT_Attribution_gy_bianxing.mat'),'B');
%% 功能：计算E值
for sparsity=1:8
    B=importdata(strcat('D:\研\链路预测','\GAT_Attribution_jianhua.mat'));
    sparsity_str=num2str(sparsity*5);
    property={};
%     %aa
%     property{1,1}='aa';
%     for bs=1:28
%         a=sqrt(B.aa{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
%         aa_a=a*a;
%         cc=sqrt(B.aa{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
%         aa_cc=cc*cc;
%         tran=sqrt(B.aa{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
%         aa_tran=tran*tran;
%         g=sqrt(B.aa{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
%         aa_g=g*g;
%         l=sqrt(B.aa{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
%         aa_l=l*l;
%         m=sqrt(B.aa{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
%         aa_m=m*m;
%         s=sqrt(B.aa{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
%         aa_s=s*s;
%         E=1/aa_a*aa_cc*aa_tran*aa_g*aa_l*aa_m*aa_s;
%         aa(bs,1)=E;    
%     end
%      property{1,2}=aa;
     
      %cn
       property{2,1}='cn';
    for bs=1:28
        a=abs(B.cn{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
%         cn_a=a*a;
        cc=abs(B.cn{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
%         cn_cc=cc*cc;
        tran=sqrt(B.cn{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
%         cn_tran=tran*tran;
        g=abs(B.cn{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
%         cn_g=g*g;
        l=abs(B.cn{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
%         cn_l=l*l;
        m=abs(B.cn{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
%         cn_m=m*m;
        s=abs(B.cn{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
%         cn_s=s*s;
        E=1/(a*cc*tran*g*l*m*s);
        cn(bs,1)=E;     
    end
    property{2,2}=cn;
    
       %hpi
       property{3,1}='hpi';
    for bs=1:28
        a=sqrt(B.hpi{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        hpi_a=a*a;
        cc=sqrt(B.hpi{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        hpi_cc=cc*cc;
        tran=sqrt(B.hpi{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        hpi_tran=tran*tran;
        g=sqrt(B.hpi{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        hpi_g=g*g;
        l=sqrt(B.hpi{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        hpi_l=l*l;
        m=sqrt(B.hpi{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        hpi_m=m*m;
        s=sqrt(B.hpi{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        hpi_s=s*s;
        E=1/hpi_a*hpi_cc*hpi_tran*hpi_g*hpi_l*hpi_m*hpi_s;
        hpi(bs,1)=E;
    end
        property{3,2}=hpi;
             
      %lhn      
    property{4,1}='lhn';
    for bs=1:28
        a=sqrt(B.lhn{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        lhn_a=a*a;
        cc=sqrt(B.lhn{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        lhn_cc=cc*cc;
        tran=sqrt(B.lhn{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        lhn_tran=tran*tran;
        g=sqrt(B.lhn{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        lhn_g=g*g;
        l=sqrt(B.lhn{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        lhn_l=l*l;
        m=sqrt(B.lhn{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        lhn_m=m*m;
        s=sqrt(B.lhn{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        lhn_s=s*s;
        E=1/lhn_a*lhn_cc*lhn_tran*lhn_g*lhn_l*lhn_m*lhn_s;
       lhn(bs,1)=E;
    end
      property{4,2}=lhn;
      
    %pa
    property{5,1}='pa';
    for bs=1:28
        a=sqrt(B.pa{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        pa_a=a*a;
        cc=sqrt(B.pa{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        pa_cc=cc*cc;
        tran=sqrt(B.pa{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        pa_tran=tran*tran;
        g=sqrt(B.pa{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        pa_g=g*g;
        l=sqrt(B.pa{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        pa_l=l*l;
        m=sqrt(B.pa{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        pa_m=m*m;
        s=sqrt(B.pa{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        pa_s=s*s;
        E=1/pa_a*pa_cc*pa_tran*pa_g*pa_l*pa_m*pa_s;
        pa(bs,1)=E;
    end
    property{5,2}=pa;
    
     %ra   
    property{6,1}='ra';
    for bs=1:28
        a=sqrt(B.ra{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        ra_a=a*a;
        cc=sqrt(B.ra{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        ra_cc=cc*cc;
        tran=sqrt(B.ra{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        ra_tran=tran*tran;
        g=sqrt(B.ra{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        ra_g=g*g;
        l=sqrt(B.ra{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        ra_l=l*l;
        m=sqrt(B.ra{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        ra_m=m*m;
        s=sqrt(B.ra{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        ra_s=s*s;
        E=1/ra_a*ra_cc*ra_tran*ra_g*ra_l*ra_m*ra_s;
        ra(bs,1)=E;
    end
      property{6,2}=ra;
      
   save(strcat('D:\研\链路预测','\GAT_E_sparsity',sparsity_str,'.mat'),'property');
   clear;
end
end