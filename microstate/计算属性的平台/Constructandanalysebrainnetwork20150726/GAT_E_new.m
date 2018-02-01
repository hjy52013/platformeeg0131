function GAT_E_new()
%% 功能：计算E值
for sparsity=1:8
    B=importdata(strcat('D:\研\链路预测','\GAT_Attribution_jianhua.mat'));
    sparsity_str=num2str(sparsity*5);
    property={};
    geshi={};
    geshi_guiyi={};
    %aa
    property{1,1}='aa';
    geshi{1,1}='aa';
    geshi_guiyi{1,1}='aa';
    for bs=1:28
        a=abs(B.aa{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        geshi{1,2}(bs,1)=a;
        cc=abs(B.aa{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        geshi{1,3}(bs,1)=cc;
        tran=abs(B.aa{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        geshi{1,4}(bs,1)=tran;
        g=abs(B.aa{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        geshi{1,5}(bs,1)=g;
        l=abs(B.aa{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        geshi{1,6}(bs,1)=l;
        m=abs(B.aa{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        geshi{1,7}(bs,1)=m;
        s=abs(B.aa{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        geshi{1,8}(bs,1)=s;
        E_cheng=1/(a*cc*tran*g*l*m*s);
        aa_E_cheng(bs,1)=E_cheng;    
        E_jia=(a+cc+tran+g+l+m+s);
        aa_E_jia(bs,1)=E_jia; 
    end
     property{1,2}=aa_E_cheng;
     property{1,3}=aa_E_jia;
     
     
      %cn
       property{2,1}='cn';
       geshi{2,1}='cn';
       geshi_guiyi{2,1}='cn';
    for bs=1:28
        cn_a=abs(B.cn{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        geshi{2,2}(bs,1)=cn_a;
        cn_cc=abs(B.cn{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        geshi{2,3}(bs,1)=cn_cc;
        cn_tran=sqrt(B.cn{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        geshi{2,4}(bs,1)=cn_tran;
        cn_g=abs(B.cn{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        geshi{2,5}(bs,1)=cn_g;
        cn_l=abs(B.cn{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        geshi{2,6}(bs,1)=cn_l;
        cn_m=abs(B.cn{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        geshi{2,7}(bs,1)=cn_m;
        cn_s=abs(B.cn{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        geshi{2,8}(bs,1)=cn_s;
        E_cheng=1/(cn_a*cn_cc*cn_tran*cn_g*cn_l*cn_m*cn_s);
        cn_cheng(bs,1)=E_cheng; 
        E_jia=(cn_a+cn_cc+cn_tran+cn_g+cn_l+cn_m+cn_s);
        cn_jia(bs,1)=E_jia; 
    end
    property{2,2}=cn_cheng;
    property{2,3}=cn_jia;
    
    
       %hpi
       property{3,1}='hpi';
       geshi{3,1}='hpi';
       geshi_guiyi{3,1}='hpi';
    for bs=1:28
        a=abs(B.hpi{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        geshi{3,2}(bs,1)=a;
        cc=abs(B.hpi{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        geshi{3,3}(bs,1)=cc;
        tran=abs(B.hpi{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        geshi{3,4}(bs,1)=tran;
        g=abs(B.hpi{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        geshi{3,5}(bs,1)=g;
        l=abs(B.hpi{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        geshi{3,6}(bs,1)=l;
        m=abs(B.hpi{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        geshi{3,7}(bs,1)=m;
        s=abs(B.hpi{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        geshi{3,8}(bs,1)=s;
        E_cheng=1/(a*cc*tran*g*l*m*s);
        hpi_cheng(bs,1)=E_cheng;
        E_jia=(a+cc+tran+g+l+m+s);
        hpi_jia(bs,1)=E_jia;
    end
        property{3,2}=hpi_cheng;
        property{3,3}=hpi_jia;   
        
      %lhn      
    property{4,1}='lhn';
    geshi{4,1}='lhn';
    geshi_guiyi{4,1}='lhn';
    for bs=1:28
        a=abs(B.lhn{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        geshi{4,2}(bs,1)=a;
        cc=abs(B.lhn{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        geshi{4,3}(bs,1)=cc;
        tran=abs(B.lhn{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        geshi{4,4}(bs,1)=tran;
        g=abs(B.lhn{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        geshi{4,5}(bs,1)=g;
        l=abs(B.lhn{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        geshi{4,6}(bs,1)=l;
        m=abs(B.lhn{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        geshi{4,7}(bs,1)=m;
        s=abs(B.lhn{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        geshi{4,8}(bs,1)=s;
        E_cheng=1/(a*cc*tran*g*l*m*s);
       lhn_cheng(bs,1)=E_cheng;
       E_jia=(a+cc+tran+g+l+m+s);
       lhn_jia(bs,1)=E_jia;
    end
      property{4,2}=lhn_cheng;
      property{4,3}=lhn_jia;
      
    %pa
    property{5,1}='pa';
    geshi{5,1}='pa';
    geshi_guiyi{5,1}='pa';
    for bs=1:28
        a=abs(B.pa{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        geshi{5,2}(bs,1)=a;
        cc=abs(B.pa{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        geshi{5,3}(bs,1)=cc;
        tran=abs(B.pa{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        geshi{5,4}(bs,1)=tran;
        g=abs(B.pa{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        geshi{5,5}(bs,1)=g;
        l=abs(B.pa{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        geshi{5,6}(bs,1)=l;
        m=abs(B.pa{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        geshi{5,7}(bs,1)=m;
        s=abs(B.pa{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        geshi{5,8}(bs,1)=s;
        E_cheng=1/(a*cc*tran*g*l*m*s);
        pa_cheng(bs,1)=E_cheng;
        E_jia=(a+cc+tran+g+l+m+s);
        pa_jia(bs,1)=E_jia;
    end
    property{5,2}=pa_cheng;
    property{5,3}=pa_jia;
     %ra   
    property{6,1}='ra';
     geshi{6,1}='ra';
     geshi_guiyi{6,1}='ra';
    for bs=1:28
        a=abs(B.ra{1,2}(bs,sparsity)-B.R{1,2}(bs,sparsity));
        geshi{6,2}(bs,1)=a;
        cc=abs(B.ra{2,2}(bs,sparsity)-B.R{2,2}(bs,sparsity));
        geshi{6,3}(bs,1)=cc;
        tran=abs(B.ra{3,2}(bs,sparsity)-B.R{3,2}(bs,sparsity));
        geshi{6,4}(bs,1)=tran;
        g=abs(B.ra{4,2}(bs,sparsity)-B.R{4,2}(bs,sparsity));
        geshi{6,5}(bs,1)=g;
        l=abs(B.ra{5,2}(bs,sparsity)-B.R{5,2}(bs,sparsity));
        geshi{6,6}(bs,1)=l;
        m=abs(B.ra{6,2}(bs,sparsity)-B.R{6,2}(bs,sparsity));
        geshi{6,7}(bs,1)=m;
        s=abs(B.ra{7,2}(bs,sparsity)-B.R{7,2}(bs,sparsity));
        geshi{6,8}(bs,1)=s;
        E_cheng=1/(a*cc*tran*g*l*m*s);
        ra_cheng(bs,1)=E_cheng;
        E_jia=(a+cc+tran+g+l+m+s);
        ra_jia(bs,1)=E_jia;
    end
      property{6,2}=ra_cheng;
      property{6,3}=ra_jia;
      
      
      %差值的归一化
      for hang=1:6
     for  i=2:8
         juzhen=geshi{hang,i};
         minva=min(juzhen);
         maxva=max(juzhen);
         for j=1:28
                     v=juzhen(j,1);
                     geshi_guiyi{hang,i}(j,1)=(v-minva)/(maxva-minva);                
             end
     end
      end
      
      %归一化后求E值
      for zb=1:6
          for bs=1:28
              E_guiyi_jia=0;
              E_guiyi_cheng=1;
              for shuxing=2:8
             E_guiyi_jia=E_guiyi_jia+geshi_guiyi{zb,shuxing}(bs,1)  ;
             E_guiyi_cheng=E_guiyi_cheng*geshi_guiyi{zb,shuxing}(bs,1) ;
              end
              E_guiyi_cheng=1/E_guiyi_cheng;
              property{zb,4}(bs,1)=E_guiyi_jia;
              property{zb,5}(bs,1)=E_guiyi_cheng;
          end
          
      end
      
   save(strcat('D:\研\链路预测','\GAT_E_sparsity',sparsity_str,'.mat'),'property');
   save(strcat('D:\研\链路预测','\GAT_E__geshi_sparsity',sparsity_str,'.mat'),'geshi');
    save(strcat('D:\研\链路预测','\GAT_E__geshi__guiyi_sparsity',sparsity_str,'.mat'),'geshi_guiyi');
   
   
end
end