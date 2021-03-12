function rgbimage = data2rgb(filename)
% DATA2RGB Converts ImageData.data from ThorLabs to RGB image data
%
% EXAMPLE USAGE
% filename = 'path\to\ImageData.data';
% rgbimage = data2rgb(filename);
% figure(1); clf; imshow(rgbimage); 
%
% NOTES
% (1) The final image size is expected to be 640x480
%
% HISTORY
% 2021-03-12 Updatred flip() function; uploaded to GitHub

% --- 

% Open ImageData.data and read into memory
fid = fopen(filename);
rgbimage = fread(fid, 1228800, 'uint8=>uint8');
fclose(fid);

% Resize and flip
rgbimage = permute(reshape(rgbimage, [4 640 480]), [3,2,1]);
rgbimage = flip(rgbimage(:,:,1:3),3);

end

