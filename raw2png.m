% RAW2PNG Converts *.raw ThorLabs OCT data to PNG files [0,1]
%
% NOTES
% (1) Requires unorm() - See GitHub/gerber211
% (2) To use: modify DDIR and SDIR then run 
%
% HISTORY
% 2021-04-30 Cleaned-up code and uploaded to GitHub

% --- 

% Directory where *.raw data is stored; include trailing '\'
DDIR = 'C:\path\to\raw\data\';
% Directory where to save PNG output data; include trailing '\'
SDIR = 'C:\path\to\save\dir\';

% --- 

% If SDIR doesn't exist, then make it
if ~exist(SDIR, 'dir')
    mkdir(SDIR);
end

% Get all .raw data in DDIR 
allScans = dir([DDIR '*.raw']);
% Count how many we have 
nScans = size(allScans, 1);

% Loop through all .raw data, generate OCT .png and save to SDIR 
for ii = 1:nScans
    
    % Notation: String of the current scan number 
    is = num2str(ii, '%04i');
    % Provide progress feedback to the user 
    clc; disp([is ' out of ' num2str(nScans,'%04i')]);
    
    % Open raw file, store in intensity matrix, then close reference 
    fid = fopen([DDIR allScans(ii).name]);
    intensity = fread(fid, 409600, 'float32'); 
    fclose(fid);

    % Reshape intensity matrix 
    intensity = reshape(intensity, [1024 400]);
    % Scale between typical intensity ranges
    intensity = unorm(mat2gray(intensity,[30 60]));
    % Resize to make into true aspect ratio 
    intensity = imresize(intensity, [376 400]);
    % Label the image
    intensity = insertText(intensity, [10 345], is);
    % insertText() adds color; remove it
    intensity = rgb2gray(intensity); 

    % Just a check
%     figure(1); clf; imshow(intensity); hold on;

    % Save the file into SDIR
    imwrite(intensity, [SDIR 'scan' is '.png'], 'PNG');
    
end