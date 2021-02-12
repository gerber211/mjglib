# Useful Matlab Code 
Just some handy Matlab notes 

### Binary blob outlines
Plot the outline of all binary blobs in an image\
*Keywords: binary blob outlines outlay overlay trace edges lines*

```matlab
[B, ~] = bwboundaries(BW, 'noholes');
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1);
end
```

### Create a folder if it doesn't exist
Checks the existance of a folder and, if it doesn't exist, creates it\
*Keywords: folder exists create folder check if*

```matlab
if ~exist(yourFolder, 'dir')
  mkdir(yourFolder);
end
```


### Burn text
Burns text into an RGB image, overwriting the pixel (matrix element) values\
*Keywords: *

```matlab
RGB = insertText(I, [yposition xposition], 'text');
```

### If variable check takes forever
In some installs of Matlab, when you type a variable/function that does not exist, Matlab will take *forever* to realize it doesn't exist. This happens because Matlab is searching all possible directories for that variable/function. In the Command Window, enter the following:\
*Keywords: missing variable function taking takes forever*

```matlab
restoredefaultpath
rehash toolboxcache
savepath
```

You can also try:
```matlab
s = settings;
s.matlab.desktop.currentfolder.History.PersonalValue = {''}
```

and then restart Matlab. 

### Fullscreen a figure
After creating a figure, add the following line to make it full screen.\
*Keywords: fullscreen figure full screen enlarge full window enlarge window figure*

```matlab
set(gcf, 'Position', get(0, 'Screensize'));
```

TODO:
---

image compare
imcompare
imoverlay
compare images
figure(10); clf; imshow(labeloverlay(im,gt,'Transparency',0.8));

---
fill holes... 
BW2 = imfill(BW,'holes');


natsort 
natural file sorting 
imsFiles = natsort(ims.Files); % !IMP, sort the file order so it makes sense...

ims = imageDatastore(fullfile('C:\Users\Matt Gerber\Desktop\2020-09-25 ERM Full Code\orig'), 'IncludeSubfolders', true);

remove small binary blobs
beneath certain size smaller than less than greater than
BW2 = bwareaopen(BW, 50);


try
    a = notaFunction(5,6);
catch
    warning('Problem using function.  Assigning a value of 0.');
    a = 0;
end



outputSize = {inputSize - [(F-1)*D+1]+2*P}/S + 1



Running the loop “backwards,” from numframes down to 1, is a common MATLAB programming trick to ensure that g is initialized to its final size the first time through the loop.

numframes = size(f, 4);
for k = numframes:-1:1
g(:, :, k) = rgb2gray(f(:, :, :, k));
end


---
switch to Python:
https://realpython.com/matlab-vs-python/



second smallest minimum element index indicies sort
[~,b] = mink(ds(:),2);


--

nice RPE detection...

D = zeros(size(A));

for ii = 1:xdim
    ints = unorm(A(:,ii));
    cs = unorm(cumsum(ints));
    cc = unorm(cs.*ints);
    D(:,ii) = cc;
end

D = unorm(A.*D);

figure(5); clf; imshow(D);



----

first 1 in every row nonzero
[~, B] = max(A,[],2);


---
% 2 x n of [min; max] of each col... 
    x = [min(a,[],1); max(a,[],1)];


----

clean get size find dimensions 
%get the dimensions of A
[nRow, nCol] = size(A);

----

get blob number based on pixel px coord coordinate

row = 42; % Whatever....
col = 123; % Whatever...
labeledImage = bwlabel(binaryImage);
blobNumber = labeledImage(row, column);

---

read .DAT .dat file fread fopen
filename = 'J:\PIGEYE DATA\2020-02-10 Return to RVC\Trial 01\Scans\VSCAN_0004.dat';
readmatrix(filename) 

---

two three largest max values in array matrix
[sortedX, sortedInds] = sort(X(:),'descend');
top3 = sortedInds(1:3)
And if you want to get the (i,j) reference into X, just follow with:
[i, j] = ind2sub(size(X), top3);



---

every other element only odd even
Aodd = A(1:2:end);          % Odd-Indexed Elements
Aeven = A(2:2:end);         % Even-Indexed Elements



---

get fullfile full file directory fullfolder folder full deep learning 
data = imageDatastore(fullfile('F:\OCT Scans\OR Data\2020-05-22 ERM\ptall'));




---


% find first last element of array vector 
V1 = find(V, 1, 'first')

---

% pad array with zeros
D = padarray(A, [topamt leftamt], 0, 'pre')

---
format string in labview with leading zeros
%04d
use "format into string" block

call library folder with all subfolders..
addpath(genpath('J:\mjglib'));
---

% find bottom pixel in each col
cs = sum(logical(cumsum(flipud(bw))));

% find top pixel in each col
% top-most topmost
cs = size(bw,1) - sum(logical(cumsum(bw))) + 1;

% rightmost left-most point in binary leftmost right-most
[rows, columns] = find(binaryImage);
leftColumn = min(columns);
topRow = min(rows);



---

distance to edge binary
bwdist

---
    amin = min(bscan_xy(:,2));
    adif = max(bscan_xy(:,2))-amin;
    sc = @(x) floor(399*(x-amin)/adif + 1);
B = arrayfun(sc, bscan_xy(:,2))
---
% increase = (new - init)/init * 100%
% decrease = (init - new)/init * 100%
% change = (new - old)/old * 100%

--

rectangle('Position', [XYpx(jj,1)-0.5, XYpx(jj,2)-0.5, 1, 1], 'FaceColor', [1 0 0 0.5], 'EdgeColor', [0 0 0 0]);

---

saturate 
function y = bound(x,bl,bu)
  % return bounded value clipped between bl and bu
  y=min(max(x,bl),bu);

xlb = 1;
xub = 5;
ylb = 1;
yub = 5;

a(:,1) = min(max(a(:,1),xlb), xub);
a(:,2) = min(max(a(:,2),ylb), yub);




---

hold on; colormap gray; %axis image;




remove warning image too large
warning('off', 'images:initSize:adjustingMag');


----
instead of max(max(I))... 
max(I(:))


---

percent change/difference

(new-old)/abs(old) * 100%

---


addToolbarExplorationButtons(gcf)


---

% Save 3 edges.
topEdge = binaryImage(1, :);
leftEdge = binaryImage(:, 1);
rightEdge = binaryImage(:, end);
% Zero 3 edges.
binaryImage(1, :) = false;
binaryImage(:, 1) = false;
binaryImage(:, end) = false;
% Get rid of blob(s) touching bottom edge
binaryImage = imclearborder(binaryImage);
% Restore the 3 edges.
binaryImage(1, :) = topEdge;
binaryImage(:, 1) = leftEdge ;
binaryImage(:, end) = rightEdge ;


---

sum count 
number of nonzero elements in row column
vert_histo = sum(bw==1,1);
horz_histo = sum(bw==1,2);

---

keep only largest binary blob...
bw = bwareafilt(bw,1);

---

maxk
get n largest elements 

[vals, idx] = sort(horz_histo, 1, 'descend');
then just vals(1:numIwant)


---


% don't save the figure, save the image (the data variable):

imwrite(intensity, ['scan' num2str(SCANS(ii),'%04i') '.png'], 'PNG');

---

convert number double to timestamp to mm:ss
B = datestr(totalTrialTimes(1), 'MM:SS')
DEOESN'T WORK?
m:s

---
remove warning image too large
warning('off', 'images:initSize:adjustingMag');


---
figure position height width window

set(h9, 'Position',  [50, 50, 300, 600]); % from left; from bot; width; height

----

remove rows of all zeros:

b = a(any(a,2),:);



---

IRISS ikine:

    t1 = -rad2deg(atan2(py, pz));
    t2 = -rad2deg(atan2(px, sqrt(py^2 + pz^2)));
    d3 = sqrt(px^2 + py^2 + pz^2);
    

---
scale intensity:

s = (I - L1) / (L2-L1)
I is the image, L1 is min limit, L2 is max

----

if SAVE_ON
    imwrite(rgbImage, [DIRECTORY '\saves\scan' num2str(SCAN_NO,'%04i') '-webcam.png'], 'PNG');
end

if SAVE_ON
    saveas(gcf, [DIRECTORY '\saves\scan' num2str(SCAN_NO,'%04i') '-clickedPt.png'], 'png');
end


---

TOI is {O} -> {I}



saveas(gcf, [DIRECTORY '\figures\CT1_' num2str(SCAN_NO,'%04i') '.eps'], 'epsc')
saveas(gcf, [DIRECTORY '\figures\CT1_' num2str(SCAN_NO,'%04i') '.emf'], 'meta')
saveas(gcf, [DIRECTORY '\figures\CT1_' num2str(SCAN_NO,'%04i') '.jpg'], 'jpeg')

---


if v = [a b] is a unit (direction) vector, then a vector perpendicular to it 
is: v_perp = [-b a]
no need for the rotation matrix.


---


timestamp

['clines_backup' datestr(now,'yyyymmddHHMMSSFFF') '.mat']



---

set plot automatically to rotate

rotate3d on;


---
dist b/t pt and line segment

% a = any pt on the line 
% n = unit vector (direction of line)
n = [cline(2)-cline(1); cline(4)-cline(3); cline(6)-cline(5)];
n = n/norm(n);
% p = pt we're interested inf
% distance between line segment (cline) and p_cann
derror = norm( (a-p) - (dot((a-p),n))*n );




---
point_cloud code!
pointCloud
point cloud

XYZind = find(point_cloud);
    
    % Convert to XYZ values [px]
    [zz, xx, yy] = ind2sub(size(point_cloud), XYZind);
    
    % Notation change [px]
    XYZ_px = [xx yy zz];
   
    % Shave off end slices (near tool tip) ~2-3 mm
    XYZ_px( all(XYZ_px(:,2) >= XYZ_px(end,2)-80, 2), :) = [];

    % Reduce total on-tool points to ~5000
    for N = 1:100
        XYZ_px_use = XYZ_px(1:N:length(XYZ_px), :);
        if size(XYZ_px_use, 1) < 5000
            break;
        end
    end
    
    % Convert XYZ pts to [mm]
    XYZ_mm = bsxfun(@times, XYZ_px_use, ratio_mm);






---

standard rot abt Z in 2D 
rotation matrix rotate

R = [cos(theta) -sin(theta); sin(theta) cos(theta)]


---

find all open figure numbers 


figHandles = findobj('Type', 'figure')

---

get the n largest values in array
[sortedX, sortedInds] = sort(X(:),'descend');
top3 = sortedInds(1:3)
And if you want to get the (i,j) reference into X, just follow with:
[i, j] = ind2sub(size(X), top3);



---

ind = [3 4 5 6];
sz = [3 3];
[row,col] = ind2sub(sz,ind)
so ind could be find(binary)

---

convert to mm...

    XYZ_mm = bsxfun(@times, XYZ_px, ratio_mm);


---

fit a 2D line

% fit a line 
ft2 = fittype('poly1');
% help fittype
cf2 = fit([pt1(1); pt2(1)], [pt1(2); pt2(2)], ft2);

plot(cf2, 'fit', 0.95); % number is conf interval...? 
% hcf.Color = 'b';

--

% remove noise
% slice_image = bwareaopen(slice_image, 3);

---


% fit a 3d line (SVD method)
from here: https://www.mathworks.com/matlabcentral/answers/78363-3d-line-of-best-fit


% fit a line...
% Suppose the rows of xyz are your data points,
t0 = mean(cent_mm);
xyz = bsxfun(@minus, cent_mm, t0);
[~, ~, V] = svd(xyz, 0);
% The parametric equation is
    t = linspace(-10, 10, 2);
    xfit = t0(1) + t*V(1,1);
    yfit = t0(2) + t*V(2,1);
    zfit = t0(3) + t*V(3,1);
 
  plot3([xfit(1) xfit(end)], [yfit(1) yfit(end)], [zfit(1) zfit(end)], 'b-');


---

centroid

s = regionprops(BW,'centroid');
centroids = cat(1,s.Centroid);
plot(centroids(:,1),centroids(:,2),'b*')

---
pegged for removal; peg 
    % Remove: Rough centerpoints pegged for removal
remove all zeros zero
    centerpts(all(centerpts== 0, 2), :) = [];




filename = [SCAN_DIRECTORY '\Model3D_' num2str(SCAN_NO,'%04i')];

note: no commas...

---


num2str(SCAN_NO,'%04i')

---

Draw a horizontal line at y=10:

line(xlim, [10 10])

Draw vertical line at x=5:

line([5 5], ylim)



---

scale and/or normalize

% scale [min, max] to [a,b]
% f(x) = (b-a)(x-min)/(max-min) + a


% angle between two lines:

% point (x1,y1) to (x2,y2), angle of this line segment is:
% angle = atan2(y2-y1, x2-x1);


The angle between two three-element vectors, P1 and P2, can be calculated using matlab in the following way:
a = atan2(norm(cross(P1,P2)),dot(P1,P2)); % Angle in radians

---


dbstop error (automatically puts you in debug mode stopped at the line that triggers an error)

---

Directly extracting the elements of a matrix that satisfy a particular condition, using logical arrays:

x = rand(1,50) .* 100;
xpart = x( x > 20 & x < 35);
Now xpart contains only those elements of x which lie in the specified range.


---

Using the built-in profiler to see where the hot parts of my code are:

profile on
% some lines of code
profile off
profile viewer

---

visualize a matrix:
imagesc(matrix)

---

output plots for printing/figures...

set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [6.25 7.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6.25 7.5]);

set(gcf, 'renderer', 'painters');
print(gcf, '-dpdf', 'my-figure.pdf');
print(gcf, '-dpng', 'my-figure.png');
print(gcf, '-depsc2', 'my-figure.eps');

---




These are the most important two things to keep in mind when you are writing code:

1. Don't write code that you've already written. (Do not copy and paste!)
2. Don't write code that you don't need to write.
3. Write as little code as possible. 

Fail gracefully. (Better the output doesn't make sense, then no output [except an error] at all). 


---






