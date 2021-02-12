function out = bwclearborder(bw,conn)
%Function to clear true objects touching the border of a binary image
%   This function will do the same thing as IMCLEARBORDER but only for 
%   binary images.  It is much faster for them.
%
%Input Arguments:
%   -bw: 2-dimensional binary image
%   
%   -conn: connectivity of connected components
%       -conn can be 4 or 8 for a 2-dimensional image (default: 4)
%       -See mathworks.com/help/images/ref/bwconncomp.html#bu2vpxm-1-conn
%        for description of connectivity
%
%Output Arguments:
%   -out = bw with all components connected by conn to the border turned
%       off, i.e. = 0. 
%

% ---

%Error checking and default assignment:
assert(islogical(bw),'The first input argument, bw, is expected to be of class logical\n  It was of class %s',class(bw));

% set conn to default of 4 if not specified 
if nargin == 1
    conn = 4;
end

%Components analysis; if it fails throw error from bwconncomp
CC = bwconncomp(bw,conn);

%Some sizes
NumObj = CC.NumObjects;
szbw = size(bw);
CCndx = false(NumObj,1);

%Loop through objects
for ii = 1:NumObj
    [r, c] = ind2sub(szbw,CC.PixelIdxList{ii}); %sub indices
    CCndx(ii) = ~(any([r; c] == 1)||any(reshape(bsxfun(@eq,[r c],szbw),2*length(c),1))); %test if on low or high border
end
    
%binary image save size as bw
out = false(szbw); 

%set objects that survived to true
out(cell2mat(reshape(CC.PixelIdxList(CCndx),[],1))) = true;

end