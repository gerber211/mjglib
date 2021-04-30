% PNG2MOVIE Assembles a folder of PNG files into a movie 
%
% NOTES
% (1) This meant to be run after raw2png()
%
% HISTORY
% 2021-04-30 Cleaned-up code and uploaded to GitHub

% --- 

% Directory where the PNG files are saved; include trailing '\'
SDIR = 'C:\path\to\save\dir\';
% Directory and name of the movie output file; no trailing '\'
filename = 'C:\path\to\movie\save\nameOfTheMovie';

% --- 

% Get all PNGs in SDIR
allPNGs = dir([SDIR '*.png']);

% Create video writer object 
% Note: This type seems to be best for embedding into Google Slides 
writerObj = VideoWriter(filename, 'Motion JPEG AVI');

% Adjust the framerate 
writerObj.FrameRate = 15;

% Loop through all PNGs and add to the movie file
open(writerObj);
for ii = 1:nScans
    clc; disp([num2str(ii, '%04i') ' out of ' num2str(nScans,'%04i')]);
    writeVideo(writerObj, imread([SDIR allPNGs(ii).name]));
end
close(writerObj);

