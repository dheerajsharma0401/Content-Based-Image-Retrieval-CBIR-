function colorMoments = colorMoment(image)

% %=======================================================================
% This function computes the color moment of the input image
% %=======================================================================

% convert from rgb to hsv
image = rgb2hsv(image);

% extract color channels
H = double(image(:, :, 1));
S = double(image(:, :, 2));
V = double(image(:, :, 3));

% vectorize each channel
H = H(:);
S = S(:);
V = V(:);

% compute color moments for each channel
meanH = mean(H);
stdH = std(H);
skwH = skewness(H);

meanS = mean(S);
stdS = std(S);
skwS = skewness(S);

meanV = mean(V);
stdV = std(V);
skwV = skewness(V);

% construct output vector
colorMoments = zeros(1, 9);
colorMoments(1, :) = [meanH, stdH, skwH, meanS, stdS, skwS, meanV, stdV, skwV];

end
