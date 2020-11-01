function I=identify_root(I)    
%method 1
    I_Old=1:length(I);I_Old=I_Old';
    I=I(I_Old);
    steps_for_root_finding=0;
    while 1
        I_Old=I;
        I=I_Old(I_Old);
        if norm(I-I_Old)          
            steps_for_root_finding=steps_for_root_finding+1;
        else 
            break;
        end
    end