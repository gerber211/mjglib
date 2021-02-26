# Function List
List of functions and brief description: 

* [__unorm__](https://github.com/gerber211/mjglib/blob/main/unorm.m) - Normalizes a vector or matrix to \[0,1\] for all elements
* [__figp__](https://github.com/gerber211/mjglib/blob/main/figp.m)  - Plots a vector in a new figure window as red dots
* [__stats__](https://github.com/gerber211/mjglib/blob/main/stats.m) - Output summary statistics of a matrix or vector 
* [__circshift_columns__](https://github.com/gerber211/mjglib/blob/main/circshift_columns.m) - Circularly shift each column of a matrix by an amount specified in a vector; adopted and modified from Stuart Layton's code [here](https://www.mathworks.com/matlabcentral/fileexchange/37687-circular-shift-columns)
* [__bwclearborder__](https://github.com/gerber211/mjglib/blob/main/bwclearborder.m) - Clear true pixels touching the border of a binary image; This does the same thing as IMCLEARBORDER in Matlab, but is much faster and works only on binary images

# How to Use
Step-by-step instructions on use of the library:

1. Click on "Code" in the top-right (green button)
1. Select "Download ZIP"
1. Extract .zip file somewhere onto your computer;\ For example, to: 'C:\Program Files\MATLAB\R2020a\toolbox\mjglib-main'
3. Open Matlab (if not already open)
4. Type 'userpath' in the Command Window. It should give you something like 'C:\Users\Matt Gerber\Documents\MATLAB'
5. Create a Matlab file in that directory and save it as 'startup.m'
6. In startup.m, add the following code:

```matlab
% Define path to the library
path2mjglib = 'C:\Program Files\MATLAB\R2020a\toolbox\mjglib-main';

% Check if that folder exists 
if exist(path2mjglib, 'dir')
    % If it exists, add it (and all its sub-directories) to Matlab's search path
    addpath(genpath(path2mjglib));
    % Let the user know; this message appears on start-up
    disp('mjglib added to paths');
else
    % The path does not exist, so let the user know on start-up
    disp(['Warning: Path to mjglib not found at ' path2mjglib]);
    disp(['To remove this warning, edit startup.m in ' userpath])
end
```

If correctly done, the above steps will "permanently" add the folder 'mjglib-main' to Matlab's search path. Further reading [here](https://www.mathworks.com/matlabcentral/answers/116177-how-to-add-a-folder-permanently-to-matlab-path).
