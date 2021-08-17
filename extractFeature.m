close all
clear
clc

% %=======================================================================
% This function computes the feature vector of each image
% The feature vector contains color moment and lbp
% This function should be run before running cbir_rank.m
% %=======================================================================

% folder for the images
imgpath = 'image.orig';

% finding feature vector of each images
imglist = dir(imgpath);
for i=1:size(imglist,1)
    n = imglist(i).name;
    imgname = [imgpath '/' n];
    if (n(1) ~= '.')
        imgfind = imread(imgname);
        fvect(i, :) = featureVector(imgfind);
        disp(['feature fector for ' imgname ' has been extracted']);
    end
end

save('fvect.mat','fvect');
