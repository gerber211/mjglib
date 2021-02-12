function mjgos(A)
% MJGOS Calculates and outputs simply summary statistics on a matrix or vector
%    This is similar to summary() in 2020b
%
% EXAMPLE USAGE
% mjgos(A); 
% 
% EXAMPLE OUTPUT:
% Mean: 25.789198; Median: 18.962447; STD: 21.396650; Min: 0.434676; Max: 86.214617; RMS: 33.441309
%
% HISTORY
% 2021-02-11 Initial version; MJG
% 2021-02-12 Changed the name of the function to MJGOS.m

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
