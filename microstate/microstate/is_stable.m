function [count,new_num]=is_stable(label,maxgfp)
num=length(label);
microstate_time=maxgfp(1,1);
count=1;
gfp_middle(1)=label(1);
gfp_middle(2:3)=maxgfp(1,:);
new_num=zeros(1,3);
for i=2:num
    if(label(i)~=label(i-1))
        microstate_time=microstate_time+(maxgfp(i,1)-maxgfp(i-1))/2;
        if (microstate_time<40)
            microstate_time=(maxgfp(i,1)-maxgfp(i-1))/2;
            gfp_middle(1)=label(i);
            gfp_middle(2:3)=maxgfp(i,:);
        else
            new_num(count,:)=gfp_middle;
            microstate_time=(maxgfp(i,1)-maxgfp(i-1))/2;
            count=count+1;
            gfp_middle(1)=label(i);
            gfp_middle(2:3)=maxgfp(i,:);
        end
    else
        microstate_time=microstate_time+(maxgfp(i,1)-maxgfp(i-1))/2;
        if(microstate_time<40)
            microstate_time=microstate_time+(maxgfp(i,1)-maxgfp(i-1))/2;
            if(gfp_middle(1,2)<=maxgfp(i,2))
                gfp_middle(1)=label(i);
                gfp_middle(2:3)=maxgfp(i,:);
            end
        else
            new_num(count,:)=gfp_middle;
            microstate_time=(maxgfp(i,1)-maxgfp(i-1))/2;
            count=count+1;
            gfp_middle(1)=label(i);
            gfp_middle(2:3)=maxgfp(i,:);
        end
    end
end



