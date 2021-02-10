function figp(v)
% FIGP Plots a vector in a new figure window.
%
% EXAMPLE USAGE
% v = linspace(1,10,100); 
% figp(v);
% 
% HISTORY
% 2021-02-10 Final version; MJG

% --- 

% Open a new figure window and plot the vector, adding the grid
figure; plot(1:length(v), v, 'r.'); grid on;

end