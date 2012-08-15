%% Itereaded currency war based on prisioner dilema
% Returns four arguments: the two lists of strategies (0= Protectionism, 1= Free Trade)
% and the two GDPs and the acumualated GDP. 

function [X,Y,XGDP,YGDP]=iteratedcw(r,c1strat,c2strat,payoff)

% Init
mProtectionism=payoff(1,1);
mFreeTrade=payoff(2,2);
protecctionistlose=payoff(1,2);
protectionismwin=payoff(2,1);

X=[];
Y=[];
XGDP=0;
YGDP=0;
AcumXGDP=[];
AcumYGDP=[];

for i=1:r

    % Determine the next move based on the trading story
    newX=trade(X,Y,c1strat);
    newY=trade(Y,X,c2strat);

    % Add the last trade
    X=[X,newX];
    Y=[Y,newY];

    % Update the GDP
    if (newX==0) %Country1 protectionism
        if(newY==0)
            XGDP=XGDP+mProtectionism;
            YGDP=YGDP+mProtectionism;
            
        else
            XGDP=XGDP+protectionismwin;
            YGDP=YGDP+protecctionistlose;
        end
    else % Country1 Free Trade
        if(newY==0)
            XGDP=XGDP+protecctionistlose;
            YGDP=YGDP+protectionismwin;
        else
            XGDP=XGDP+mFreeTrade;
            YGDP=YGDP+mFreeTrade;
        end
    end
   
end
end



    