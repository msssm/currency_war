

%%POWER LAW SIMULATIONS
%% Equilibrium  P=0.2,Q=0.3   COEXISITENCE EQUILIBRIUM or Bistability

P=0.4;
Q=0.5;
M=1000; % Number of firms in emerging markets block
N=1000; % Number of firms in Developed markets block

X=10*ones(1000,1000);
 
 for i=2:1000;
     for j=2 :1000
     X(i,j)= ((1+0.0001*randn(1,1))^((1-P)*N))*((1+0.0001*randn(1,1))^(P*M))*((1+0.0001*randn(1,1))^(Q*N))*X(i-1,j);
     end
 end
 
 
 
%%% Equilibrium P=0, Q=1   (Develop markets dominates) 
 
P=0;
Q=1;
M=1000; % Number of firms in emerging markets block
N=1000; % Number of firms in Developed markets block
 
 X2=10*ones(1000,1000);
 
 for i=2:1000;
     for j=2 :1000
     X2(i,j)= (1+0.0001*randn(1,1))^((1-P)*N)*((1+0.0001*randn(1,1))^(Q*M))*X2(i-1,j);
     end
 end

 
 
% Equilibrium P=1, Q=0 (Emerging Markets dominates)
  
P=1;
Q=0;
M=1000; % Number of firms in emerging markets block
N=1000; % Number of firms in Developed markets block
 
 X3=10*ones(1000,1000);
 
 for i=2:1000;
     for j=2 :1000
     X3(i,j)= ((1+0.0001*randn(1,1))^(P*N))*X3(i-1,j);
     end
 end
 
 
 
% Equilibrium P=0 , Q=0;  (Currency War)
P=0;
Q=0;
M=1000; % Number of firms in emerging markets block
N=1000; % Number of firms in Developed markets block
 
X4=10*ones(1000,1000);

for i=2:1000;
     for j=2 :1000
     X4(i,j)= (1+0.0001*randn(1,1))^((1-P)*N)*X4(i-1,j);
     end
end


%%% Equilibrium P=1, Q=1; (Emergence of international trade standard)


P=1;
Q=1;
M=1000; % Number of firms in emerging markets block
N=1000; % Number of firms in Developed markets block
 
X5=10*ones(1000,1000);

for i=2:1000;
     for j=2 :1000
     X5(i,j)= ((1+0.0001*randn(1,1))^(P*N))*((1+0.0001*randn(1,1))^(Q*M))*X5(i-1,j);
     end
end

 
 %%%%% Ploting
 
 

 
 loglog(sort(X(500,:)/min(X(500,:)),2),sort(1-(cumsum(hist(X(500,:),1000)))/1000,1),'*r')
 hold on;
 loglog(sort(X2(500,:)/min(X2(500,:)),2),sort(1-(cumsum(hist(X2(500,:),1000)))/1000,1),'ob')
 loglog(sort(X3(500,:)/min(X3(500,:)),2),sort(1-(cumsum(hist(X3(500,:),1000)))/1000,1),'^k')
 loglog(sort(X5(500,:)/min(X5(500,:)),2),sort(1-(cumsum(hist(X5(500,:),1000)))/1000,1),'+g')
 
 
 %%%% Calculate Alpha

[alpha, xmin, L]= plfit(X3(500,:))