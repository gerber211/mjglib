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

meana = mean(A);
mediana = median(A);
stda = std(A);
mina = min(A);
maxa = max(A);
rmsa = rms(A);

stats = [meana mediana stda mina maxa rmsa];

fprintf('Mean: %f; Median: %f; STD: %f; Min: %f; Max: %f; RMS: %f\n', stats);

end