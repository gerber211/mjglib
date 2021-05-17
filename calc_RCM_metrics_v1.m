% Determine RCM from set of endpts and calculate various metrics
% Last update: 2021-05-17 MJG 
% Endpoint data should be stored in RCMpts.mat file
% where 
    % rcmpts1 = n x 3 matrix where each row is a XYZ coord of point 1
    % rcmpts1 = n x 3 matrix where each row is a XYZ coord of point 2

% path to RCMpts.mat
filename = 'RCMpts.mat';

% Retrieve centerline data
load(filename)

% plot the centerlines
figure(1); clf;
for ii = 1:size(rcmpts1, 1)
    plot3([rcmpts1(ii,1) rcmpts2(ii,1)], ...
          [rcmpts1(ii,2) rcmpts2(ii,2)], ...
          [rcmpts1(ii,3) rcmpts2(ii,3)], 'b-');
    if ii == 1; hold on; grid on; axis equal; end 
end
xlabel('x'); ylabel('y'); zlabel('z');



% ----- H_2 norm RCM detection ----- %

% Centerline vector
cvec = rcmpts1' - rcmpts2';
n = size(cvec,2);

% Build 'b' matrix; tall and skinny; note the negative sign
b = reshape(-rcmpts1', 3*n, 1); 

% Form 'A' matrix: first col is -I (3x3), rest is block diagonal
a_cell = cell(1,n);
for i = 1:n
    a_cell{i} = cvec(1:3,i);
end
A = [ repmat(-eye(3), n, 1) blkdiag(a_cell{:}) ];

% Least-squares soln. 
x = A\b;

% Extract RCM point [mm]
p_2norm = x(1:3,1);

% plot it
figure(1); 
plot3(p_2norm(1),p_2norm(2),p_2norm(3),'ro');
text(p_2norm(1),p_2norm(2),p_2norm(3),'p_2');


% ----- RCM Performance Metrics ----- %
d_2norm = zeros(n,1);

for k = 1:n

    % Any two points on the line; convert notation
    Q1 = rcmpts1(k,:);
    Q2 = rcmpts2(k,:);

    % RCM points; convert notation
    P1 = p_2norm';
    
    % Calc distance from RCM to each line segment and store
    d_2norm(k) = norm(cross(Q2-Q1,P1-Q1))/norm(Q2-Q1);
        
end


% ----- Statistical Measures and outputs ----- %
clc;
p_2norm
disp(  'd metrics for H_2 norm (OCT Frame)' );
disp([ 'Mean of d: ', num2str( mean(d_2norm) ), ' [mm]' ]);
disp([ 'RMS of d:  ', num2str(  rms(d_2norm) ), ' [mm]' ]);
disp([ 'Max d:     ', num2str(  max(d_2norm) ), ' [mm]' ]);
disp([ 'Min d:     ', num2str(  min(d_2norm) ), ' [mm]' ]);
disp([ 'std d:     ', num2str(  std(d_2norm) ), ' [mm]' ]);
disp([ 'n (samp size): ', num2str(  n ) ]);




