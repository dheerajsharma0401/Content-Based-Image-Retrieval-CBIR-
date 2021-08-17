close all
clear
clc

% %=======================================================================
% This function run content based image retrieval 
% The output of this program is some images closest to query images
% 
% Before running this, you should run extractFeature.m first
% Please note that imgpath in extractFeature and cbir_threshold must be
% on the similar path
%
% Author: Dheeraj Sharma
% %=======================================================================

% folder for the images
imgpath = 'image.orig';

% query image. Change your image name here
filename = '420.jpg';

% number of similar images to be found
nsim = 10;

imagepath = [imgpath '/' filename];
imgquery = imread(imagepath);

% get feature vectors
feature_query = featureVector(imgquery);
disp(['feature fector for query image has been extracted']);

load('fvect.mat');

imglist = dir(imgpath);
for i=1:size(imglist,1)
    n = imglist(i).name;
    imgname = [imgpath '/' n];
    if (n(1) ~= '.')
        eudist(i,:) = euclid(feature_query, fvect(i,:));
    end
end

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

clear i n 

% show query image
figure, 
imshow(imread(imagepath));
title('query image');

for i=1:nsim
    % find closest object according to eucledian distance
    idxclosest = find(modeudist == min(modeudist));

    figure,
    imshow(imread([imgpath '/' imglist(idxclosest).name]))
    title(['closest image rank of ' num2str(i)]);
    
    modeudist(idxclosest) = m;
end

clear filename idxclosest imagepath imgname imgpath m
