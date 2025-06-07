% ----------------------------------------------------------------------- %
% This function is built in order to 
% find the weights of the Criteria(DFs/DSes)
% This function is the extended pritrization SF-AHP called OSF-AHP using a
% novel optimization algorithm, which applies Einistein Operations and
% index of optimism = "0.5" 
% Algorithm Designer: Dr. M.T. Ahvanooey (M.taleby@ieee.org)
% ----------------------------------------------------------------------- %
% INPUTS
%           SFPCM: Pairwise Matrix 
%           io: The index of optimism
% OUTPUTS
%           Lambda max: The largest eigen value
%           SWGMs: Normalized Weights
%           CR: Consistency Ratio
% ----------------------------------------------------------------------- %
% AUTHORS
%        Milad Taleby Ahvanooey et al., "A Novel Framework for
%        Assessing Determinant Risk Factors on Cyber (Dis)Trust
%        Behaviors of Netizens in Deepfakes, Engineering Applications of
%        Artificial Intelligence, Accepted on May 26, 2025.
% lAST UPDATE
%           November 2, 2024
% ----------------------------------------------------------------------- %
function [SWGMs,lambda_max, CR,CI,Er, RI]=OSFAHP(SFPCM, io)
  n = size(SFPCM,1);  % Number of criteria (DFs/DSes) 
  % Step 1: Initialize the weight vector for each criterion
  [RI]=RIF(n); % Random Index

    % Estimate the largest eigenvalue (lambda_max) using the weight matrix
    DefM=zeros(n,n);
    SI_matrix=zeros(n,n);
    for i = 1:n
        for j = 1:n
          mu_ij= SFPCM{i,j}.mu;
          nu_ij=SFPCM{i,j}.nu;
          pi_ij=SFPCM{i,j}.pi;
             % Including Einstein sum and product for SF-AHP Defuzzification.

            SI_matrix(i, j) = sqrt(abs(100*(mu_ij - pi_ij)^2 - (nu_ij -pi_ij)^2));
         
        end  
    end
        % Step 2: Calculate Defuzzified Matrix using Einstein Operations

    for i = 1:n
        for j = 1:n
            SI = SI_matrix(i, j);

            % Apply Einstein Sum and Product directly to SI using two
            % seprate functions defined at the buttom of this code.
            E_s = EinsitSumF(io, SI);
            E_p = EinProdF(io, SI);

            % Defuzzification using Einstein operations and io
            DefM(i, j) = io * sqrt(abs(E_p)) + ...
                                      (1 - io) * (1 / sqrt(abs(E_s)));
        end
    end
      % Normalizing the DefM time based on Columns (j)
      for j = 1:n
        col_s = sum(DefM(:, j));
        DefM(:, j) = DefM(:, j) / col_s;
       end

      % Calculating weights using the Geometric Mean Method.
      Geo_means = zeros(n, 1);
    for i = 1:n
        Geo_means(i) = prod(DefM(i, :))^(1/n);
    end
    SWGMs = Geo_means / sum(Geo_means);

    % Step 3: Compute Lambda Max
    lambda_max = sum((SWGMs' * DefM) ./ SWGMs');
    CI= (lambda_max - n)/(n - 1);
    %CI= max(CI,0);
    % if CI<0

    if RI==0
        CR=0;
    else
       CR =  CI / RI;
    end
    LambdaT= n+(0.1*(n-1)*RI);
   % CI=(LambdaT-n)/(n-1);
    Er=(LambdaT-n)/(n);

if CR<0.1
    fprintf('The consistency ratio is acceptable. (Milad Taleby Ahvanooey et al. DeepFakeR-MF!)\n')
else
    warning('The consistency ratio is not acceptable! (Milad Taleby Ahvanooey et al. DeepFakeR-MF!)\n')
end
end

% Einistein Product Function
function result = EinProdF(e, f)
result = (e*f)/ (1+(1-e)*(1-f));
end
% Einistein Sum Function
function result = EinsitSumF(e, f)
result = (e+f)/(1+e*f);
end