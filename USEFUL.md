# Useful Matlab Code 
Just some handy Matlab notes 

### Files/Folders: Get all files in directory of specific type
Search directory and return all files of a specified type\

```matlab
allScans = dir([DDIR '*.raw']);
nScans = size(allScans, 1);
```

### Loops: Do something every n-th iteration
On a loop through ii, do something everything n-th iteration\
*Keywords: mod loop every nth n-th iteration*

```matlab
if mod(ii, nn) == 0
% do something
end
```

### Files/Folders: Add training slash if one doesn't exist 
Adds trailing slash to string if it does not exist\
*Keywords: trailing slash folder file path*

```matlab
if PATH_2_LABELS(end) ~= filesep
    PATH_2_LABELS(end+1) = filesep;
end 
```

### Binary: xy points to binary
Convert a set of xy coordinates (points) to a binary image \
*Keywords: xy x,y points coordinates binary ind2sub sub2ind*

```matlab
bw = false(m, n); 
idx = sub2ind(size(bw), y, x);
bw(idx) = true;
```

### Binary: Blob outlines
Plot the outline of all binary blobs in an image\
*Keywords: binary blob outlines outlay overlay trace edges lines*

```matlab
[B, ~] = bwboundaries(BW, 'noholes');
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 1);
end
```

### Files/Folders: Create a folder if it doesn't exist
Checks the existance of a folder and, if it doesn't exist, creates it\
*Keywords: folder exists create folder check if*

```matlab
if ~exist(yourFolder, 'dir')
  mkdir(yourFolder);
end
```

### Images: Burn text
Burns text into an RGB image, overwriting the pixel (matrix element) values\
*Keywords: burn text rgb insert text*

```matlab
RGB = insertText(I, [yposition xposition], 'text');
```

### Matlab: If variable check takes forever
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

### Images: Fullscreen a figure
After creating a figure, add the following line to make it full screen.\
*Keywords: fullscreen figure full screen enlarge full window enlarge window figure*

```matlab
set(gcf, 'Position', get(0, 'Screensize'));
```

### Deep Learning: Overlay labels atop original image
Used mainly in deep-learning code, quickly show a 'gt' label over the original image
*Keywords: image compare imcompare imoverlay compare images*

```matlab
figure(10); clf; 
imshow(labeloverlay(im, gt, 'Transparency', 0.8));
```

### Binary: Fill holes
Fill holes in binary blobs, where 'holes' are black pixels surrounded by white.\
*Keywords: fill holes binary imfill*

```matlab
bw = imfill(bw, 'holes');
```

### Deep Learning: Image Datastore
Stores all images in a directory into an imageDatastore object for easy and fast access.\
*Keywords: image datastore data store natsort*

```matlab
ims = imageDatastore(fullfile(path2file), 'IncludeSubfolders', true);
imsFiles = natsort(ims.Files)
```

Note: natsort() is from Stephen Cobeldick's code [here](https://www.mathworks.com/matlabcentral/fileexchange/47434-natural-order-filename-sort)

### Binary: Remove small blobs
Removes blobs from a binary image below a threshold area (pixel count)\
*Keywords: beneath certain size smaller than less than greater than*

```matlab
bw = bwareaopen(bw, pixelSizeThreshold);
```

### Math: Get the second-smallest/largest element
Get the value/index of the *second*-largest/smallest element in a vector\
*Keywords: second smallest largest biggest minimum maximum element index indicies sort*

```matlab
% minimum
[a,b] = mink(vector, 2);
% maximum
[a,b] = maxk(vector, 2);
```

### Binary: First '1' in every row/col
Gets the indices of the first (top-down/left-right) non-zero element of each row/col\
*Keywords: first 1 in every row nonzero*

```matlab
% row
[~, B] = max(A, [], 2);
% col 
x = [min(a,[],1); max(a,[],1)];
```

### Binary: Blob location
Get a binary blob number based on pixel coordinates\
*Keywords: *

```matlab
labeledImage = bwlabel(binaryImage);
blobNumber = labeledImage(row, col);
```

### Math: Maximum values in array matrix
Get the top-3 largest values in a Matrix\

```matlab
[sortedX, sortedInds] = sort(X(:), 'descend');
top3 = sortedInds(1:3)

% And if you want to get the (i,j) reference into X, just follow with:
[i, j] = ind2sub(size(X), top3);
```

### Math: Select every other element
Get even or odd numbers in a vector\
*Keywords: even odd vector*

```matlab
Aodd = A(1:2:end);          % Odd-Indexed Elements
Aeven = A(2:2:end);         % Even-Indexed Elements
```

### Binary: Find first/last instance
Find the first/last instance of a value in a vector\

```matlab
a = find(V, 1, 'first');
a = find(V, 1, 'last');
```

### Binary: Find bottom/top/left/right pixel in each column/row
Find the top-, bottom-, left-, or right-most pixel in each column or row in a binary image\

```matlab
% find bottom pixel in each col
cs = sum(logical(cumsum(flipud(bw))));

% find top pixel in each col
cs = size(bw,1) - sum(logical(cumsum(bw))) + 1;

% left-most point in binary leftmost right-most
[rows, columns] = find(binaryImage);
leftColumn = min(columns);
topRow = min(rows);
```

### Binary: Distance to edge
For each pixel in a binary image, calculate the distance to the edge of a binary blob\
*Keywords: distance to edge binary*

```matlab
bwdist
```

Explanation [here](https://www.mathworks.com/help/images/ref/bwdist.html).

### Math: Percent Increase/Decrease/Change Functions
The simple formulas for percent increase/decrease/change in matlab\

```matlab
increase = (new - old)/old * 100;
decrease = (old - new)/old * 100;
change = (new - old)/old * 100;
```

### Images: Matlab Rectangle
Plots a rectangle into the figure window\

```matlab
rectangle('Position', [x y w h], 'FaceColor', [1 0 0 0.5], 'EdgeColor', [0 0 0 1]);
```

where `[x y w h]` is the top-left pixel location (x,y) and the width (w) and height (h). The fourth element in the Color definitions is transparency (alpha). 

### Matlab: Remove warning 'image too large'
Silence Matlab's warning about plotting an image that's larger than the screen\
*Keywords: remove warning image too large*

```matlab
warning('off', 'images:initSize:adjustingMag');
```

### Binary: Remove blobs touching an edge
This example is to remove blobs touching the bottom edge of a binary image\

```matlab
% Save the three edges we want to keep
  topEdge = binaryImage(1, :);
 leftEdge = binaryImage(:, 1);
rightEdge = binaryImage(:, end);

% Zero those three edges
binaryImage(1, :) = false;
binaryImage(:, 1) = false;
binaryImage(:, end) = false;

% Remove all blobs touching all sides
% After the previous steps, there are only blobs touching the bottom
binaryImage = bwclearborder(binaryImage);

% Restore the three original edges 
binaryImage(1, :) = topEdge;
binaryImage(:, 1) = leftEdge;
binaryImage(:, end) = rightEdge;
```

Note: `bwclearborder` can be found [here](https://github.com/gerber211/mjglib/blob/main/bwclearborder.m). If you don't want to download my custom function, you can use Matlab's built-in `imclearborder` function (but it's slower).

### Binary: Sum number of nonzero elements in row/column
Get vertical or horiztonal sums of nonzero elements\

```matlab
vert_count = sum(bw==1, 1);
horz_count = sum(bw==1, 2);
```

### Binary: Keep/Retain largest n blobs
Remove all blobs from a binary image except the *n* largest (retain n largest blobs)

```matlab
bw = bwareafilt(bw, n);
```

### Math: Get *n* largest elements
The the *n* largest elements in a vector. Note, this can also be done with Matlab's `maxk` function.

```matlab
[vals, ~] = sort(v, 1, 'descend');
values = vals(1:n);
```

### Images: Save image data
There are two ways of saving an image: `saveas` and `imwrite`. For raw data, `imwrite` is much *much* better. For Matlab figure windows (with overlays and plotted lines and so on), the only option is `saveas`. 

```matlab
% save matrix of data as image
imwrite(im, 'filename.png', 'png');

% save Matlab figure window as image
saveas(gcf, 'filename.png', 'png');
```

### Matrices: Remove rows of all zeros, two ways
Method 1: From a matrix `A`, remove all rows that contain nothing but zeros and save the result as matrix `B`\
Method 2: For a matrix `A`, remove all rows that contain nothing but zeros, overwriting the original matrix `A`

```matlab
% Method 1 
B = A(any(A,2),:);
% Method 2
A(all(A==0, 2), :) = [];
```

### Images: Scale Intensity
Scale a matrix (image) `I` to be between `L1` (min) and `L2` (max)

```matlab
s = (I - L1) / (L2-L1)
```

Note: This is essentially the same thing that `mat2gray` is doing, but without all the overhead and checks. 

### Geometry: Distance between a point and a line segment
The Euclidean distance between a 3D point and a 3D line segment\

```matlab
% cline = [x1 x2 y1 y2 z1 z2], the 3D line segment
% Calculate n = unit vector (direction of line)
n = [cline(2)-cline(1); cline(4)-cline(3); cline(6)-cline(5)];
n = n/norm(n);

% a = any point on the line, for example: a = [cline(1); cline(3); cline(6)]
% p = point we're interested in
distance = norm( (a-p) - (dot((a-p),n))*n );
```

### OCT: Convert a 3D binary matrix to XYZ points
Given `point_cloud`, a 3D matrix of binary elements, convert it into XYZ points in the form of XYZ_pz = [x1 y1 z1; x2 y2 z2; ...]\
*Keywords: point_cloud pointCloud point cloud*

```matlab
% Get indicees of all non-zero elements
XYZind = find(point_cloud);
    
% Convert to XYZ values [px]
[zz, xx, yy] = ind2sub(size(point_cloud), XYZind);
    
% Re-order and change notation for easy use
XYZ_px = [xx yy zz];
```

### OCT: Convert XYZ points to [mm]
Used primarily in ThorLabs OCT data processing, convert an *n* by 3 matrix of XYZ points in \[px\] to the same in \[mm\], where `ratio_mm` is something like `[0.025 0.025 0.0089]` (the mm/px ratio of the system)

```matlab
XYZ_mm = bsxfun(@times, XYZ_px, ratio_mm);
```

### Math: Fit a 2D line 
Easy 2D interpolation\
*Keywords: polyfit fit line interpolation*

```matlab
cf = fit(xpoints, ypoints, fittype('poly1'));
hcf = plot(cf, 'fit', 0.95);
hcf.Color = 'b';
```

### Binary: Remove 'noise'
Internal Matlab function for removing binary blobs smaller than a certain size (here, 3)

```matlab
bw = bwareaopen(bw, 3);
```

### Geometry: Fit a 3D line
Fit a line to 3D points using SVD method; from [here](https://www.mathworks.com/matlabcentral/answers/78363-3d-line-of-best-fit)

```matlab
% Suppose dpoints are your 3D data points
t0 = mean(dpoints);
xyz = bsxfun(@minus, dpoints, t0);
[~, ~, V] = svd(xyz, 0);

% The parametric equation (over the range of t) is:
t = linspace(-10, 10, 2);
xfit = t0(1) + t*V(1,1);
yfit = t0(2) + t*V(2,1);
zfit = t0(3) + t*V(3,1);

% Plot:
plot3([xfit(1) xfit(end)], [yfit(1) yfit(end)], [zfit(1) zfit(end)], 'b-');
```

### Binary: Centroid 
Finding and plotting centroids\

```matlab
s = regionprops(bw, 'centroid');
centroids = cat(1,s.Centroid);
plot(centroids(:,1), centroids(:,2), 'bo');
```

### Files/Folders: Concatenate a string/filename
Useful for building filenames. As an example, let's say you have *n* images in the directory `C:\path\to\something\`. Each image is in the format: `filename_####.png`, where `####` is a four-digit string. To loop through each:

```matlab
SCAN_DIRECTORY = 'C:\path\to\something\';
for ii = 1:n
  filename = [SCAN_DIRECTORY '\filename_' num2str(ii, '%04i') '.png'];
  % do something with filename... 
end
```
Notes: No commas are necessary. The function `num2str` takes two arguments. The first, `ii`, is the number you want to convert to a string. The second, `%04i`, indicates the format that converted number should be in. Here, this is saying 'make an integer and put zeros in front to make the final number four-digits long.' So if `ii=12`, then the output would be a string that reads `0012`. 

### Geometry: The angle between two 3D lines 
The angle between two three-element vectors, P1 and P2, can be calculated using matlab in the following way:

```matlab
a = atan2(norm(cross(P1,P2)),dot(P1,P2)); % Angle in [rad]
```
