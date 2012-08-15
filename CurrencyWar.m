%% Runs an ICW (Iterated Curency war) 
% Countries  with different strategies iteratedtly face each others and decide
% to be proteccionist or having free trade policies.

% Strategies  have menory and based in the past behavior

fprintf('\nStart the tournament...\n');
R=200; % number of trading days

%% PLAYERS & STRATEGIES
% Set up 4 players and assign them different strategies
% 1 always proteccionism
% 2 always free trade
% 3 Currency control of the other do the same
% 4 GRIM if once currency control always currency control
% 5 Random 0.5 Proteccionsim
% 6 Random 0.7 Proteccionsim
Q=[1,2,3,4,5,6];
n=length(Q);

%% MATRIX PAYOFF

% We assume the payoff the total surplus of free trade, is 
% higher than tempation to proteccionism 3+3 > 5+0

bothProteccionsit = 1;
bothFreeTrade = 3;
temptationToproteccionism = 5;
ProteccionistPayoff = 0;

payoffMatrix = [bothProteccionsit,Proteccionsit;
                temptationToProteccionsit,bothFreetrade]

%% START CURRENCY WAR
%
Z=zeros(n,n); % Currency war table

for i=1:n
    for j=1:n
        [hC1,hC2,GDPC1,GDPC2 ]=iteratedcw(R,Q(i),Q(j),payoffMatrix);
        Z(i,j)=scoreGDPC1; 
    end
end


%% PRINT RESULTS
%
display(Z);
scores = zeros(n,1);
for i=1:n
    scores(i)=sum(Z(i,1:n));
end
display(scores);

imagesc(Z);

% Who wins?
% Why?

