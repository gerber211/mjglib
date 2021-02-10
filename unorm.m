function B = unorm(A)
% FUNCTION NAME:
%   unorm
%
% DESCRIPTION:
%   Normalizes all values of a matrix or vector to [0,1]
%
% INPUT:
%   A - (double) A matrix or vector 
%
% OUTPUT:
%   B - (double) A normalized matrix or vector with all elements in [0,1]
%
% REVISION HISTORY:
%   2021-02-10 - mjg
%       * Initial implementation

% --- 

% force to double
A = double(A);

% Perform scaling; Form is:
% B = (A - min) / (max - min)
B = (A - min(A(:))) / (max(A(:)) - min(A(:)));

end