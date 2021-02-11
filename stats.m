function stats(A)
% SS Calculates and outputs simply summary statistics on a matrix or vector
%    This is similar to summary() in 2020b
%
% EXAMPLE USAGE
% ss(A); 
% 
% HISTORY
% 2021-02-11 Initial version; MJG

% --- 

% Matrices -> vectors
A = A(:);

% Calculate statistics
meana = mean(A);
mediana = median(A);
stda = std(A);
mina = min(A);
maxa = max(A);
rmsa = rms(A);

% Just for simplified notation
stats = [meana mediana stda mina maxa rmsa];

% Output to command window the stats; using floating-point numbers
fprintf('Mean: %f; Median: %f; STD: %f; Min: %f; Max: %f; RMS: %f\n', stats);

end
