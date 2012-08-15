function x=trade(player,opp,strategy) 

if (strategy == 1) %always protectionism
    x=0;
    
elseif (strategy == 2) %always free trade
    x=1;
    
elseif(strategy==3) %Currency control for Currency control (titfortat)
    if(isempty(opp))
        x=1; % Be nice first
    else
        x=opp(length(opp)); % Repeat last opponent's trade
    end
    
elseif(strategy==4) %GRIM
    threshold=0.9;
    s1=rand(1,1);
    if(isempty(opp)) && s1<threshold % Be nice first randomly probability 0.9
        x=1;
    elseif (isempty(opp)) && s1>=threshold
        x=1;
    else
        if(sum(opp)<length(opp)) && s1<threshold % After one protectionism,protectionism
                                                 % always with probability
                                                 % 0.95
            x=0;
        else
            x=1;
        end
    end

else % random  free trader , and protecctionist trader
    s=rand(1,1);
    
    if (strategy==5)
        threshold = 0.35;
    else
        threshold = 0.65;
    end
    
    if(s<threshold)
        x=0;
    else
        x=1;
    end
end