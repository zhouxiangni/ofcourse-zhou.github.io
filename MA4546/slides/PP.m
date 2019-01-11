function [n, T, C] = PP(lambda, T_sim, iseed)

 % demo   of   Poisson Process
 % Author :  Dr. Xiang Zhou
 % Department of Math, 
 % City University of Hong Kong 
 % xiang.zhou@cityu.eud.hk
  
 % input :  lambda  = rate parameter
 %             T_sim   :   only simulate PP up to this time
 %              iseed   :   for rng 
 
 %output :   n  = # of jumps
 %               T  = array with length n+1 
 %                      T(1) =0, the time of jump occurance
 %               C   =  array with length n+1 
 %                      C(1) = 0, the size of jump
  
  rng(iseed)


n=0; % # of particles arrived 

% Exp(lambda)
% first time of jump
T(1) = - 1/lambda.* log( rand() );
n=1;
 
while T(n) < T_sim
    tmp =  T(n)   - lambda* log( rand() ); 
    if (tmp > T_sim)
        break;
    else 
        n = n+1;      T(n) = tmp;
    end
end 


 % Jump size 
% Compound Poisson 
C = randn(n,1);
% Pure Posisson
%C = ones(n,1);


C=[ 0; C];
CSUM = cumsum(C);

T=[0 T];






    

