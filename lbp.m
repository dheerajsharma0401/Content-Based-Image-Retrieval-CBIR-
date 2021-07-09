function lbpval = lbp(image, R)

% %=======================================================================
% This function computes the LBP transformation of the input image
% Input_Im. 
% The parameters of the LBP operator are (P = 8, R), 
% where P - the number of sampling points in the region with the radius R. 
% Radius R is the input parameter of the function.
% Possible values for R = 1, 2, 3, etc.
% If input image is COLOR, then the grayscale transformation is performed.
% Author: Olegs Nikisins
% Modified by: Arwan Ahmad Khoiruddin
% Modification note: we find the histogram, not all the lbp values
% histogram is chosen because it will make the algorithm to be dependent to
% image size
% Last modified: 31 March 2016
% %=======================================================================

% if the input 
if size(image, 3) == 3
    image = rgb2gray(image);
end;
L = 2*R + 1; %% The size of the LBP label
C = round(L/2);

image = uint8(image);
row_max = size(image,1)-L+1;
col_max = size(image,2)-L+1;

tmpval = zeros(row_max, col_max);

for i = 1:row_max
    for j = 1:col_max
        A = image(i:i+L-1, j:j+L-1);
        A = A+1-A(C,C);
        A(A>0) = 1;
        tmpval(i,j) = A(C,L) + A(L,L)*2 + A(L,C)*4 + A(L,1)*8 + A(C,1)*16 + A(1,1)*32 + A(1,C)*64 + A(1,L)*128;
    end;
end;

lbpval = hist(tmpval(:), 255);