clear
clc
% The index of optimism (io) ... It should be given by the Risk Investigator.
io=0.5;
% The pairwise matrix
% (It should be composed using Spherical fuzzy pairwise comparison (SFPCM) scale by the Principal Investigator.)
SFPCM = {
    struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0);
    struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0);
    struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
     };

% SFPCM for MDF1-MDF3 criteria
%SFPCM = {
 %   struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.2, 'nu', 0.8, 'pi', 0.1);
  %  struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1);
   % struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1), struct('mu', 0.2, 'nu', 0.8, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
    %};
    % SFPCM for MDS1-MDS3 sub-criteria
   %SFPCM = {
   %struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.3, 'nu', 0.7, 'pi', 0.2);
   %struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.7, 'nu', 0.3, 'pi', 0.2);
   % struct('mu', 0.7, 'nu', 0.3, 'pi', 0.2), struct('mu', 0.2, 'nu', 0.8, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
   %};
       % SFPCM for MDS4-MDS6 sub-criteria
   %SFPCM = {
     %struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.7, 'nu', 0.3, 'pi', 0.2), struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1);
     %struct('mu', 0.3, 'nu', 0.7, 'pi', 0.2), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.7, 'nu', 0.3, 'pi', 0.2);
     %struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
     %};
% SFPCM for MDS7-MDS9 sub-criteria
   %SFPCM = {
     % struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0);
     %struct('mu', 0.2, 'nu', 0.8, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.7, 'nu', 0.3, 'pi', 0.2);
     %struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.2, 'nu', 0.8, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
     %};
% SFPCM for EDF1-EDF3 criteria 
    %SFPCM = {
    %struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.2, 'nu', 0.8, 'pi', 0.1), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0);
    %struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0);
    %struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
    %};
% SFPCM for EDS1-EDS3 sub-criteria 
   % SFPCM = {
  % struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0);
   % struct('mu', 0.4, 'nu', 0.6, 'pi', 0.3), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.4, 'nu', 0.6, 'pi', 0.3);
    % struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
      % };
% SFPCM for EDS4-EDS6 sub-criteria 
   %SFPCM = {
  % struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.4, 'nu', 0.6, 'pi', 0.3), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0);
  %  struct('mu', 0.2, 'nu', 0.8, 'pi', 0.1), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.8, 'nu', 0.2, 'pi', 0.1);
%  struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
    % };
% SFPCM for EDS7-EDS9 sub-criteria 
   %SFPCM = {
    %struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0);
    %struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4), struct('mu', 0.9, 'nu', 0.1, 'pi', 0.0);
     %struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.1, 'nu', 0.9, 'pi', 0.0), struct('mu', 0.5, 'nu', 0.4, 'pi', 0.4);
    %};

     [SWGMs,lambda_max, CR,CI,Er, RI]=OSFAHP(SFPCM, io);