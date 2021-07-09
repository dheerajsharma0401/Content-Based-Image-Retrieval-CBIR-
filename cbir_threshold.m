close all
clear
clc

% %=======================================================================
% This function run content based image retrieval using certain threshold
% Author: Arwan Ahmad Khoiruddin
% Date modified: 30 March 2016
% %=======================================================================

% folder for the images
imgpath = 'img_test';

% query image. Change your image name here
filename = '586.jpg';

% threshold set for minimum eucledian distance that is considered similar
th = 3.6e3;

imagepath = [imgpath '/' filename];
imgquery = imread(imagepath);

% get feature vectors
feature_query = featureVector(imgquery);
disp(['feature fector for query image has been extracted']);

% similarity matching using Eucledian distance
imglist = dir(imgpath);
for i=1:size(imglist,1)
    n = imglist(i).name;
    imgname = [imgpath '/' n];
    if (n(1) ~= '.')
        % only find vector for other file than the query
        if (~strcmp(imgname, imagepath))
            imgfind = imread(imgname);
            fvect(i, :) = featureVector(imgfind);
            eudist(i, :) = euclid(feature_query, fvect(i,:));
            disp(['feature fector and eucledian distance for ' imgname ' has been extracted']);
        end
    end
end

% choose highest similarity
% zero should not be choosen, so make it any number biggest
m = max(eudist);

modeudist = zeros(size(eudist,1), 1);
for i=1:size(eudist,1)
    if (eudist(i)==0)
        modeudist(i) = 2*m;
    else
        modeudist(i) = eudist(i);
    end
end

% find closest object according to eucledian distance
idxclosest = find(modeudist == min(modeudist));

% show query image
figure, 
imshow(imread(imagepath));
title('query image');

% find any image closest with certain threshold (th variable)

idxchosen = find(modeudist < th);

for i=1:length(idxchosen)
    figure, 
    imshow(imread([imgpath '/' imglist(idxchosen(i)).name]));
    title(['closest image on rank ' num2str(i)]);
end

clear filename imgfind imgname i n